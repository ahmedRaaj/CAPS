package org.teameleven.caps.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Created by Zwe Htat Naing on 07/12/2016.
 */
@Controller
@RequestMapping(value = "/login")
public class LoginAuth {
    @RequestMapping(value = "/auth")
    public String yourMethod(RedirectAttributes redirectAttributes,HttpServletRequest request)
    {
        String role="admin";
        String path = request.getContextPath();
        redirectAttributes.addAttribute("role", role);
      
        return "redirect:/student/list";
    }
    
    
}
