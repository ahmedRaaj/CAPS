/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 *
 * @author ahmedraaj
 */
@Controller
@RequestMapping("/lecturer")
public class LecturerController {
    @RequestMapping("/Mainpage")
    public ModelAndView LecturerMain(RedirectAttributes redirectAttributes)
    {

        ModelAndView v = new ModelAndView("/lecturerMainpage");
        return v;

    }
}
