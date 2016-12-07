package org.teameleven.caps.customlib;


import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;

/**
 * Created by Zwe Htat Naing on 06/12/2016.
 */
public class LoginLib extends SimpleTagSupport {
    public void doTag() throws JspException, IOException {

        JspWriter out = getJspContext().getOut();
       
        out.println("<form action=\"/login/auth\" method=\"post\" id=\"LoginForm\" role=\"form\" >"+"<div class=\"glassbg \" style=\"margin-top:100px;\">" +
                "  <div class=\"modal-title\" style=\"padding-left:10px;margin-left:5px;\">" +
                "    <h2 style=\"color: rgba(108,124,255,0.85)\" > Login</h2>" +
                "  </div>\n" +
                "  <div class=\"container\" style=\"padding-top: 30px;\">" +
                "" +
                "    <div class=\"form-group\">" +
                "    <label class=\"h4\" style=\"color: rgba(108,124,255,0.85)\">User Name</label>" +
                "    <input type=\"text\" class=\"form-control\">" +
                "" +
                "      <label class=\"h4\" style=\"color: rgba(108,124,255,0.85);padding-top: 18px;\">Password</label>" +
                "      <input type=\"password\" class=\"form-control\" style=\"padding-top: 18px;\">" +
                "" +
                "" +
                "    </div>" +
                "    <input type=\"submit\" class=\"btn btn-success\" value=\"Login\" style=\"margin-top: 20px;\">" +
                "" +
                "  </div>" +
                "</div>"+"</form>");
    }
}
