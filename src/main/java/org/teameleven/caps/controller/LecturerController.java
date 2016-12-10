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
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.teameleven.caps.model.Course;
import org.teameleven.caps.model.EnroledCourse;
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
    public ModelAndView LecturerMain(RedirectAttributes redirectAttributes,HttpServletRequest req)
    {
        User user = (User)req.getSession().getAttribute("user");
        ModelAndView v = new ModelAndView("/lecturerMainpage");
        if(user == null){
            v = new ModelAndView("/unauthorize");
        }else{
             v.addObject("user", user);
        }
     
        return v;
    }
    
    @RequestMapping("/gradecourse")
    public ModelAndView gradeCourse()//@RequestParam("lecturerId")String lecturerId)
    {   
        ModelAndView v = new ModelAndView("/lecturer/gradeACourse");
               Lecturer l=new Lecturer();
     //  l=lecDao.findOne(Integer.parseInt(lecturerId));
       v.addObject("enroledcourses", enrolDao.findAll());
        v.addObject("courses",courseDao.findAll());
     //   v.addObject("lecturer",l);
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
    
    private ModelAndView getDebug(String Message) {
        ModelAndView m = new ModelAndView("debug");
        m.addObject("message", Message);
        return m;
    }

    @RequestMapping(value = "/filter.course" , method = RequestMethod.POST)
    public ModelAndView filterEnroledCourseForGrade(@RequestParam("courseId") String courseId){
        ModelAndView v = new ModelAndView("/lecturer/gradeACourse");
        int id = Integer.parseInt(courseId);
        List<EnroledCourse> collect = enrolDao.findAll().stream().filter(e->e.getCourse().getCourseId()==id).collect(Collectors.toList());
        v.addObject("enroledcourses", collect);
        v.addObject("courses",courseDao.findAll());
        return v;
    }
    
        @RequestMapping(value = "/filter.enrolcourse" , method = RequestMethod.POST)
    public ModelAndView filterEnroledCourseForCourseEnrollment(@RequestParam("courseId") String courseId){
        ModelAndView v = new ModelAndView("/lecturer/viewCourseEnrolment");
        int id = Integer.parseInt(courseId);
        List<EnroledCourse> collect = enrolDao.findAll().stream().filter(e->e.getCourse().getCourseId()==id).collect(Collectors.toList());
        v.addObject("enroledcourses", collect);
        v.addObject("courses",courseDao.findAll());
        return v;
    }
    
            @RequestMapping(value = "/filter.stucourse" , method = RequestMethod.POST)
    public ModelAndView filterEnroledCourseForPerfomance(@RequestParam("courseId") String courseId){
        ModelAndView v = new ModelAndView("/lecturer/viewAStudentPerformance");
        int id = Integer.parseInt(courseId);
        List<EnroledCourse> collect = enrolDao.findAll().stream().filter(e->e.getCourse().getCourseId()==id).collect(Collectors.toList());
        v.addObject("enroledcourses", collect);
        v.addObject("courses",courseDao.findAll());
        return v;
    }
    

    
    @RequestMapping(value = "/submit.grade" , method = RequestMethod.POST)
    public ModelAndView filterEnroledCourse(HttpServletRequest req){
        ArrayList<String> params = new ArrayList<String>(req.getParameterMap().keySet());
       for(String p : params){
            int studentId = Integer.parseInt(p);
            int gradePoint=Integer.parseInt(p);
            return getDebug(studentId + "" + gradePoint);
       }
       return getDebug("fssdf");
    }
    
     @RequestMapping(value = "/profile")
    public ModelAndView showProfile(){
        return new ModelAndView("lecturer/lecturer-profile");
                
                
    }
}
