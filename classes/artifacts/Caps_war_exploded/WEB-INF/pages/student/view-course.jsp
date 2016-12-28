<%-- 
    Document   : view-course
    Created on : 8 Dec, 2016, 11:13:38 AM
    Author     : Lau Mong Pau
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>View Courses By Student</title>
</head>

<h1>Course Enrollment Status</h1>

        <%
            Calendar cal = Calendar.getInstance();
            int yr = cal.get(Calendar.YEAR);
            int mo = cal.get(Calendar.MONTH);
            String semester = null;
            if (mo >= 8) {
                semester = "Feb-" + yr;
            } else {
                semester = "Aug-" + yr;
            }
        %>
        <table class="table-bordered" cellpadding="5" cellspacing="5" border="1.5">
            <tr>
                <td width="20%"><strong>Student ID</strong></td>
                <td width="15%">${student.studentId}</td>
                <td width="20%"><strong>Student Name</strong></td>
                <td width="45%">${student.user.firstName}, ${student.user.lastName}</td>                
            </tr>
            <tr>
                <td width="20%"><strong>For Semester</strong></td>
                <td width="15%"><%= semester%></td>
                <td width="20%"><strong>Date</strong></td>
                <td width="45%" class="align-left"><%= new java.util.Date()%></td>
            </tr>
        </table>
        <br />
        <br />
<c:choose>
    <c:when test="${empty viewcourses}">
        View Course Table is empty.
    </c:when>
    <c:otherwise>
        <table class="table" cellpadding="5" cellspacing="5" border="2">
            <thead style="background-color: #00ccff">
                <tr>
                    <th> Id </th>
                    <th> Course Name </th>
                    <th> Status </th>
                    <th> Credit </th>
                    <th> Lecturer </th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="viewcourse" items="${viewcourses}">
                    <tr>
                        <td align="middle"> ${viewcourse.course.courseId} </td>
                        <td> ${viewcourse.course.name} </td>
                        <td align="middle"> ${viewcourse.status} </td>
                        <td align="middle"> ${viewcourse.course.credits} </td>
                        <td> ${viewcourse.course.lecturer.user.firstName}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>



