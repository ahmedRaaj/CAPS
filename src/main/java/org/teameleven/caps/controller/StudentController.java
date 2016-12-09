package org.teameleven.caps.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.NumberUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.teameleven.caps.model.EnroledCourse;
import org.teameleven.caps.model.Student;
import org.teameleven.caps.model.User;
import org.teameleven.caps.repository.CourseRepository;
import org.teameleven.caps.repository.EnroledCourseRepository;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    CourseRepository courseDao;
    @Autowired
    EnroledCourseRepository enrolDao;

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

    @RequestMapping("/view")
    public ModelAndView viewCourses() {

        ModelAndView v = new ModelAndView("/student/view-course");
        v.addObject("viewcourses", courseDao.findAll());
        return v;
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

    public static boolean isNumeric(String str)  
    {  
    try  
    {  
        double d = Double.parseDouble(str);  
    }  
    catch(NumberFormatException nfe)  
    {  
        return false;  
    }  
    return true;  
}
    
    @RequestMapping("/doenroll")
    public ModelAndView doEnrolment(HttpServletRequest req) {
        List<String> cIds = new ArrayList<>(req.getParameterMap().keySet());
        User u = (User) req.getSession().getAttribute("user");
        Integer studentId = u.getStudent().getStudentId();

        for (String cId : cIds) 
        {
            if (cId != null && !cId.equals("") && isNumeric(cId)) {
                int ci = Integer.parseInt(cId);
                EnroledCourse ec = new EnroledCourse(studentId, ci);
                ec.setGradePoint(null);
                ec.setStartingDate("2014/02/02");
                ec.setStatus("submited");
                enrolDao.save(ec);
            }
        }
        enrolDao.flush();

        return getDebug("done");
    }

}
