/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Kaung
 */

@Controller
public class EmailSenderController {

	Properties mailServerProperties;
	Session getMailSession;
	MimeMessage generatedMessage;
	
	@RequestMapping(value = "/send")
	public String generateAndSendEmail() throws AddressException, MessagingException {
	    
		System.out.println("\n 1st ===> setup Mail Server Properties..");
	    mailServerProperties = System.getProperties();
	    mailServerProperties.put("mail.smtp.port", "587");
	    mailServerProperties.put("mail.smtp.auth", "true");
	    mailServerProperties.put("mail.smtp.starttls.enable", "true");
	    System.out.println("Mail Server Properties have been setup successfully..");
	    
	    System.out.println("\n\n 2nd ===> getMail Session..");
	    getMailSession = Session.getDefaultInstance(mailServerProperties, null);
	    generatedMessage = new MimeMessage(getMailSession);
	    generatedMessage.addRecipient(Message.RecipientType.TO, new InternetAddress("suria@nus.edu.sg"));
	    generatedMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("issspa@nus.edu.sg"));
	    generatedMessage.setSubject("Greetings ");
	    String emailBody = "Test email JavaMail API example. " + "<br><br> Regards, <br>Suria";
	    generatedMessage.setContent(emailBody, "text/html");
	    System.out.println("Mail Session has been created successfully..");
	    
	    System.out.println("\n\n 3rd ===> Get Session and Send mail");
	    Transport transport = getMailSession.getTransport("smtp");
	    transport.connect("smtp.gmail.com", "suria.r.asai@gmail.com", "XXXX");
		transport.sendMessage(generatedMessage, generatedMessage.getAllRecipients());
		transport.close();
	    
		return "Result";
	}
}
