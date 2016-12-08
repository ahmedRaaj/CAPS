/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.teameleven.caps.model.Course;
import org.teameleven.caps.model.Student;
import org.teameleven.caps.repository.*;

import java.util.List;

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
    @Autowired
    EnroledCourseRepository enroledDao;


    @RequestMapping("/Mainpage")
    public ModelAndView LecturerMain(RedirectAttributes redirectAttributes)
    {

        ModelAndView v = new ModelAndView("/adminMainPage");
        return v;

    }
    @RequestMapping("/student/list")
    public ModelAndView listAllStudent() {
        ModelAndView v = new ModelAndView("crud/student-list");
        v.addObject("studentList", studentDao.findAll());
        return v;
    }

    @RequestMapping("/student/add")
    public ModelAndView addOrUpdateStudent(@ModelAttribute("student") Student student) {
        studentDao.save(student);
        ModelAndView v = new ModelAndView("crud/student-list");
        v.addObject("studentList", studentDao.findAll());
        return v;
    }
    @RequestMapping("/student/edit")
    public ModelAndView showStudentFormEdit(@RequestParam("studentId") String studentId) {
        Student s=studentDao.findOne(Integer.parseInt(studentId));
        ModelAndView v = new ModelAndView("crud/student-form");
        v.addObject("student", s);
        return v;
    }
    @RequestMapping("/student/new")
    public ModelAndView showStudentFormNew() {
        Student s=new Student();
        ModelAndView v = new ModelAndView("crud/student-form");
        v.addObject("student", s);
        return v;
    }
     @RequestMapping(name = "/student/del")
    public ModelAndView deleteStudent(@RequestParam("studentId") String studentId) {
        studentDao.delete(Integer.parseInt(studentId));
        studentDao.flush();
        ModelAndView v = new ModelAndView("crud/student-list");
        v.addObject("studentList", studentDao.findAll());
        return getDebug(studentId);
    }

    @RequestMapping("/leclist")
    public ModelAndView listAllLecturers() {
        ModelAndView v = new ModelAndView("crud/lecturer-list");
        v.addObject("lecturerList", lecDao.findAll());
        return v;
    }

     @RequestMapping("/lecform")
    public ModelAndView createOrEditLecturer() {
        ModelAndView v = new ModelAndView("crud/lecturer-form");
        v.addObject("lecturerList", lecDao.findAll());
        return v;
    }

      @RequestMapping("/alist")
    public ModelAndView listAllAdmins() {
        ModelAndView v = new ModelAndView("crud/admin-list");
        return v;
    }

    @RequestMapping("/aform")
    public ModelAndView createOrEditAdmin() {

        ModelAndView v = new ModelAndView("crud/admin-form");
        v.addObject("adminList", adminDao.findAll());
        return v;
    }

      @RequestMapping("/clist")
    public ModelAndView listAllCourses() {
          List<Course> courseList=courseDao.findAll();
        ModelAndView v = new ModelAndView("crud/course-list");
        v.addObject("courseList",courseList);
        return v;
    }

    @RequestMapping("/cform")
    public ModelAndView creatOrEditCourse(){
        ModelAndView v = new ModelAndView("crud/course-form");
//        v.addObject("courseId",)
        return v;
    }

    private ModelAndView getDebug(String Message){
        ModelAndView m = new ModelAndView("debug");
        m.addObject("message", Message);
        return m;
    }
}
