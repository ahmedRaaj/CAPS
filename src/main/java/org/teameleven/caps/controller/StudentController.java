package org.teameleven.caps.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.teameleven.caps.repository.CourseRepository;

@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    CourseRepository courseDao;
    @RequestMapping("/Mainpage")
   public ModelAndView StudentMain(RedirectAttributes redirectAttributes)
   {
       ModelAndView v = new ModelAndView("/studentMainPage");
       return v;
   }

    @RequestMapping("/view")
   public ModelAndView viewCourses()
   {
       ModelAndView v = new ModelAndView("/student/viewcourse");
       v.addObject("veiwcoures", courseDao.findAll());
       return v;
   }

}
