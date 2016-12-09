/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.controller;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import org.teameleven.caps.repository.StudentRepository;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.teameleven.caps.model.Student;


/**
 *
 * @author Zeng
 */
@Controller
@RequestMapping("/student")
public class EmailSenderController {

    @Autowired
    StudentRepository studentDao;

    final String username = "capsbysa43team11@gmail.com";
    final String password = "PassworD";
    final String fromEmailAddress = "capsbysa43team11@gmail.com";
    String sendToEmailAddress = new String();
    String emailSubject = new String();
    String emailContent = new String();

    @RequestMapping("/email")
    public ModelAndView sendEmail(@RequestParam("studentId") String studentId) {

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        
        Student student = studentDao.findOne(Integer.parseInt(studentId));
        sendToEmailAddress = student.getUser().getEmail();

        emailSubject="@No-Reply >>> Dear " + student.getUser().getFirstName()+ " " + student.getUser().getLastName() + " <<<";
        emailContent="Dear "+student.getUser().getFirstName()+ " " + student.getUser().getLastName() +",\n\n"+
                "Thanks for using CAPS! \n"+
                "All courses you enrolled have been saved in to server successfully.\n "+
                "\n"+
                "Best regard.\n"+
                "SA43 Team11";
        
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmailAddress));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(sendToEmailAddress));
            message.setSubject(emailSubject);
            message.setText(emailContent);
            Transport.send(message);

            System.out.println("Email Send Success!");

        } catch (MessagingException ex) {
            throw new RuntimeException(ex);

        }

        ModelAndView mav = new ModelAndView("student/email-send");
        mav.addObject("student", student);
        return mav;
    }
}
