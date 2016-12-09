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

<h1>View Courses By Student</h1>

<p style="float: left"><strong>Date: </strong></p>
<p style="float: left"><%= new java.util.Date() %></p>

<c:choose>
    <c:when test="${empty viewcourses}">
        View Course Table is empty.
    </c:when>
    <c:otherwise>
        <table class="table" cellpadding="5" cellspacing="5" border="1">
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
                        <td align="middle"> ${viewcourse.courseId} </td>
                        <td> ${viewcourse.name} </td>
                        <td align="middle"> ${viewcourse.duration} </td>
                        <td align="middle"> ${viewcourse.credits} </td>
                        <td> ${viewcourse.lecturer.user.firstName}, ${viewcourse.lecturer.user.lastName}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:otherwise>
</c:choose>



