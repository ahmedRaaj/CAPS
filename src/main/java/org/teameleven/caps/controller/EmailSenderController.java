/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.teameleven.caps.model.Student;
import org.teameleven.caps.repository.StudentRepository;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;


/**
 *
 * @author Zeng
 */
@Controller
@RequestMapping("/student")
public class EmailSenderController {

    @Autowired
    StudentRepository studentDao;

    private final String username = "zwehtatnaing.liveid@gmail.com";
    private final String password = "Yuri123#";
    private final String fromEmailAddress = "capsbysa43team11@gmail.com";
    private String sendToEmailAddress = new String();
    private String emailSubject = new String();
   private String messageFormat=" text/html;  charset=UTF-8";
   private String localUrl="http://localhost:8080/Caps/";

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
            message.setContent(MailContent(Integer.parseInt(studentId)),messageFormat);
            Transport.send(message);

            System.out.println("Email Send Success!");

        } catch (MessagingException ex) {
            throw new RuntimeException(ex);

        }

        ModelAndView mav = new ModelAndView("student/email-send");
        mav.addObject("student", student);
        return mav;
    }



   private String MailContent(int studentId){
        String s=new String();
        Student student=studentDao.findOne(studentId);
        s="<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\n" +
"<html>\n" +
" <head>\n" +
" <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n" +
" \n" +
" <!-- Facebook sharing information tags -->\n" +
" <meta property=\"og:title\" content=\"*|MC:SUBJECT|*\" />\n" +
" \n" +
" <title>*|MC:SUBJECT|*</title>\n" +
"	<style type=\"text/css\">\n" +
"	/* Client-specific Styles */\n" +
"	#outlook a{padding:0;} /* Force Outlook to provide a \"view in browser\" button. */\n" +
"	body{width:100% !important;} .ReadMsgBody{width:100%;} .ExternalClass{width:100%;} /* Force Hotmail to display emails at full width */\n" +
"	body{-webkit-text-size-adjust:none;} /* Prevent Webkit platforms from changing default text sizes. */\n" +
"	/* Reset Styles */\n" +
"	body{margin:0; padding:0;}\n" +
"	img{border:0; height:auto; line-height:100%; outline:none; text-decoration:none;}\n" +
"	table td{border-collapse:collapse;}\n" +
"	#backgroundTable{height:100% !important; margin:0; padding:0; width:100% !important;}\n" +
"	/* Template Styles */\n" +
"	/* /\\/\\/\\/\\/\\/\\/\\/\\/\\/\\ STANDARD STYLING: COMMON PAGE ELEMENTS /\\/\\/\\/\\/\\/\\/\\/\\/\\/\\ */\n" +
"	/**\n" +
"	* @tab Page\n" +
"	* @section background color\n" +
"	* @tip Set the background color for your email. You may want to choose one that matches your company's branding.\n" +
"	* @theme page\n" +
"	*/\n" +
"	body, #backgroundTable{\n" +
"	/*@editable*/ background-color:#FAFAFA;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Page\n" +
"	* @section email border\n" +
"	* @tip Set the border for your email.\n" +
"	*/\n" +
"	#templateContainer{\n" +
"	/*@editable*/ border: 1px solid #DDDDDD;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Page\n" +
"	* @section heading 1\n" +
"	* @tip Set the styling for all first-level headings in your emails. These should be the largest of your headings.\n" +
"	* @style heading 1\n" +
"	*/\n" +
"	h1, .h1{\n" +
"	/*@editable*/ color:#202020;\n" +
"	display:block;\n" +
"	/*@editable*/ font-family:Arial;\n" +
"	/*@editable*/ font-size:34px;\n" +
"	/*@editable*/ font-weight:bold;\n" +
"	/*@editable*/ line-height:100%;\n" +
"	margin-top:0;\n" +
"	margin-right:0;\n" +
"	margin-bottom:10px;\n" +
"	margin-left:0;\n" +
"	/*@editable*/ text-align:left;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Page\n" +
"	* @section heading 2\n" +
"	* @tip Set the styling for all second-level headings in your emails.\n" +
"	* @style heading 2\n" +
"	*/\n" +
"	h2, .h2{\n" +
"	/*@editable*/ color:#202020;\n" +
"	display:block;\n" +
"	/*@editable*/ font-family:Arial;\n" +
"	/*@editable*/ font-size:30px;\n" +
"	/*@editable*/ font-weight:bold;\n" +
"	/*@editable*/ line-height:100%;\n" +
"	margin-top:0;\n" +
"	margin-right:0;\n" +
"	margin-bottom:10px;\n" +
"	margin-left:0;\n" +
"	/*@editable*/ text-align:left;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Page\n" +
"	* @section heading 3\n" +
"	* @tip Set the styling for all third-level headings in your emails.\n" +
"	* @style heading 3\n" +
"	*/\n" +
"	h3, .h3{\n" +
"	/*@editable*/ color:#202020;\n" +
"	display:block;\n" +
"	/*@editable*/ font-family:Arial;\n" +
"	/*@editable*/ font-size:26px;\n" +
"	/*@editable*/ font-weight:bold;\n" +
"	/*@editable*/ line-height:100%;\n" +
"	margin-top:0;\n" +
"	margin-right:0;\n" +
"	margin-bottom:10px;\n" +
"	margin-left:0;\n" +
"	/*@editable*/ text-align:left;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Page\n" +
"	* @section heading 4\n" +
"	* @tip Set the styling for all fourth-level headings in your emails. These should be the smallest of your headings.\n" +
"	* @style heading 4\n" +
"	*/\n" +
"	h4, .h4{\n" +
"	/*@editable*/ color:#202020;\n" +
"	display:block;\n" +
"	/*@editable*/ font-family:Arial;\n" +
"	/*@editable*/ font-size:22px;\n" +
"	/*@editable*/ font-weight:bold;\n" +
"	/*@editable*/ line-height:100%;\n" +
"	margin-top:0;\n" +
"	margin-right:0;\n" +
"	margin-bottom:10px;\n" +
"	margin-left:0;\n" +
"	/*@editable*/ text-align:left;\n" +
"	}\n" +
"	/* /\\/\\/\\/\\/\\/\\/\\/\\/\\/\\ STANDARD STYLING: PREHEADER /\\/\\/\\/\\/\\/\\/\\/\\/\\/\\ */\n" +
"	/**\n" +
"	* @tab Header\n" +
"	* @section preheader style\n" +
"	* @tip Set the background color for your email's preheader area.\n" +
"	* @theme page\n" +
"	*/\n" +
"	#templatePreheader{\n" +
"	/*@editable*/ background-color:#FAFAFA;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Header\n" +
"	* @section preheader text\n" +
"	* @tip Set the styling for your email's preheader text. Choose a size and color that is easy to read.\n" +
"	*/\n" +
"	.preheaderContent div{\n" +
"	/*@editable*/ color:#505050;\n" +
"	/*@editable*/ font-family:Arial;\n" +
"	/*@editable*/ font-size:10px;\n" +
"	/*@editable*/ line-height:100%;\n" +
"	/*@editable*/ text-align:left;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Header\n" +
"	* @section preheader link\n" +
"	* @tip Set the styling for your email's preheader links. Choose a color that helps them stand out from your text.\n" +
"	*/\n" +
"	.preheaderContent div a:link, .preheaderContent div a:visited, /* Yahoo! Mail Override */ .preheaderContent div a .yshortcuts /* Yahoo! Mail Override */{\n" +
"	/*@editable*/ color:#336699;\n" +
"	/*@editable*/ font-weight:normal;\n" +
"	/*@editable*/ text-decoration:underline;\n" +
"	}\n" +
"	/* /\\/\\/\\/\\/\\/\\/\\/\\/\\/\\ STANDARD STYLING: HEADER /\\/\\/\\/\\/\\/\\/\\/\\/\\/\\ */\n" +
"	/**\n" +
"	* @tab Header\n" +
"	* @section header style\n" +
"	* @tip Set the background color and border for your email's header area.\n" +
"	* @theme header\n" +
"	*/\n" +
"	#templateHeader{\n" +
"	/*@editable*/ background-color:#FFFFFF;\n" +
"	/*@editable*/ border-bottom:0;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Header\n" +
"	* @section header text\n" +
"	* @tip Set the styling for your email's header text. Choose a size and color that is easy to read.\n" +
"	*/\n" +
"	.headerContent{\n" +
"	/*@editable*/ color:#202020;\n" +
"	/*@editable*/ font-family:Arial;\n" +
"	/*@editable*/ font-size:34px;\n" +
"	/*@editable*/ font-weight:bold;\n" +
"	/*@editable*/ line-height:100%;\n" +
"	/*@editable*/ padding:0;\n" +
"	/*@editable*/ text-align:center;\n" +
"	/*@editable*/ vertical-align:middle;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Header\n" +
"	* @section header link\n" +
"	* @tip Set the styling for your email's header links. Choose a color that helps them stand out from your text.\n" +
"	*/\n" +
"	.headerContent a:link, .headerContent a:visited, /* Yahoo! Mail Override */ .headerContent a .yshortcuts /* Yahoo! Mail Override */{\n" +
"	/*@editable*/ color:#336699;\n" +
"	/*@editable*/ font-weight:normal;\n" +
"	/*@editable*/ text-decoration:underline;\n" +
"	}\n" +
"	#headerImage{\n" +
"	height:auto;\n" +
"	max-width:600px !important;\n" +
"	}\n" +
"	/* /\\/\\/\\/\\/\\/\\/\\/\\/\\/\\ STANDARD STYLING: MAIN BODY /\\/\\/\\/\\/\\/\\/\\/\\/\\/\\ */\n" +
"	/**\n" +
"	* @tab Body\n" +
"	* @section body style\n" +
"	* @tip Set the background color for your email's body area.\n" +
"	*/\n" +
"	#templateContainer, .bodyContent{\n" +
"	/*@editable*/ background-color:#FFFFFF;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Body\n" +
"	* @section body text\n" +
"	* @tip Set the styling for your email's main content text. Choose a size and color that is easy to read.\n" +
"	* @theme main\n" +
"	*/\n" +
"	.bodyContent div{\n" +
"	/*@editable*/ color:#505050;\n" +
"	/*@editable*/ font-family:Arial;\n" +
"	/*@editable*/ font-size:14px;\n" +
"	/*@editable*/ line-height:150%;\n" +
"	/*@editable*/ text-align:left;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Body\n" +
"	* @section body link\n" +
"	* @tip Set the styling for your email's main content links. Choose a color that helps them stand out from your text.\n" +
"	*/\n" +
"	.bodyContent div a:link, .bodyContent div a:visited, /* Yahoo! Mail Override */ .bodyContent div a .yshortcuts /* Yahoo! Mail Override */{\n" +
"	/*@editable*/ color:#336699;\n" +
"	/*@editable*/ font-weight:normal;\n" +
"	/*@editable*/ text-decoration:underline;\n" +
"	}\n" +
"	.bodyContent img{\n" +
"	display:inline;\n" +
"	height:auto;\n" +
"	}\n" +
"	/* /\\/\\/\\/\\/\\/\\/\\/\\/\\/\\ STANDARD STYLING: FOOTER /\\/\\/\\/\\/\\/\\/\\/\\/\\/\\ */\n" +
"	/**\n" +
"	* @tab Footer\n" +
"	* @section footer style\n" +
"	* @tip Set the background color and top border for your email's footer area.\n" +
"	* @theme footer\n" +
"	*/\n" +
"	#templateFooter{\n" +
"	/*@editable*/ background-color:#FFFFFF;\n" +
"	/*@editable*/ border-top:0;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Footer\n" +
"	* @section footer text\n" +
"	* @tip Set the styling for your email's footer text. Choose a size and color that is easy to read.\n" +
"	* @theme footer\n" +
"	*/\n" +
"	.footerContent div{\n" +
"	/*@editable*/ color:#707070;\n" +
"	/*@editable*/ font-family:Arial;\n" +
"	/*@editable*/ font-size:12px;\n" +
"	/*@editable*/ line-height:125%;\n" +
"	/*@editable*/ text-align:left;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Footer\n" +
"	* @section footer link\n" +
"	* @tip Set the styling for your email's footer links. Choose a color that helps them stand out from your text.\n" +
"	*/\n" +
"	.footerContent div a:link, .footerContent div a:visited, /* Yahoo! Mail Override */ .footerContent div a .yshortcuts /* Yahoo! Mail Override */{\n" +
"	/*@editable*/ color:#336699;\n" +
"	/*@editable*/ font-weight:normal;\n" +
"	/*@editable*/ text-decoration:underline;\n" +
"	}\n" +
"	.footerContent img{\n" +
"	display:inline;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Footer\n" +
"	* @section social bar style\n" +
"	* @tip Set the background color and border for your email's footer social bar.\n" +
"	* @theme footer\n" +
"	*/\n" +
"	#social{\n" +
"	/*@editable*/ background-color:#FAFAFA;\n" +
"	/*@editable*/ border:0;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Footer\n" +
"	* @section social bar style\n" +
"	* @tip Set the background color and border for your email's footer social bar.\n" +
"	*/\n" +
"	#social div{\n" +
"	/*@editable*/ text-align:center;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Footer\n" +
"	* @section utility bar style\n" +
"	* @tip Set the background color and border for your email's footer utility bar.\n" +
"	* @theme footer\n" +
"	*/\n" +
"	#utility{\n" +
"	/*@editable*/ background-color:#FFFFFF;\n" +
"	/*@editable*/ border:0;\n" +
"	}\n" +
"	/**\n" +
"	* @tab Footer\n" +
"	* @section utility bar style\n" +
"	* @tip Set the background color and border for your email's footer utility bar.\n" +
"	*/\n" +
"	#utility div{\n" +
"	/*@editable*/ text-align:center;\n" +
"	}\n" +
"	#monkeyRewards img{\n" +
"	max-width:190px;\n" +
"	}\n" +
"	</style>\n" +
"	</head>\n" +
" <body leftmargin=\"0\" marginwidth=\"0\" topmargin=\"0\" marginheight=\"0\" offset=\"0\">\n" +
" <center>\n" +
" <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\" id=\"backgroundTable\">\n" +
" <tr>\n" +
" <td align=\"center\" valign=\"top\">\n" +
" <!-- // Begin Template Preheader \\\\ -->\n" +
" <table border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"600\" id=\"templatePreheader\">\n" +
" <tr>\n" +
" <td valign=\"top\" class=\"preheaderContent\">\n" +
" \n" +
" <!-- // Begin Module: Standard Preheader \\ -->\n" +
" <table border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"100%\">\n" +
" <tr>\n" +
" <td valign=\"top\">\n" +
" <div mc:edit=\"std_preheader_content\">\n" +
"\n" +
" </div>\n" +
" </td>\n" +
" </tr>\n" +
" </table>\n" +
" <!-- // End Module: Standard Preheader \\ -->\n" +
" \n" +
" </td>\n" +
" </tr>\n" +
" </table>\n" +
" <!-- // End Template Preheader \\\\ -->\n" +
" <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" id=\"templateContainer\">\n" +
" <tr>\n" +
" <td align=\"center\" valign=\"top\">\n" +
" <!-- // Begin Template Header \\\\ -->\n" +
" <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" id=\"templateHeader\">\n" +
" <tr>\n" +
" <td class=\"headerContent\">\n" +
" \n" +
" <!-- // Begin Module: Standard Header Image \\\\ -->\n" +
" <img src=\"http://universitiesclub.com/static/upload/user/National_University_of_Singapore_Institue_of_System_Science_21/57aac179c8edb.jpg\" style=\"max-width:600px;\" id=\"headerImage campaign-icon\" mc:label=\"header_image\" mc:edit=\"header_image\" mc:allowdesigner mc:allowtext />\n" +
" <!-- // End Module: Standard Header Image \\\\ -->\n" +
" \n" +
" </td>\n" +
" </tr>\n" +
" </table>\n" +
" <!-- // End Template Header \\\\ -->\n" +
" </td>\n" +
" </tr>\n" +
" <tr>\n" +
" <td align=\"center\" valign=\"top\">\n" +
" <!-- // Begin Template Body \\\\ -->\n" +
" <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" id=\"templateBody\">\n" +
" <tr>\n" +
" <td valign=\"top\" class=\"bodyContent\">\n" +
" \n" +
" <!-- // Begin Module: Standard Content \\\\ -->\n" +
" <table border=\"0\" cellpadding=\"20\" cellspacing=\"0\" width=\"100%\">\n" +
" <tr>\n" +
" <td valign=\"top\">\n" +
" <div mc:edit=\"std_content00\">\n" +
" <h4 class=\"h6\">Courses Registration Successful</h4>\n" +
" <strong>CAPS Registration:</strong> \n" +
" <br />\n" +
"Congratulations"+" "+ student.getUser().getFirstName()+" "+student.getUser().getLastName()+". You have successfully enrolled in courses on Course Application Processing System(CAPS).\n" +
"\n" +
"To view your courses, go to  <a href="+localUrl+">CAPS online website</a>. If this email has been wrongly sent, ignore this email.\n" +
" </div>\n" +
"	</td>\n" +
" </tr>\n" +
" </table>\n" +
" <!-- // End Module: Standard Content \\\\ -->\n" +
" \n" +
" </td>\n" +
" </tr>\n" +
" </table>\n" +
" <!-- // End Template Body \\\\ -->\n" +
" </td>\n" +
" </tr>\n" +
" <tr>\n" +
" <td align=\"center\" valign=\"top\">\n" +
" <!-- // Begin Template Footer \\\\ -->\n" +
" <table border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"600\" id=\"templateFooter\">\n" +
" <tr>\n" +
" <td valign=\"top\" class=\"footerContent\">\n" +
" \n" +
" <!-- // Begin Module: Standard Footer \\\\ -->\n" +
" <table border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"100%\">\n" +
" <tr>\n" +
" <td colspan=\"2\" valign=\"middle\" id=\"social\">\n" +
" <div mc:edit=\"std_social\">\n" +
" &nbsp;<a href=\"http://nus.edu.sg\">NUS Homepage</a> | <a>SA43 Team11</a>&nbsp;\n" +
" </div>\n" +
" </td>\n" +
" </tr>\n" +
" <tr>\n" +
" <td valign=\"top\" width=\"350\">\n" +
" <div mc:edit=\"std_footer\">\n" +
"	<em>Copyright &copy;  |2016| Course Application Processing System by SA43 Team11 <br>\n" +
"	All rights reserved.</em>\n" +
"	<br /></br>\n" +
"	\n" +
"	<strong>Contact us:</strong>\n" +
"	<br />\n" +
"+65 6079 4421\n" +
"<br><br>\n" +
"<strong>Mailing address:</strong>\n" +
"	<br />\n" +
"25 Heng Mui Terrace Street 24 S689425\n" +
" </div>\n" +
" </td>\n" +
" <td valign=\"top\" width=\"190\" id=\"monkeyRewards\">\n" +
" <div mc:edit=\"monkeyrewards\">\n" +
" <!-- // End Module: Standard Footer \\\\ -->\n" +
" \n" +
" </td>\n" +
" </tr>\n" +
" </table>\n" +
" <!-- // End Template Footer \\\\ -->\n" +
" </td>\n" +
" </tr>\n" +
" </table>\n" +
" <br />\n" +
" </td>\n" +
" </tr>\n" +
" </table>\n" +
" </center>\n" +
" </body>\n" +
"</html>";
        return s;
    }
}
