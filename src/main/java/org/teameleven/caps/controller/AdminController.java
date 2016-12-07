package org.teameleven.caps.controller;

import org.springframework.web.servlet.ModelAndView;
import org.teameleven.caps.repository.AdminRepository;

public class AdminController {
	
	AdminRepository adminDao;
	
	public ModelAndView name() {
		long c = adminDao.count();
		ModelAndView v = new ModelAndView("Welcome");
		return v;
	}
}
