<%-- 
    Document   : course-enrolment
    Created on : 8 Dec, 2016, 2:53:48 PM
    Author     : Lau Mong Pau
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Student Course Enrollment</title>
    </head>
    <body>
        <h1>Student Course Enrollment</h1>
        <% 
            Date dt = new Date();
            Calendar cal = Calendar.getInstance();
            int yr = cal.get(Calendar.YEAR);
            int mo = cal.get(Calendar.MONTH);
            String semester = null;
            if (mo >= 8)
                semester = "February-" + yr;
            else
                semester = "August-" + yr;
        %>

                <table>
            <tr>
                <td width="20%"><strong>Student ID</strong></td>
                <td width="15%">${enroledcourses.student.studentId}</td>
                <td width="25%"><strong>Student Name</strong></td>
                <td width="40%">${enroledcourses.student.user.firstName}, ${enroledcourses.student.user.lastName}</td>                
            </tr>
            <tr>
                <td width="20%"><strong>Semester</strong></td>
                <td width="15%">${semester}</td>
                <td width="25%"><strong>Date</strong></td>
                <td width="40%">${dt.toString()}</td>
            </tr>
        </table>
    <div class="container">
        <form action="${pageContext.request.contextPath}/admin/clist" method="post" id="enroledCourseForm" role="form">
        <c:choose>
            <c:when test="${not empty enroledcourses}">
                <table class="table table-responsive">
                    <thead>
                    <tr>
                        <td>Course ID</td>
                        <td>Course Name</td>
                        <td>Credits</td>
                        <td>Duration</td>
                        <td>Course Size</td>
                        <td>Lecture</td>
                    </tr>
                    </thead>
                    <c:forEach var="course" items="${courseList}">
                        <tr >
                            <td>${course.courseId}</td>
                            <td>${course.name}</td>
                            <td>${course.credits}</td>
                            <td>${course.duration}</td>
                            <td>${course.courseSize}</td>
                            <td>${course.lecturerslecturerId.user.firstName}</td>
                            <td><a href="${pageContext.request.contextPath}/admin/cform?courseId==${course.courseId}">edit</a></td>
                            <br/>
                        </tr>
                    </c:forEach>
                </table>

            </c:when>
        </c:choose>

    </div>

    </body>
</html>
