<%-- 
    Document   : view-course
    Created on : 8 Dec, 2016, 11:13:38 AM
    Author     : Lau Mong Pau
--%>
<%@page import="java.util.Date"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>View Courses By Student</title>
</head>

<h1>View Courses By Student</h1>
<% Date dt = new Date();%>
<p style="float: left">Date: ${dt.toString()}</p>



    <c:choose>
        <c:when test="${empty viewcourses}">
            View Course Table is empty.
        </c:when>
        <c:otherwise>
            <table class="table">
                <thead>
                    <tr>
                        <th> Course Id </th>
                        <th> Course Name </th>
                        <th> Duration </th>
                        <th> Credit </th>
                        <th> Lecturer </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="viewcourse" items="${viewcourses}">
                        <tr>
                            <td> ${viewcourse.courseId} </td>
                            <td> ${viewcourse.name} </td>
                            <td> ${viewcourse.duration} </td>
                            <td> ${viewcourse.credits} </td>
                            <td> ${viewcourse.lecturer.user.firstName}, ${viewcourse.lecturer.user.lastName}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:otherwise>
    </c:choose>



