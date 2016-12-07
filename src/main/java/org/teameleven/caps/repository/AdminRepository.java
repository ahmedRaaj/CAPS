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
    

    
}
