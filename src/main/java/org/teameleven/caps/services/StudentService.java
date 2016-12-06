/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.teameleven.caps.model.Student;
import org.teameleven.caps.repository.StudentRepository;

/**
 *
 * @author ahmedraaj
 */
public class StudentService {

    @Autowired
    StudentRepository dao;

    public StudentService() {
    }

 

    public List<Student> getAllStudents() {

        return dao.findAll();
    }

}
