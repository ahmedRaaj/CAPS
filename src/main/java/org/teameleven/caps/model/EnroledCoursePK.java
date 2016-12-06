/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author ahmedraaj
 */
@Embeddable
public class EnroledCoursePK implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Basic(optional = false)
    @Column(name = "students_studentId")
    private int studentsstudentId;
    @Basic(optional = false)
    @Column(name = "courses_courseId")
    private int coursescourseId;

    public EnroledCoursePK() {
    }

    public EnroledCoursePK(int studentsstudentId, int coursescourseId) {
        this.studentsstudentId = studentsstudentId;
        this.coursescourseId = coursescourseId;
    }

    public int getStudentsstudentId() {
        return studentsstudentId;
    }

    public void setStudentsstudentId(int studentsstudentId) {
        this.studentsstudentId = studentsstudentId;
    }

    public int getCoursescourseId() {
        return coursescourseId;
    }

    public void setCoursescourseId(int coursescourseId) {
        this.coursescourseId = coursescourseId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) studentsstudentId;
        hash += (int) coursescourseId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof EnroledCoursePK)) {
            return false;
        }
        EnroledCoursePK other = (EnroledCoursePK) object;
        if (this.studentsstudentId != other.studentsstudentId) {
            return false;
        }
        if (this.coursescourseId != other.coursescourseId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.capse.entity.EnroledCoursesPK[ studentsstudentId=" + studentsstudentId + ", coursescourseId=" + coursescourseId + " ]";
    }
    
}
