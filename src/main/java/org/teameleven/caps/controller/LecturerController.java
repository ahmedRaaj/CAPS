/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.teameleven.caps.model.Student;
import org.teameleven.caps.model.User;
import org.teameleven.caps.repository.CourseRepository;
import org.teameleven.caps.repository.EnroledCourseRepository;

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
    
    
    
    @RequestMapping("/Mainpage")
    public ModelAndView LecturerMain(RedirectAttributes redirectAttributes,HttpServletRequest req)
    {
        User user = (User)req.getSession().getAttribute("user");
        ModelAndView v = new ModelAndView("/lecturerMainpage");
        v.addObject("lecturer", user.getLecturer());
        return v;
    }
    
    @RequestMapping("/gradecourse")
    public ModelAndView gradeCourse()
    {
 
        ModelAndView v = new ModelAndView("/lecturer/gradeACourse");
        v.addObject("enroledcourses", enrolDao.findAll());
        v.addObject("courses",courseDao.findAll());
        return v;
    }
    
    
     @RequestMapping("/viewperformance")
    public ModelAndView viewPerformance()
    {
 
        ModelAndView v = new ModelAndView("/lecturer/viewAStudentPerformance");
        v.addObject("enroledcourses", enrolDao.findAll());
         v.addObject("courses",courseDao.findAll());
        return v;
    }
    
    @RequestMapping("/viewenrolment")
    public ModelAndView viewEnrollment()
    {
 
        ModelAndView v = new ModelAndView("/lecturer/viewCourseEnrolment");
        v.addObject("enroledcourses", enrolDao.findAll());
         v.addObject("courses",courseDao.findAll());
        return v;
    }
    
    @RequestMapping("/viewcourses")
    public ModelAndView viewCoursesTaught()
    {
 
        ModelAndView v = new ModelAndView("/lecturer/viewCourseTaught");
        v.addObject("courses", courseDao.findAll());
         
        return v;
    }
}
