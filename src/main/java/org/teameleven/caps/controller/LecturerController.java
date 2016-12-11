/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.teameleven.caps.business.EnrollStatus;
import org.teameleven.caps.model.Course;
import org.teameleven.caps.model.EnroledCourse;
import org.teameleven.caps.model.EnroledCoursePK;
import org.teameleven.caps.model.Lecturer;
import org.teameleven.caps.model.Student;
import org.teameleven.caps.model.User;
import org.teameleven.caps.repository.CourseRepository;
import org.teameleven.caps.repository.EnroledCourseRepository;
import org.teameleven.caps.repository.LecturerRepository;

/**
 *
 * @author ahmedraaj
 */
@Controller
@RequestMapping("/lecturer")
public class LecturerController {

    @Autowired
    EnroledCourseRepository enrolDao;
    @Autowired
    CourseRepository courseDao;
    @Autowired
    LecturerRepository lecDao;

    @RequestMapping("/Mainpage")
    public ModelAndView LecturerMain(RedirectAttributes redirectAttributes, HttpServletRequest req) {
        User user = (User) req.getSession().getAttribute("user");
        ModelAndView v = new ModelAndView("/lecturerMainpage");
        if (user == null) {
            v = new ModelAndView("/unauthorize");
        } else {
            v.addObject("user", user);
        }

        return v;
    }

    @RequestMapping("/gradecourse")
    public ModelAndView gradeCourse(HttpServletRequest req,RedirectAttributes rd)//@RequestParam("lecturerId")String lecturerId)
    {

        ModelAndView v = new ModelAndView("/lecturer/gradeACourse");
        String pageId = req.getParameter("pageId");
        int pId = 0;
        if (pageId != null && !pageId.equals("")) {
            pId = Integer.parseInt(pageId);
            v.addObject("pageId", pId);
        }
        PageRequest prEnrol = new PageRequest(pId, 10);
        int sizeEnrol = enrolDao.findAll().size();
        int countEnrol = sizeEnrol / 10 + (sizeEnrol % 10 == 0 ? 0 : 1);
        Page<EnroledCourse> pgEnrol = enrolDao.findAll(prEnrol);

        PageRequest pr = new PageRequest(pId, 5);
        int size = courseDao.findAll().size();
        int count = size / 5 + (size % 5 == 0 ? 0 : 1);
        Page<Course> pg = courseDao.findAll(pr);

        v.addObject("enroledcourses", pgEnrol.getContent());
        v.addObject("courses", courseDao.findAll());
        //  v.addObject("count", count);
        v.addObject("countEnrol", countEnrol);
//        return v;
    if(req.getAttribute("courseId") == null || req.getAttribute("courseId").equals("")){
        rd.addAttribute("courseId", 1);
    }
      return new ModelAndView("redirect:filter.course");
    }

    @RequestMapping("/viewperformance")
    public ModelAndView viewPerformance(HttpServletRequest req) {

//        ModelAndView v = new ModelAndView("/lecturer/viewAStudentPerformance");
//        v.addObject("enroledcourses", enrolDao.findAll());
//         v.addObject("courses",courseDao.findAll());
//        return v;
        ModelAndView v = new ModelAndView("/lecturer/viewAStudentPerformance");
        String pageId = req.getParameter("pageId");
        int pId = 0;
        if (pageId != null && !pageId.equals("")) {
            pId = Integer.parseInt(pageId);
            v.addObject("pageId", pId);
        }
        PageRequest prEnrol = new PageRequest(pId, 10);
        int sizeEnrol = enrolDao.findAll().size();
        int countEnrol = sizeEnrol / 10 + (sizeEnrol % 10 == 0 ? 0 : 1);
        Page<EnroledCourse> pgEnrol = enrolDao.findAll(prEnrol);

        PageRequest pr = new PageRequest(pId, 5);
        int size = courseDao.findAll().size();
        int count = size / 5 + (size % 5 == 0 ? 0 : 1);
        Page<Course> pg = courseDao.findAll(pr);

        v.addObject("enroledcourses", pgEnrol.getContent());
        v.addObject("courses", courseDao.findAll());
        //  v.addObject("count", count);
        v.addObject("countEnrol", countEnrol);
        return v;
    }

    @RequestMapping("/viewenrolment")
    public ModelAndView viewEnrollment(HttpServletRequest req) {
//        ModelAndView v = new ModelAndView("/lecturer/viewCourseEnrolment");
//        v.addObject("enroledcourses", enrolDao.findAll());
//         v.addObject("courses",courseDao.findAll());
//        return v;

        ModelAndView v = new ModelAndView("/lecturer/viewCourseEnrolment");
        String pageId = req.getParameter("pageId");
        int pId = 0;
        if (pageId != null && !pageId.equals("")) {
            pId = Integer.parseInt(pageId);
            v.addObject("pageId", pId);
        }
        PageRequest prEnrol = new PageRequest(pId, 10);
        int sizeEnrol = enrolDao.findAll().size();
        int countEnrol = sizeEnrol / 10 + (sizeEnrol % 10 == 0 ? 0 : 1);
        Page<EnroledCourse> pgEnrol = enrolDao.findAll(prEnrol);

        PageRequest pr = new PageRequest(pId, 5);
        int size = courseDao.findAll().size();
        int count = size / 5 + (size % 5 == 0 ? 0 : 1);
        Page<Course> pg = courseDao.findAll(pr);

        v.addObject("enroledcourses", pgEnrol.getContent());
        v.addObject("courses",courseDao.findAll());
        //  v.addObject("count", count);
        v.addObject("countEnrol", countEnrol);
        return v;
    }

