<%-- 
    Document   : course-list
    Created on : 7 Dec, 2016, 4:47:38 PM
    Author     : ahmedraaj
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Course List</title>
    </head>
    <body>
    <div class="container">
        <form action="${pageContext.request.contextPath}/admin/clist" method="post" id="courseForm" role="form">
        <c:choose>
            <c:when test="${not empty courseList}">
                <table class="table table-responsive">
                    <thead>
                    <tr>
                        <td>Couse ID</td>
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
