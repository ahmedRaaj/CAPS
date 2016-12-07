/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.repository;

import java.util.List;
import org.springframework.data.jpa.repository.*;
import org.springframework.data.repository.query.Param;
import org.teameleven.caps.model.*;

/**
 *
 * @author ahmedraaj
 */

public interface AdminRepository extends JpaRepository<Admin, Integer> {
    
    @Query(value = "Select u.userName from users u where u.userId = :uid")
    public List<String> findUserById (@Param("uid") int idInt);
            
    @Query(value = "Select * from Student s")
    public List<Student> getAllStudents ();
    
    @Query(value = "Select s from Student s where s.studentId = :stdId")
    public Student findAStudentById(@Param("stdId") String sid);
    
    @Query(value = "Select * from Lecturer l")
    public List<Lecturer> getAllLecturers();
    
}