    @RequestMapping("/viewcourses")
    public ModelAndView viewCoursesTaught(HttpServletRequest req) {

//        ModelAndView v = new ModelAndView("/lecturer/viewCourseTaught");
//        v.addObject("courses", courseDao.findAll());
//         
//        return v;
        ModelAndView v = new ModelAndView("/lecturer/viewCourseTaught");
        String pageId = req.getParameter("pageId");
        int pId = 0;
        if (pageId != null && !pageId.equals("")) {
            pId = Integer.parseInt(pageId);
            v.addObject("pageId", pId);
        }
        PageRequest prEnrol = new PageRequest(pId, 10);
        int sizeEnrol = enrolDao.findAll().size();
        int countEnrol = sizeEnrol / 10 + (sizeEnrol % 10 == 0 ? 0 : 1);
        Page<EnroledCourse> pgEnrol = enrolDao.findAll(prEnrol);

        PageRequest pr = new PageRequest(pId, 5);
        int size = courseDao.findAll().size();
        int count = size / 5 + (size % 5 == 0 ? 0 : 1);
        Page<Course> pg = courseDao.findAll(pr);

        //v.addObject("enroledcourses", pgEnrol.getContent());
        v.addObject("courses", pg.getContent());
        v.addObject("count", count);
        //v.addObject("countEnrol", countEnrol);
        return v;
    }

    private ModelAndView getDebug(String Message) {
        ModelAndView m = new ModelAndView("debug");
        m.addObject("message", Message);
        return m;
    }

    @RequestMapping(value = "/filter.course")
    public ModelAndView filterEnroledCourseForGrade(@RequestParam("courseId") String courseId) {
        ModelAndView v = new ModelAndView("/lecturer/gradeACourse");
        int id = Integer.parseInt(courseId);
        List<EnroledCourse> collect = enrolDao.findAll().stream().filter(e -> e.getCourse().getCourseId() == id && e.getStatus().equals(EnrollStatus.APPROVED.name())).collect(Collectors.toList());
        v.addObject("enroledcourses", collect);
        v.addObject("courses", courseDao.findAll());
        v.addObject("currentCourse",courseId);

        return v;
    }

    @RequestMapping(value = "/filter.enrolcourse", method = RequestMethod.POST)
    public ModelAndView filterEnroledCourseForCourseEnrollment(@RequestParam("courseId") String courseId) {
        ModelAndView v = new ModelAndView("/lecturer/viewCourseEnrolment");
        int id = Integer.parseInt(courseId);
        List<EnroledCourse> collect = enrolDao.findAll().stream().filter(e -> e.getCourse().getCourseId() == id).collect(Collectors.toList());
        v.addObject("enroledcourses", collect);
        v.addObject("courses", courseDao.findAll());
        return v;
    }

    @RequestMapping(value = "/filter.stucourse", method = RequestMethod.POST)
    public ModelAndView filterEnroledCourseForPerfomance(@RequestParam("courseId") String courseId) {
        ModelAndView v = new ModelAndView("/lecturer/viewAStudentPerformance");
        int id = Integer.parseInt(courseId);
        List<EnroledCourse> collect = enrolDao.findAll().stream().filter(e -> e.getCourse().getCourseId() == id).collect(Collectors.toList());
        v.addObject("enroledcourses", collect);
        v.addObject("courses", courseDao.findAll());
        return v;
    }

    @RequestMapping(value = "/submit.grade", method = RequestMethod.POST)
    public ModelAndView filterEnroledCourse(HttpServletRequest req) {
        ArrayList<String> params = new ArrayList<String>(req.getParameterMap().keySet());
        for (String p : params) {
            int studentId = Integer.parseInt(p);
            int gradePoint = Integer.parseInt(p);
            return getDebug(studentId + "" + gradePoint);
        }
        return getDebug("fssdf");
    }

    @RequestMapping(value = "/profile")
    public ModelAndView showProfile() {
        return new ModelAndView("lecturer/lecturer-profile");

    }
    @RequestMapping(value = "/gradecourse.submit")
    public ModelAndView gradeSubmit(@RequestParam("courseId") String courseId, 
                                    @RequestParam("studentId") String studentId,
                                    @RequestParam("grade") String grade) {
        EnroledCoursePK key = new EnroledCoursePK(Integer.parseInt(studentId), Integer.parseInt(courseId));
        EnroledCourse enrol = enrolDao.findOne(key);
        if(enrol != null){
            enrol.setStatus(EnrollStatus.COMPLETED.name());
            enrol.setGradePoint(grade);
            enrolDao.save(enrol);
        }
        return new ModelAndView("redirect:gradecourse");
      // return getDebug(enrol.getGradePoint());
    }
}
