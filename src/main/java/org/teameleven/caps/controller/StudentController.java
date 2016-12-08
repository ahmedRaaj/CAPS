package org.teameleven.caps.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/student")
public class StudentController {
    @RequestMapping("/main")
   public ModelAndView StudentMain(RedirectAttributes redirectAttributes)
   {

       ModelAndView v = new ModelAndView("/studentMainPage");
       return v;

   }



}
