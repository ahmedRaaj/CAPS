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
import org.teameleven.caps.model.Course;
import org.teameleven.caps.model.Student;
import org.teameleven.caps.repository.AdminRepository;
import org.teameleven.caps.repository.CourseRepository;
import org.teameleven.caps.repository.LecturerRepository;
import org.teameleven.caps.repository.StudentRepository;
import org.teameleven.caps.services.StudentService;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.teameleven.caps.model.Admin;
import org.teameleven.caps.model.EnroledCourse;
import org.teameleven.caps.model.Lecturer;
import org.teameleven.caps.model.User;
import org.teameleven.caps.repository.EnroledCourseRepository;

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
    public ModelAndView AdminMainPage(HttpServletRequest req) {
        User user = (User) req.getSession().getAttribute("user");
        ModelAndView v = new ModelAndView("/adminMainPage");
        if(user == null){
            v = new ModelAndView("/unauthorize");
        }else{
             v.addObject("admin", user.getFirstName());
        }
       
        return v;
    }

    @RequestMapping("/student/list")
    public ModelAndView listAllStudent() {
        ModelAndView v = new ModelAndView("crud/student-list");
        v.addObject("studentList", studentDao.findAll());
        return v;
    }

    @RequestMapping(value = "/student/add", method = RequestMethod.POST)
    public ModelAndView addOrUpdateStudent(@ModelAttribute("student") Student student, HttpServletRequest req) 
    {
        String userFirstName = req.getParameter("student.user.firstName");
        String userLastname = req.getParameter("student.user.lastName"); 
        String userUserId =req.getParameter("student.user.userId");
        String userUserName =req.getParameter("student.user.userName");
        String userPassword =req.getParameter("student.user.password");
        String userPhone=req.getParameter("student.user.phone");
        String userAddress=req.getParameter("student.user.address");
        String userEmail=req.getParameter("student.user.email");
        String userRole=req.getParameter("student.user.role");
        String userStatus=req.getParameter("student.user.status");
        String userGender =req.getParameter("student.user.gender");   
        //Date userDob=SimpleDateFormat.parse(req.getParameter("student.user.dob"));

        String studentCitizenship =req.getParameter("student.citizenship"); 
        String studentNric =req.getParameter("student.nric");   
//        studentDao.save(student);
//        ModelAndView v = new ModelAndView("crud/student-list");
//        v.addObject("studentList", studentDao.findAll());
//        return v;
    }

    @RequestMapping("/student/edit")
    public ModelAndView showStudentFormEdit(@RequestParam("studentId") String studentId) {
        Student s = studentDao.findOne(Integer.parseInt(studentId));
        ModelAndView v = new ModelAndView("crud/student-form");
        v.addObject("student", s);
        return v;
    }

    @RequestMapping("/student/new")
    public ModelAndView showStudentFormNew() {
        Student s = new Student();
        User u = new User();
        s.setUser(u);
        ModelAndView v = new ModelAndView("crud/student-form");
        v.addObject("student", s);
        return v;
    }

    @RequestMapping("/student/del")
    public ModelAndView deleteStudent(@RequestParam("studentId") String studentId) {
        studentDao.delete(Integer.parseInt(studentId));
        ModelAndView v = new ModelAndView("crud/student-list");
        v.addObject("studentList", studentDao.findAll());
        return v;
    }

    /*Lecturer Part*/
    @RequestMapping("/lecturer/list")
    public ModelAndView listAllLecturers() {
        ModelAndView v = new ModelAndView("crud/lecturer-list");
        v.addObject("lecturerList", lecDao.findAll());
        return v;
    }

    @RequestMapping(value = "/lecturer/add", method = RequestMethod.POST)
    public ModelAndView addOrUpdateLecturer(@ModelAttribute("lecturer") Lecturer lecturer, HttpServletRequest req) {
        String userId = req.getParameter("lectuerer.user.userId");//Attribute type Integer
        String address = req.getParameter("lectuerer.user.address");
        String email = req.getParameter("lectuerer.user.email");
        String userName = req.getParameter("lectuerer.user.userName");
        String password = req.getParameter("lectuerer.user.password");
        String phone = req.getParameter("lectuerer.user.phone");
        String role = req.getParameter("lectuerer.user.role");
        String status = req.getParameter("lectuerer.user.status");
        String firstName = req.getParameter("lectuerer.user.firstName");
        String lastName = req.getParameter("lectuerer.user.lastName");
        String dob = req.getParameter("lectuerer.user.dob"); //Attribute type Date
        String gender = req.getParameter("lectuerer.user.gender");

        String lecturerId = req.getParameter("lectuerer.lecturerId");//Attribute type Integer
        String endDate = req.getParameter("lectuerer.endDate");//Attribute type Date
        String position = req.getParameter("lectuerer.position");
        String startDate = req.getParameter("lectuerer.startDate");//Attribute type Date

        return getDebug(userId + "/n" + address + "/n" + email + "/n" + userName + "/n" + password + "/n" + phone + "/n" + role + "/n" + status + "/n" + firstName + "/n" + lastName + "/n" + dob
                + "/n" + gender + "/n" + lecturerId + "/n" + endDate + "/n" + position + "/n" + startDate);
//        lecDao.save(lecturer);
//        ModelAndView v = new ModelAndView("crud/lecturer-list");
//        v.addObject("lecturerList", lecDao.findAll());
//       return v;
    }

    @RequestMapping("/lecturer/edit")
    public ModelAndView showLecturerFormEdit(@RequestParam("lecturerId") String lecturerId) {
        Lecturer l = lecDao.findOne(Integer.parseInt(lecturerId));
        ModelAndView v = new ModelAndView("crud/lecturer-form");
        v.addObject("lecturer", l);
        return v;
    }

    @RequestMapping("/lecturer/new")
    public ModelAndView showLecturerFormNew() {
        Lecturer l = new Lecturer();
        ModelAndView v = new ModelAndView("crud/lecturer-form");
        v.addObject("lecturer", l);
        return v;
    }

    @RequestMapping("/lecturer/del")
    public ModelAndView deleteLecturer(@RequestParam("lecturerId") String lecturerId) {
        lecDao.delete(Integer.parseInt(lecturerId));
        //  lecDao.flush();
        ModelAndView v = new ModelAndView("crud/lecturer-list");
        v.addObject("lecturerList", lecDao.findAll());
        return v;
    }

    /*Lecturer Part End*/

 /*Admin Control Part*/
    @RequestMapping("admin/list")
    public ModelAndView listAllAdmins() {
        ModelAndView v = new ModelAndView("crud/admin-list");
        v.addObject("adminList", adminDao.findAll());
        return v;
    }

    @RequestMapping(value = "/admin/add", method = RequestMethod.POST)
    public ModelAndView addOrUpdateAdmin(@ModelAttribute("admin") Admin admin, HttpServletRequest req) {
        String userId = req.getParameter("admin.user.userId"); //Attribute type Integer
        String uerName = req.getParameter("admin.user.userName");
        String userPassword = req.getParameter("admin.user.password");
        String adminFirstName = req.getParameter("admin.user.firstName");
        String adminlastName = req.getParameter("admin.user.lastName");
        String adminDob = req.getParameter("admin.user.dob");
        String adminGender = req.getParameter("admin.user.gender");
        String adminEmail = req.getParameter("admin.user.email");
        String adminPhone = req.getParameter("admin.user.phone");
        String adminAddress = req.getParameter("admin.user.address");
        String adminId = req.getParameter("admin.adminId"); //Attribute type Integer
        String adminPosition = req.getParameter("admin.position");
        return getDebug(userId + " " + adminId);
    }

    @RequestMapping("/admin/edit")
    public ModelAndView showAdminFormEdit(@RequestParam("adminId") String adminId) {
        Admin a = adminDao.findOne(Integer.parseInt(adminId));
        ModelAndView v = new ModelAndView("crud/admin-form");
        v.addObject("admin", a);
        return v;
    }

    @RequestMapping("/admin/new")
    public ModelAndView showAdminFormNew() {
        Admin a = new Admin();
        ModelAndView v = new ModelAndView("crud/admin-form");
        v.addObject("admin", a);
        return v;
    }

    @RequestMapping("/admin/del")
    public ModelAndView deleteAdmin(@RequestParam("adminId") String adminId) {
        adminDao.delete(Integer.parseInt(adminId));
        adminDao.flush();
        ModelAndView v = new ModelAndView("crud/admin-list");
        v.addObject("adminList", adminDao.findAll());
        return v;
    }

    /*End Admin Part*/
    @RequestMapping("/clist")
    public ModelAndView listAllCourses() {
        List<Course> courseList = courseDao.findAll();
        ModelAndView v = new ModelAndView("crud/course-list");
        v.addObject("courseList", courseList);
        return v;
    }

    @RequestMapping(value = "/cform")
    public ModelAndView creatOrEditCourse(int courseId) {
        HttpServletRequest request = null;
        ModelAndView v = new ModelAndView("crud/course-form");
        v.addObject("courseDetail", courseDao.findOne(courseId));
        return v;
    }

    @RequestMapping(value = "/cupdate")
    public String UpdateCourse(Course course) {
        HttpServletResponse response = null;
        return null;

    }

    private ModelAndView getDebug(String Message) {
        ModelAndView m = new ModelAndView("debug");
        m.addObject("message", Message);
        return m;
    }

    private ModelAndView getDebug(int Message) {
        ModelAndView m = new ModelAndView("debug");
        m.addObject("message", Message);
        return m;
    }
}
