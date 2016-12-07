package org.teameleven.caps.controller;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.teameleven.caps.model.User;
import org.teameleven.caps.repository.AdminRepository;
import org.teameleven.caps.services.AdminService;

/**
 * 
 * @author Kaung
 */

@Controller
@RequestMapping("/admin")
public class AdminController {

    //AdminService adminServ = new AdminService();
    @Autowired
    AdminRepository AdminRepo;
    
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView newUserAccount() {
        ModelAndView mav = new ModelAndView("create-newAcc", "user", new User());
        
        
        return mav;
    }
}