/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.controller;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.teameleven.caps.model.Student;
import org.teameleven.caps.repository.AdminRepository;
import org.teameleven.caps.repository.CourseRepository;
import org.teameleven.caps.repository.LecturerRepository;
import org.teameleven.caps.repository.StudentRepository;
import org.teameleven.caps.services.StudentService;

/**
 *
 * @author ahmedraaj
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    StudentRepository studentDao;
    @Autowired
    LecturerRepository lecDao;
    @Autowired
    AdminRepository adminDao;
    @Autowired
    CourseRepository courseDao;

    @RequestMapping("/slist")
    public ModelAndView listAllStudent() {

        ModelAndView v = new ModelAndView("crud/student-list");
        v.addObject("studentList", studentDao.findAll());
        return v;
    }
    
    @RequestMapping("sform")
    public ModelAndView createOrEditStudent(@ModelAttribute("student") Student student) {

        //service.setValue(5);
        if(student == null) Logger.getLogger(StudentController.class).log(Logger.Level.FATAL, "student Null");
        ModelAndView v = new ModelAndView("crud/student-form");
        v.addObject("student", student);
        return v;
    }
    
    @RequestMapping("/leclist")
    public ModelAndView listAllLecturers() {

        ModelAndView v = new ModelAndView("crud/lecturer-list");
        v.addObject("lecturerList", lecDao.findAll());
        return v;
    }
      @RequestMapping("/alist")
    public ModelAndView listAllAdmins() {

        ModelAndView v = new ModelAndView("crud/admin-list");
        return v;
    }
      @RequestMapping("/clist")
    public ModelAndView listAllCourses() {

        ModelAndView v = new ModelAndView("crud/course-list");
        v.addObject("courseList", courseDao.findAll());
        return v;
    }
     
   
}
