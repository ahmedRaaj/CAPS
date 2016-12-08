<%-- 
    Document   : grade
    Created on : 8 Dec, 2016, 1:06:10 PM
    Author     : Lau Mong Pau
--%>
<%@page import="java.util.Date"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Grades and GPA</title>
    </head>
    
        <h1>Grades and GPA</h1>
        <% Date dt = new Date();%>

        <c:set var="totalCredit" value="${0}"/>
        <c:set var="totalGradePoint" value="${0}"/>

        <c:forEach var="enroledcourse" items="${enroledcourses}">
            <c:set var="totalCredit" value="${totalCredit + enroledcourse.course.credit}"/>
            <c:set var="totalGradePoint" value="${totalGradePoint + (enroledcourse.course.credit * enroledcourse.gradePoint)}"/>
        </c:forEach>

        <table>
            <tr>
                <td width="20%"><strong>Student ID</strong></td>
                <td width="15%">${enroledcourses.student.studentId}</td>
                <td width="25%"><strong>Student Name</strong></td>
                <td width="40%">${enroledcourses.student.user.firstName}, ${enroledcourses.student.user.lastName}</td>                
            </tr>
            <tr>
                <td width="20%"><strong>GPA</strong></td>
                <td width="15%">${totalGradePoint / totalCredit}</td>
                <td width="25%"><strong>Date</strong></td>
                <td width="40%">${dt.toString()}</td>
            </tr>
        </table>
        <div style="padding-top: 50px;">
            <c:choose>
                <c:when test="${empty grades}">
                    Grades Table is empty.
                </c:when>
                <c:otherwise>
                    <table>
                        <thead>
                            <tr>
                                <th> Course Id </th>
                                <th> Course Name </th>
                                <th> Grade </th>
                                <th> Credit </th>
                                <th> Grade Point </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="enroledcourse" items="${enroledcourses}">
                                <tr>
                                    <td> ${enroledcourse.course.courseId} </td>
                                    <td> ${enroledcourse.course.name} </td>
                                    <td> ${enroledcourse.gradePoint} </td>
                                    <td> ${enroledcourse.course.credits} </td>
                                    <td> ${enroledcourse.course.credit * enroledcourse.gradePoint} </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:otherwise>
            </c:choose>
        </div>
    


