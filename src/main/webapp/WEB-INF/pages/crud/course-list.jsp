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

    <h2>Courses</h2>
    <!--Search Form -->

    <form action="${pageContext.request.contextPath}/course/search" method="get" id="seachCourseForm" role="form" >
        <div class="form-group col-xs-5">
            <input type="text" name="courseName" id="courseName" class="form-control" required="true"
                   placeholder="Type course name"/>
        </div>
        <button type="submit" class="btn btn-info">
            <span class="glyphicon glyphicon-search"></span> Search
        </button>
        <br/>
        <br/>
    </form>

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
                            <td><a href="${pageContext.request.contextPath}/admin/cform?courseId==${course.courseId}">${course.courseId}</a></td>
                            <td>${course.name}</td>
                            <td>${course.credits}</td>
                            <td>${course.duration}</td>
                            <td>${course.courseSize}</td>
                            <td>${course.lecturerslecturerId.user.firstName}</td>
                            <td><a href="#" id="remove"
                                   onclick="document.getElementById('action').value = 'remove';document.getElementById('courseId').value = '${course.courseId}';
                                           document.getElementById('courseForm').submit();">
                                <span class="glyphicon glyphicon-trash"/>
                            </a></td>
                            <%--<td><a href="${pageContext.request.contextPath}/admin/cform?courseId==${course.courseId}">edit</a></td>--%>
                        </tr>
                    </c:forEach>
                </table>

            </c:when>
        </c:choose>


    </div>

    <form action ="${pageContext.request.contextPath}/course/form">
        <br/>
        <button type="submit" class="btn btn-primary  btn-md">New Course</button>
    </form>

    </body>
</html>
