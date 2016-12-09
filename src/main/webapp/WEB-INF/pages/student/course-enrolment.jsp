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
        <div id="header" class="col-md-10">

            <h2>Student Course Enrollment</h1> <br/>
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
                <div class="row"> 
                    <div class="col-md-3">
                        <span class="">
                            <p><strong>Student ID</strong></p>
                        </span>
                    </div>
                    <div class="col-md-3">
                        <span>
                            <p><strong>Student Name</strong></p>
                        </span>
                    </div>
                    <div class="col-md-3">
                        <span>
                            <p><strong>Semester</strong></p>
                        </span>
                    </div>
                    <div class="col-md-3">
                        <span>
                            <p><strong>Date</strong></p>
                        </span>
                    </div>
                </div>

                <div class="row2">
                    <div class="col-md-3">
                        <span class="">
                            <p>${student.studentId}</p>
                        </span>
                    </div>
                    <div class="col-md-3">
                        <span>
                            <p> ${student.user.firstName} ${student.user.lastName}</p>
                        </span>
                    </div>
                    <div class="col-md-3">
                        <span>
                            <p><%= semester%></p>
                        </span>
                    </div>
                    <div class="col-md-3">
                        <span>
                            <p><%= new java.util.Date()%></p>
                        </span>
                    </div>
                </div>
        </div>
                 <br/>

        <div class="table table-striped">
            <form action="${pageContext.request.contextPath}/admin/clist" method="post" id="enroledCourseForm" role="form">
                <c:choose>
                    <c:when test="${not empty courses}">
                        <table class="table-striped" cellpadding="5" cellspacing="5" border="1">
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
                            <c:forEach var="course" items="${courses}">
                                <tr >
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
                    </c:when>
                </c:choose>
        </div>
    </body>
</html>
