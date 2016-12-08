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
   public ModelAndView StudentMain(HttpServletRequest req)
   {
       User user = (User)req.getSession().getAttribute("user");
       ModelAndView v = new ModelAndView("/studentMainPage");
       v.addObject("student",user.getStudent());
       return v;
   }

    @RequestMapping("/view")
   public ModelAndView viewCourses()
   {
      
       ModelAndView v = new ModelAndView("/student/view-course");
       v.addObject("viewcourses", courseDao.findAll());
       return v;
   }
    @RequestMapping("/grade")
   public ModelAndView viewGrade()
   {
      
       ModelAndView v = new ModelAndView("/student/grade");
       v.addObject("enroledcourses", enrolDao.findAll());
       return v;
   }
   
     
   @RequestMapping("/enrolment")
   public ModelAndView viewEnrolment(HttpServletRequest req)
   {
       User user = (User)req.getSession().getAttribute("user");
       Student s = null;
       if(user != null && user.getStudent() != null){
           s = user.getStudent();
       }
       ModelAndView v = new ModelAndView("/student/course-enrolment");
       v.addObject("courses", courseDao.findAll());
       v.addObject("student",s);
       return v;
   }
}
