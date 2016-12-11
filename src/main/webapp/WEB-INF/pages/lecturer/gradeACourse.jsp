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
            <input type="submit" value="FILTER" class="btn-primary">
        </form>


        <table>
            <tr>
                <td>

                    <c:choose>
                        <c:when test="${empty enroledcourses }">
                            Table is empty.
                        </c:when>
                        <c:otherwise>
                             <form action ="${pageContext.request.contextPath}/lecturer/gradecourse?pageId=0">    

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
                                <c:choose>
                                    <c:when test ="${not empty countEnrol}">
                                        <div>
                                            <ul class="pagination">
                                                <c:forEach var="i" begin="0" end="${countEnrol-1}" >
                                                    <c:choose>
                                                        <c:when test="${pageId == i}">
                                                            <li class="active">  <a  href="${pageContext.request.contextPath}/lecturer/gradecourse?pageId=${i}">${i+1}</a></li>
                                                            </c:when>
                                                            <c:otherwise>
                                                            <li>  <a class="" href="${pageContext.request.contextPath}/lecturer/gradecourse?pageId=${i}">${i+1}</a> </li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                            </ul>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                              
                                            
                                            <button type="submit" class="btn btn-primary  btn-md">Back</button> 
                                        </form>
                                    </c:otherwise>
                                </c:choose>
                                
                                        <form method="post" action="${pageContext.request.contextPath}/lecturer/submit.grade">
                                <input type="submit" value="submit" class="btn btn-primary">
                            </form>
                              
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>    
        </table>            
            
                    
</div>
    </body>
</html>
