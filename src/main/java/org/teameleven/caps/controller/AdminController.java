/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import java.util.logging.Level;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.teameleven.caps.model.Admin;
import org.teameleven.caps.model.EnroledCourse;
import org.teameleven.caps.model.Lecturer;
import org.teameleven.caps.model.User;
import org.teameleven.caps.repository.EnroledCourseRepository;
import org.teameleven.caps.repository.UserRepository;

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
    @Autowired
    UserRepository userDao;

    @RequestMapping("/Mainpage")
    public ModelAndView AdminMainPage(HttpServletRequest req) {
        User user = (User) req.getSession().getAttribute("user");
        ModelAndView v = new ModelAndView("/adminMainPage");
        if (user == null) {
            v = new ModelAndView("/unauthorize");
        } else {
            v.addObject("admin", user.getFirstName());
        }

        return v;
    }

    @RequestMapping("/student/list")
    public ModelAndView listAllStudent(HttpServletRequest req) {
        ModelAndView v = new ModelAndView("crud/student-list");
        String pageId = req.getParameter("pageId");
        int pId = 0;
        if(pageId != null && !pageId.equals("")){
            pId= Integer.parseInt(pageId);
            v.addObject("pageId",pId);
        }
        PageRequest pr = new PageRequest(pId, 5);
        int size = studentDao.findAll().size();
        int count = size/5 + (size%5 == 0 ? 0 : 1);
        Page<Student> pg = studentDao.findAll(pr);
        v.addObject("studentList", pg.getContent());
        v.addObject("count" ,count);
        
        
        return v;
    }

    @RequestMapping(value = "/student/add", method = RequestMethod.POST)
    public ModelAndView addOrUpdateStudent(@ModelAttribute("student") Student stu, HttpServletRequest req) {
        String firstName = req.getParameter("student.user.firstName");
        String lastname = req.getParameter("student.user.lastName");
        String userId = req.getParameter("student.user.userId");
        String userName = req.getParameter("student.user.userName");
        String password = req.getParameter("student.user.password");
        String phone = req.getParameter("student.user.phone");
        String address = req.getParameter("student.user.address");
        String email = req.getParameter("student.user.email");
        String role = req.getParameter("student.user.role");
        String status = req.getParameter("student.user.status");
        String gender = req.getParameter("student.user.gender");
        String studentId = req.getParameter("student.studentId");
        String studentCitizenship = req.getParameter("student.citizenship");
        String studentNric = req.getParameter("student.nric");
        User u;
        Student s;
        DateFormat df = new SimpleDateFormat("yyyy/mm/dd");
        Date dob = null;
        try {
            if (!req.getParameter("student.user.dob").equals("")) {
                dob = df.parse(req.getParameter("student.user.dob"));
            }
        } catch (ParseException ex) {
            java.util.logging.Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (userId == null || userId.equals("")) {
            u = new User();
        } else {
            u = userDao.findOne(Integer.parseInt(userId));

        }
        setUser(u, address, email, password, phone, role, status, userName, firstName, lastname, dob, gender);

        if (studentId == null || studentId.equals("")) {
            s = new Student();
        } else {
            s = studentDao.findOne(Integer.parseInt(studentId));
        }
        s.setCitizenship(studentCitizenship);
        s.setNric(studentNric);
        s.setUser(u);
        studentDao.save(s);
        ModelAndView v = new ModelAndView("redirect:list");
       // v.addObject("studentList", studentDao.findAll());
        return v;
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
        ModelAndView v = new ModelAndView("redirec:list");
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
        User user;
        Lecturer l;
        String userId = req.getParameter("lecturer.user.userId");//Attribute type Integer
        String address = req.getParameter("lecturer.user.address");
        String email = req.getParameter("lecturer.user.email");
        String userName = req.getParameter("lecturer.user.userName");
        String password = req.getParameter("lecturer.user.password");
        String phone = req.getParameter("lecturer.user.phone");
        String role = "lecturer";
        String status = req.getParameter("lecturer.user.status");
        String firstName = req.getParameter("lecturer.user.firstName");
        String lastName = req.getParameter("lecturer.user.lastName");
        String gender = req.getParameter("lecturer.user.gender");
        DateFormat df = new SimpleDateFormat("yyyy-mm-dd");
        Date dob = null;
        try {
            dob = df.parse(req.getParameter("lecturer.user.dob"));
        } catch (ParseException ex) {
            java.util.logging.Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
        }

        if (userId == null || userId == "") {
            user = new User();
        } else {
            user = userDao.findOne(Integer.parseInt(userId));
        }
        setUser(user, address, email, password, phone, role, status, userName, firstName, lastName, dob, gender);

        String lecturerId = req.getParameter("lecturer.lecturerId");//Attribute type Integer
        String endDate = req.getParameter("lecturer.endDate");//Attribute type Date
        String position = req.getParameter("lecturer.position");
        String startDate = req.getParameter("lecturer.startDate");//Attribute type DateDate Dend
        Date Dend = null;
        Date dStart = null;
        try {
            Dend = df.parse(endDate);
            dStart = df.parse(startDate);
        } catch (ParseException ex) {
            java.util.logging.Logger.getLogger(AdminController.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (lecturerId == null || lecturerId.equals("")) {
            l = new Lecturer();
        } else {
            l = lecDao.findOne(Integer.parseInt(lecturerId));

        }
        l.setEndDate(Dend);
        l.setPosition(position);
        l.setStartDate(dStart);
        l.setUser(user);
        lecDao.saveAndFlush(l);

        ModelAndView v = new ModelAndView("crud/lecturer-list");
        v.addObject("lecturerList", lecDao.findAll());
        return v;
    }

    private void setUser(User user, String address, String email, String password, String phone, String role, String status, String userName, String firstName, String lastName, Date dob, String gender) {
        user.setAddress(address);
        user.setEmail(email);
        user.setPassword(password);
        user.setPhone(phone);
        user.setRole(role);
        user.setStatus(status);
        user.setUserName(userName);
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setDob(dob);
        user.setGender(gender);
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

    @RequestMapping(value = "/admin/update", method = RequestMethod.GET)
    public ModelAndView addOrUpdateAdmin( HttpServletRequest req) throws ParseException {
        Admin admin;
        User user;
        if(req.getParameter("admin.adminId")== ""){
            admin=new Admin();
        }
        else{
            admin=adminDao.findOne(Integer.parseInt(req.getParameter("admin.adminId")));
        }
        if(req.getParameter("admin.user.userId")== ""){
            user=new User();
//            return getDebug("new user");
        }
        else{
            user=userDao.findOne(Integer.parseInt(req.getParameter("admin.user.userId")));
//            return getDebug(user.toString());
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-mm-dd");

        String userId = req.getParameter("admin.user.userId"); //Attribute type Integer
        String userName = req.getParameter("admin.user.userName");
        String userPassword = req.getParameter("admin.user.password");
        String adminFirstName = req.getParameter("admin.user.firstName");
        String adminlastName = req.getParameter("admin.user.lastName");
        Date adminDob = simpleDateFormat.parse(req.getParameter("admin.user.dob"));
        String adminGender = req.getParameter("admin.user.gender");
        String adminEmail = req.getParameter("admin.user.email");
        String adminPhone = req.getParameter("admin.user.phone");
        String adminAddress = req.getParameter("admin.user.address");
        String adminStatus=req.getParameter("admin.user.status");
//        String adminId = req.getParameter("admin.adminId"); //Attribute type Integer
        String adminPosition = req.getParameter("admin.position");
//        return getDebug(adminDob.toString());
        setUser(user, adminAddress, adminEmail, userPassword, adminPhone, adminPosition,
                adminStatus, userName, adminFirstName, adminlastName, adminDob, adminGender);
        admin.setUser(user);
        admin.setPosition("admin");
        adminDao.saveAndFlush(admin);

        ModelAndView v = new ModelAndView("crud/admin-list");
        v.addObject("adminList", adminDao.findAll());
        return v;

    }

    @RequestMapping("/admin/edit")
    public ModelAndView showAdminFormEdit(int adminId) {
        Admin a = adminDao.findOne(adminId);
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
    @RequestMapping("/course/list")
    public ModelAndView listAllCourses() {
        List<Course> courseList=courseDao.findAll();
        ModelAndView v = new ModelAndView("crud/course-list");
        v.addObject("courseList",courseList);
        return v;
    }

    @RequestMapping(value = "/course/edit")
    public ModelAndView createOrEditCourse(int courseId){
        ModelAndView v = new ModelAndView("crud/course-form");
        v.addObject("Course",courseDao.findOne(courseId));
        return v;
    }
    @RequestMapping(value = "/course/add")
    public ModelAndView createOrEditCourse(){
        ModelAndView v = new ModelAndView("crud/course-form");
        Course course=new Course();
        v.addObject("Course",course);
        return v;
    }

    @RequestMapping(value = "/course/del")
    public ModelAndView deleteCourse(int courseId){
        courseDao.delete(courseId);
        List<Course> courseList=courseDao.findAll();
        ModelAndView v = new ModelAndView("crud/course-list");
        v.addObject("courseList",courseList);
        return v;
    }


    @RequestMapping(value="/course/update",method = RequestMethod.GET)
    public ModelAndView UpdateCourse(HttpServletRequest req){
        Course course;
        if(req.getParameter("Course.courseId")== ""){
            course=new Course();
//            return getDebug("its null");
        }
        else{
            course=courseDao.findOne(Integer.parseInt(req.getParameter("Course.courseId")));
        }

        String courseName=req.getParameter("Course.name");
        String courseDuration=req.getParameter("Course.duration");
        String courseCredits=req.getParameter("Course.credits");
        String courseSize=req.getParameter("Course.courseSize");
        String courseLecturer=req.getParameter("Course.lecturerId");
//        return getDebug(req.getParameter("Course.courseId") + " " + courseName + " " + courseCredits + " " + courseSize + courseLecturer + courseDuration);

        course.setName(courseName);
        course.setCourseSize(Integer.parseInt(courseSize));
        course.setCredits(Integer.parseInt(courseCredits));
        course.setDuration(courseDuration);
        course.setLecturer(lecDao.findOne(Integer.parseInt(courseLecturer)));
        courseDao.save(course);
        return listAllCourses();
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
