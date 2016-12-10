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
        <form action="${pageContext.request.contextPath}/student/doenroll" method="post" id="enroledCourseForm" role="form">
            <c:choose>
                <c:when test="${not empty courses}">
                    <table class="table-striped" cellpadding="5" cellspacing="5" border="1.5">
                        <thead style="background-color: #00ccff">
                            <tr>
                                <td>Select</td>
                                <td>Id</td>
                                <td>Course Name</td>
                                <td>Credits</td>
                                <td>Duration</td>
                                <td>Course Size</td>
                                <td>Lecture</td>
                            </tr>
                        </thead>
                        <c:forEach var="course" items="${courses}" varStatus="status">
                            <tr >
                                <td style="background-color: yellow"><input type="checkbox" name="${course.courseId}"</td>
                                <td>${course.courseId}</td>
                                <td>${course.name}</td>
                                <td>${course.credits}</td>
                                <td>${course.duration}</td>
                                <td>${course.courseSize}</td>
                                <td>${course.lecturer.user.firstName}</td>
                            <br/>
                            </tr>
                        </c:forEach>
                    </table>
                    <br />
                    <input class="btn btn-primary" type="submit" name="enrolButton" value="Submit Selected Courses"></input>
                </c:when>
            </c:choose>
        </form>
    </body>
</html>
