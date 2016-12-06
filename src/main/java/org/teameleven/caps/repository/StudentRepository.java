package org.teameleven.caps.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.teameleven.caps.model.Student;
import org.teameleven.caps.model.User;

public interface StudentRepository extends JpaRepository< Student ,Integer> {

}
