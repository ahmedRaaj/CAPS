package org.teameleven.caps.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.NumberUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.teameleven.caps.business.EnrollStatus;
import org.teameleven.caps.business.UserRole;
import org.teameleven.caps.business.Util;
import org.teameleven.caps.model.EnroledCourse;
import org.teameleven.caps.model.Student;
import org.teameleven.caps.model.User;
import org.teameleven.caps.repository.CourseRepository;
import org.teameleven.caps.repository.EnroledCourseRepository;
import org.teameleven.caps.repository.UserRepository;
import org.springframework.web.bind.annotation.RequestParam;
import org.teameleven.caps.repository.StudentRepository;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    CourseRepository courseDao;
    @Autowired
    EnroledCourseRepository enrolDao;
    @Autowired
    StudentRepository studDao;
    @Autowired
    UserRepository userDao;

    private ModelAndView getDebug(String Message) {
        ModelAndView m = new ModelAndView("debug");
        m.addObject("message", Message);
        return m;
    }

    @RequestMapping("/Mainpage")
    public ModelAndView StudentMain(HttpServletRequest req) {
        User user = (User) req.getSession().getAttribute("user");
        Student s = null;
        ModelAndView v = new ModelAndView("/studentMainPage");
        if (user == null) {
            v = new ModelAndView("/unauthorize");
        } else {
            v.addObject("user", user);
            v.addObject("student", s);
        }

        return v;
    }
    
//    @RequestMapping("/profile")
//    public ModelAndView studentProfile(@RequestParam int userId ) {
//        
//        ModelAndView mav = new ModelAndView("/student/student-profile");
//        mav.addObject("user", userDao.findOne(userId));
//        return mav;
//    }
    
    @RequestMapping("/profile")
    public ModelAndView studentProfile(HttpServletRequest req) {
        
        ModelAndView mav = new ModelAndView("/student/student-profile");
        //mav.addObject("student", studDao.findOne(5));
        mav.addObject("user", userDao.findOne(5)); //need to go according to User Session.
        return mav;
    }

    @RequestMapping("/view")
    public ModelAndView viewCourses(HttpServletRequest req) {
        if (req.getSession().getId() != null) {
            ModelAndView v = new ModelAndView("/student/view-course");
            User user = (User) req.getSession().getAttribute("user");
            List<EnroledCourse> ec = null;
            if (user != null&&user.getRole() .equals( UserRole.student.name())) {
                v.addObject("student", user.getStudent());
                ec = enrolDao.findAll().stream().filter(e -> Objects.equals(e.getStudent().getStudentId(), user.getStudent().getStudentId())).collect(Collectors.toList());
                v.addObject("viewcourses", ec);
                return v;
            }

        }
            return new ModelAndView("unauthorize");
        
    }

    @RequestMapping("/grade")
    public ModelAndView viewGrade() {

        ModelAndView v = new ModelAndView("/student/grade");
        v.addObject("enroledcourses", enrolDao.findAll());
        return v;
    }

    @RequestMapping("/enroll")
    public ModelAndView viewEnrolment(HttpServletRequest req) {
        User user = (User) req.getSession().getAttribute("user");
        Student s = null;
        if (user != null && user.getStudent() != null) {
            s = user.getStudent();
        }
        ModelAndView v = new ModelAndView("/student/course-enrolment");
        v.addObject("courses", courseDao.findAll());
        v.addObject("student", s);
        return v;
    }

    @RequestMapping("/doenroll")
    public ModelAndView doEnrolment(HttpServletRequest req) {
        List<String> cIds = new ArrayList<>(req.getParameterMap().keySet());
        User u = (User) req.getSession().getAttribute("user");
        Integer studentId = u.getStudent().getStudentId();

        Calendar cal = Calendar.getInstance();
        SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy");
        int yr = cal.get(Calendar.YEAR);
        int mo = cal.get(Calendar.MONTH);

        Date startDate = null;
        Date endDate = null;

        String stDate = "01-08-" + yr;
        if (mo >= 8) {
            cal.add(Calendar.YEAR, 1);
            stDate = "01-02-" + yr;
        }

        try {
            startDate = df.parse(stDate);
        } catch (ParseException ex) {
            Logger.getLogger(StudentController.class.getName()).log(Level.SEVERE, null, ex);
        }

        for (String cId : cIds) {
            if (cId != null && !cId.equals("") && Util.isNumeric(cId)) {
                int ci = Integer.parseInt(cId);
                EnroledCourse ec = new EnroledCourse(studentId, ci);

                cal.setTime(startDate);
                int dur = Integer.parseInt(courseDao.findOne(ci).getDuration());
                cal.add(Calendar.DAY_OF_MONTH, dur);
                endDate = cal.getTime();

                ec.setGradePoint(null);
                ec.setStartingDate(stDate);
                ec.setEndingDate(df.format(endDate));
                ec.setStatus(EnrollStatus.PENDING.name());
                enrolDao.save(ec);
            }
        }
        enrolDao.flush();

        return getDebug("Completed, please check ");
    }

}
