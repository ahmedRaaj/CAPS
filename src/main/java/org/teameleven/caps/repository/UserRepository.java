/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.teameleven.caps.model.User;

/**
 *
 * @author ahmedraaj
 */
public interface UserRepository extends JpaRepository<User, Integer> {
    @Query("select u from User u where u.userName = ?1 and u.password = ?2")
    public User getAuthenticateUser(String userName,String password);
}
