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
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ahmedraaj
 */
@Entity
@Table(name = "students")
@XmlRootElement
//@NamedQueries({
//    @NamedQuery(name = "Student.findAll", query = "FROM Student s")
//    , @NamedQuery(name = "Student.findByStudentId", query = "FROM Student s WHERE s.studentId = :studentId")
//    , @NamedQuery(name = "Student.findByNric", query = "FROM Student s WHERE s.nric = :nric")
//    , @NamedQuery(name = "Student.findByCitizenship", query = "FROM Student s WHERE s.citizenship = :citizenship")})
public class Student implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "studentId")
    private Integer studentId;
    @Basic(optional = false)
    @Column(name = "nric")
    private String nric;
    @Column(name = "citizenship")
    private String citizenship;
    @Column(name="first_name")
    private String firstName;
    @Column(name="last_name")
    private String lastName;
    @Column(name="dob")
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dob;
    @Column(name="gender")
    private String gender;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "student")
    private List<EnroledCourse> enroledCoursesList;
    @JoinColumn(name = "users_userId", referencedColumnName = "userId")
    @ManyToOne(optional = false)
    private User usersuserId;

    public Student() {
    }

    public Student(Integer studentId) {
        this.studentId = studentId;
    }

    public Student(Integer studentId, String nric) {
        this.studentId = studentId;
        this.nric = nric;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getNric() {
        return nric;
    }

    public void setNric(String nric) {
        this.nric = nric;
    }

    public String getCitizenship() {
        return citizenship;
    }

    public void setCitizenship(String citizenship) {
        this.citizenship = citizenship;
    }

    @XmlTransient
    public List<EnroledCourse> getEnroledCoursesList() {
        return enroledCoursesList;
    }

    public void setEnroledCoursesList(List<EnroledCourse> enroledCoursesList) {
        this.enroledCoursesList = enroledCoursesList;
    }

    public User getUsersuserId() {
        return usersuserId;
    }

    public void setUsersuserId(User usersuserId) {
        this.usersuserId = usersuserId;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (studentId != null ? studentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Student)) {
            return false;
        }
        Student other = (Student) object;
        if ((this.studentId == null && other.studentId != null) || (this.studentId != null && !this.studentId.equals(other.studentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return this.firstName + " " + this.lastName + " " + this.citizenship;
    }
    
}
