package org.teameleven.caps.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.teameleven.caps.model.Admin;
import org.teameleven.caps.model.User;

public interface AdminRepository extends JpaRepository<Admin, Integer > {
	
}
