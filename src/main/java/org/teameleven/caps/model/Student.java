/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.teameleven.caps.model;

import java.io.Serializable;
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

/**
 *
 * @author ahmedraaj
 */
@Entity
@Table(name = "students")
//@NamedQueries({
//    @NamedQuery(name = "Student.findAll", query = "SELECT s FROM Student s")
//    , @NamedQuery(name = "Student.findByStudentId", query = "SELECT s FROM Student s WHERE s.studentId = :studentId")
//    , @NamedQuery(name = "Student.findByCitizenship", query = "SELECT s FROM Student s WHERE s.citizenship = :citizenship")
//    , @NamedQuery(name = "Student.findByNric", query = "SELECT s FROM Student s WHERE s.nric = :nric")})
public class Student implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "studentId")
    private Integer studentId;
    @Column(name = "citizenship")
    private String citizenship;
    @Column(name = "nric")
    private String nric;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "student")
    private List<EnroledCourse> enroledCourseList;
    @JoinColumn(name = "user_userId", referencedColumnName = "userId")
    @OneToOne(optional = false,cascade = CascadeType.ALL)
    private User user;

    public Student() {
    }

    public Student(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getCitizenship() {
        return citizenship;
    }

    public void setCitizenship(String citizenship) {
        this.citizenship = citizenship;
    }

    public String getNric() {
        return nric;
    }

    public void setNric(String nric) {
        this.nric = nric;
    }

    public List<EnroledCourse> getEnroledCourseList() {
        return enroledCourseList;
    }

    public void setEnroledCourseList(List<EnroledCourse> enroledCourseList) {
        this.enroledCourseList = enroledCourseList;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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
        return "org.caps.model.Student[ studentId=" + studentId + " ]";
    }
    
}
