/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.business;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.util.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.teameleven.caps.controller.LogInController;
import org.teameleven.caps.model.User;

/**
 *
 * @author ahmedraaj
 */
public class StudentRoleInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws ServletException {

        HttpSession session = request.getSession();
        if (session == null || session.getAttribute("user") == null) {
            try {
                response.sendRedirect("../login/ua");
                return false;
            } catch (IOException ex) {
                Logger.getLogger(StudentRoleInterceptor.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        // Proceed in any case.
        return true;
    }

}
