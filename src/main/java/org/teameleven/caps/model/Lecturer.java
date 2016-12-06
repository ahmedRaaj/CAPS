/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ahmedraaj
 */
@Entity
@Table(name = "lecturers")
@XmlRootElement
//@NamedQueries({
//    @NamedQuery(name = "Lecturer.findAll", query = "SELECT l FROM Lecturer l")
//    , @NamedQuery(name = "Lecturer.findByLecturerId", query = "SELECT l FROM Lecturer l WHERE l.lecturerId = :lecturerId")
//    , @NamedQuery(name = "Lecturer.findByStartDate", query = "SELECT l FROM Lecturer l WHERE l.startDate = :startDate")
//    , @NamedQuery(name = "Lecturer.findByEndDate", query = "SELECT l FROM Lecturer l WHERE l.endDate = :endDate")
//    , @NamedQuery(name = "Lecturer.findByPosition", query = "SELECT l FROM Lecturer l WHERE l.position = :position")})
public class Lecturer implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "lecturerId")
    private Integer lecturerId;
    @Column(name = "startDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date startDate;
    @Column(name = "endDate")
    @Temporal(TemporalType.TIMESTAMP)
    private Date endDate;
    @Column(name = "position")
    private String position;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "lecturerslecturerId")
    private List<Course> coursesList;
    @JoinColumn(name = "users_userId", referencedColumnName = "userId")
    @OneToOne(optional = false)
    private User usersuserId;

    public Lecturer() {
    }

    public Lecturer(Integer lecturerId) {
        this.lecturerId = lecturerId;
    }

    public Integer getLecturerId() {
        return lecturerId;
    }

    public void setLecturerId(Integer lecturerId) {
        this.lecturerId = lecturerId;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    @XmlTransient
    public List<Course> getCoursesList() {
        return coursesList;
    }

    public void setCoursesList(List<Course> coursesList) {
        this.coursesList = coursesList;
    }

    public User getUsersuserId() {
        return usersuserId;
    }

    public void setUsersuserId(User usersuserId) {
        this.usersuserId = usersuserId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (lecturerId != null ? lecturerId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Lecturer)) {
            return false;
        }
        Lecturer other = (Lecturer) object;
        if ((this.lecturerId == null && other.lecturerId != null) || (this.lecturerId != null && !this.lecturerId.equals(other.lecturerId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.capse.entity.Lecturers[ lecturerId=" + lecturerId + " ]";
    }
    
}
