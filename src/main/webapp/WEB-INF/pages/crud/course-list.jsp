<%-- 
    Document   : course-list
    Created on : 7 Dec, 2016, 4:47:38 PM
    Author     : ahmedraaj
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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

    <form action="${pageContext.request.contextPath}/admin/course.search" method="post" id="seachCourseForm" role="form" >
        <div class="form-group col-xs-5">
            <input type="text" name="search" id="search" class="form-control" required="true"
                   placeholder="Search by anything of the Course"/>
        </div>
        <button type="submit" class="btn btn-info">
            <span class="glyphicon glyphicon-search"></span> Search
        </button>
        <br/>
        <br/>
    </form>

    <form action="${pageContext.request.contextPath}/admin/course.list" method="post" id="courseForm" role="form">
        <c:choose>
            <c:when test="${not empty courseList}">
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
                            <%--<td><a href="${pageContext.request.contextPath}/admin/course/edit?courseId=${course.courseId}">${course.courseId}</a></td>--%>
                            <td>${course.courseId}</td>
                            <td>${course.name}</td>
                            <td>${course.credits}</td>
                            <td>${course.duration}</td>
                            <td>${course.courseSize}</td>
                            <td>${course.lecturer.user.firstName} ${course.lecturer.user.lastName}</td>
                            <td><a href="#" id="remove"
                                   onclick="document.location.href='${pageContext.request.contextPath}/admin/course.del?courseId=${course.courseId}'">
                                <span class="glyphicon glyphicon-trash"/>
                            </a></td>
                            <td><a href="course.edit?courseId=${course.courseId}" id="edit"
                                   onclick="document.getElementById('action').value = 'edit';document.getElementById('courseId').value = '${course.courseId}';
                                           document.getElementById('courseForm').submit();">
                                <span class="glyphicon glyphicon-edit"/>
                            </a>
                            </td>

                            <%request.setAttribute("courseId","${course.courseId}");%>
                            <%--<td><a href="${pageContext.request.contextPath}/admin/cform?courseId==${course.courseId}">edit</a></td>--%>
                        </tr>
                    </c:forEach>
                </table>

           </c:when>                    
                    <c:otherwise>
                        <br>  </br>           
                        <div class="alert alert-info">
                            No people found matching your search criteria
                        </div>
                    </c:otherwise>
                </c:choose>                        
            </form>
        
                    <c:choose>
                <c:when test ="${not empty count}">
                    <div>
                        <ul class="pagination">
                            <c:forEach var="i" begin="0" end="${count-1}" >
                                <c:choose>
                                    <c:when test="${pageId == i}">
                                        <li class="active">  <a  href="${pageContext.request.contextPath}/admin/course.list?pageId=${i}">${i+1}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li>  <a class="" href="${pageContext.request.contextPath}/admin/course.list?pageId=${i}">${i+1}</a> </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <form action ="${pageContext.request.contextPath}/admin/course.list">
                        <br/>
                        <button type="submit" class="btn btn-primary  btn-md">Back</button> 
                    </form>
                </c:otherwise>
            </c:choose>
        
    </div>

        <button type="submit" class="btn btn-primary btn-md" onclick="document.location.href='${pageContext.request.contextPath}/admin/course.add'">New Course</button>

    </body>
</html>
