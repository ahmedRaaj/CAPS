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
import org.teameleven.caps.model.Student;
import org.teameleven.caps.repository.StudentRepository;
import org.teameleven.caps.services.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {

    StudentService studentService = new StudentService();
    @Autowired
    StudentRepository dao;

    @RequestMapping("/list")
    public ModelAndView name() {

        ModelAndView v = new ModelAndView("student/list");
        //v.addObject("studentList", studentService.getAllStudents());
        v.addObject("studentList", dao.findAll());
        return v;

//		ModelAndView mv = new ModelAndView("welcome");
//		mv.addObject("msg","Hi welcome to spring");
//		return mv;
    }

    @RequestMapping("/form")
    public ModelAndView createOrEditStudent(@ModelAttribute("student") Student student) {

        //service.setValue(5);
        if(student == null) Logger.getLogger(StudentController.class).log(Logger.Level.FATAL, "student Null");
        ModelAndView v = new ModelAndView("student/form");
        v.addObject("student", student);
        return v;
    }
    
    @RequestMapping(name ="/search/{studentName}",method = RequestMethod.GET)
    public ModelAndView searchByName(@RequestParam("studentName") String studentName){
        ModelAndView v = new ModelAndView("student/list");
        //v.addObject("studentList", studentService.getAllStudents());
        v.addObject("studentList", dao.findAll());
        return v;
    }
}
