<%-- 
    Document   : gradeACourse
    Created on : Dec 8, 2016, 10:30:41 AM
    Author     : Janaki
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Grade a course Page</title>
    </head>
    <body>
        <form method="post" action=""><%--need the url of controller--%>
            <table>
            <tr>
                <td>
                <form:select path="course">
                <form:option value="NONE" label="--- Select a Course ---"/>
                <form:options items="${countryList}" /><%--need an arraylist of course names from controller--%>
                </form:select>
                </td>
            </tr>
            
            <tr>
                <td>
                <c:choose>
                <c:when test="${empty EnroledCourse }">
                Table is empty.
                </c:when>
                <c:otherwise>
                <table>
                    <thead>
                    <tr>
                    <th>STUDENT ID</th>
                    <th>STUDENT NAME</th>
                    <th> GRADE POINT </th>                          
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="enroled" items="${Course}"><%--need to get arraylist from controller for students and status from enroled course table--%>
                    <tr>
                    <td> <c:out value="${enroled.student.studentId}"/> </td> 
                    <td> <c:out value="${enroled.student.User.firstname}"/> </td> 
                    <td><input type="text" value="${enroled.gradePoint}"/></td>       
                    </tr>
                    </c:forEach>
                    <tr><input type="submit" text="SUBMIT"></tr>
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
