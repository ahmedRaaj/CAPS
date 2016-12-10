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
        
        <div class="container">
        <form action="${pageContext.request.contextPath}/lecturer/filter.course" method="post" id="searchStudentsByCourseName" role="form" >
            <h3>Student Performance</h3>
            <br/>
            <select name="courseId">
                <c:forEach var="course" items="${courses}">
                    <option name="${course.courseId}" value="${course.courseId}">${course.name} </option>
                </c:forEach>
            </select>                               
            <input type="submit" value="FILTER" class="btn-success">
        </form>


        <table>
            <tr>
                <td>

                    <c:choose>
                        <c:when test="${empty enroledcourses }">
                            Table is empty.
                        </c:when>
                        <c:otherwise>
                            <form method="post" action="${pageContext.request.contextPath}/lecturer/submit.grade"><%--need the url of controller--%>

                                <table class="table">
                                    <thead>
                                        <tr>
                                          
                                            <th>STUDENT NAME</th>
                                            <th> COURSE NAME </th>
                                            <th> GRADE POINT </th>                          
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="enroled" items="${enroledcourses}"><%--need to get arraylist from controller for students and status from enroled course table--%>
                                            <tr>
                                                
                                                 <td> <c:out value="${enroled.student.user.firstName} ${enroled.student.user.lastName}"/> </td> 
                                                <td> <c:out value="${enroled.course.name}"/> </td>
                                                <td><input name="${enroled.student.studentId}" id="${enroled.student.studentId}" type="text" value="${enroled.gradePoint}"/></td>       
                                            </tr>
                                        </c:forEach>   
                                    </tbody>
                                </table>
                                <input type="submit" value="submit" class="btn-success">
                            </form>
                              
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>    
        </table>                
</div>
    </body>
</html>
