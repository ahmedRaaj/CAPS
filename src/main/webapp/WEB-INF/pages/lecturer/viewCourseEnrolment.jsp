<%-- 
    Document   : viewCourseEnrolment
    Created on : Dec 8, 2016, 10:30:17 AM
    Author     : Janaki
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Course Enrollment Page</title>
    </head>
    <body>
        <form method="post" action=""><%--need the url of controller--%>
            <table>
            <tr>
                <td>
                <form action="#" method="get" id="seachStudentForm" role="form" >
                                <select name="course">
                                    <c:forEach var="course" items="${courses}">
                                        <option name="${course.courseId}">${course.name} </option>
                                    </c:forEach>
                                </select>
                            </form>
                </td>
            </tr>
            <tr>
                <td>
            <input type="submit" value="SUBMIT">
                </td>
            </tr>
            <tr>
                <td>
                <c:choose>
                <c:when test="${empty enroledcourses }">
                Table is empty.
                </c:when>
                <c:otherwise>
                    <table class="table">
                    <thead>
                    <tr>
                    <th>STUDENT ID</th>
                    <th> STUDENT NAME </th>
                    <th> STATUS </th>         
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="enroled" items="${enroledcourses}"><%--need to get arraylist from controller for students and status from enroled course table--%>
                    <tr>
                    <td> <c:out value="${enroled.student.studentId}"/> </td> 
                    <td> <c:out value="${enroled.student.user.firstName}"/> </td>
                    <td> <c:out value="${enroled.status}"/> </td>         
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
                </c:otherwise>
                </c:choose>
                </td>
            </tr>

            </table>
        
        </form>
    </body>
</html>
