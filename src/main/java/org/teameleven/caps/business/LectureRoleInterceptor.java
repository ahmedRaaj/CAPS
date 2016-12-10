package org.teameleven.caps.business;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.teameleven.caps.model.User;

import javax.interceptor.Interceptor;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Created by LIU XURAN on 10/12/2016.
 */
public class LectureRoleInterceptor extends HandlerInterceptorAdapter {
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws ServletException {

        HttpSession session = request.getSession();
        if(session == null || session.getAttribute("user") == null || !((User)session.getAttribute("user")).getRole().equals(UserRole.lecturer)){
            try {
                response.sendRedirect("../");
                return false;
            } catch (IOException ex) {
                Logger.getLogger(StudentRoleInterceptor.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        // Proceed in any case.
        return true;
    }

}
