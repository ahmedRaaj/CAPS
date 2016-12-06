package org.teameleven.caps.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.teameleven.caps.repository.StudentRepository;

@Controller
public class StudentController {

	@Autowired
	StudentRepository dao;
	@RequestMapping("/test")
	public ModelAndView name() {
		long c = dao.count();
		ModelAndView v = new ModelAndView("welcome");
		v.addObject("msg","count: "+ c);
		return v;
		

//		ModelAndView mv = new ModelAndView("welcome");
//		mv.addObject("msg","Hi welcome to spring");
		
//		return mv;
	}
	
	
	@RequestMapping("/t")
	public String name2() {
		return "welcome";
	}
}
