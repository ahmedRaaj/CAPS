<%-- 
    Document   : list
    Created on : 6 Dec, 2016, 9:58:48 PM
    Author     : ahmedraaj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Student List</title>
    </head>
    <body>			
        <div class="container">

            <h2>Students</h2>
            <!--Search Form -->
            <form action="${pageContext.request.contextPath}/admin/student.search" method="post" id="seachStudentForm" role="form" >
                <div class="form-group col-xs-5">
                    <input type="text" name="search" id="search" class="form-control" required="true" 
                           placeholder="Search By Anything"/>                    
                </div>
                <button type="submit" class="btn btn-info">
                    <span class="glyphicon glyphicon-search"></span> Search
                </button>

            </form>

            <br/>
            <br/>
            <form action="${pageContext.request.contextPath}/admin/student.list" method="post" id="studentForm" role="form" >
                <input type="hidden" id="studentId" name="studentId">
                <input type="hidden" id="action" name="action">
                <c:choose>
                    <c:when test="${not empty studentList}">
                        <table  class="table table-striped">
                            <thead>
                                <tr>
                                    <td>#</td>
                                    <td>First Name</td>
                                    <td>Last name</td>
                                    <td>Gender</td>
                                    <td>Birth date</td>
                                    <td>Citizenship</td>
                                    <td>NRIC</td>

                                </tr>
                            </thead>
                            <c:forEach var="student" items="${studentList}">
                                <c:set var="classSucess" value=""/>
                                <c:if test ="${studentId == student.studentId}">                           
                                    <c:set var="classSucess" value="info"/>
                                </c:if>
                                <tr class="${classSucess}">
                                    <%--<td><a href="edit?studentId=${student.studentId}">${student.studentId}</a></td>--%>
                                    <td>${student.studentId}</td>
                                    <td>${student.user.firstName}</td>
                                    <td>${student.user.lastName}</td>
                                    <td>${student.user.gender}</td> 
                                    <td>${student.user.dob}</td>
                                    <td>${student.citizenship}</td>
                                    <td>${student.nric}</td>

                                    <td><a href="student.del?studentId=${student.studentId}" id="remove" />
                                        <span class="glyphicon glyphicon-trash"/>
                                        </td>
                                    <td><a href="student.edit?studentId=${student.studentId}" id="edit"
                                           onclick="document.getElementById('action').value = 'edit';document.getElementById('studentId').value = '${student.studentId}';
                                                   document.getElementById('studentForm').submit();">
                                        <span class="glyphicon glyphicon-edit"/>
                                    </a>
                                    </td>


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
                                        <li class="active">  <a  href="${pageContext.request.contextPath}/admin/student.list?pageId=${i}">${i+1}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li>  <a class="" href="${pageContext.request.contextPath}/admin/student.list?pageId=${i}">${i+1}</a> </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <form action ="${pageContext.request.contextPath}/admin/student.list">
                        <br/>
                        <button type="submit" class="btn btn-primary  btn-md">Back</button> 
                    </form>
                </c:otherwise>
            </c:choose>


            <form action ="${pageContext.request.contextPath}/admin/student.new">
                <br/>
                <button type="submit" class="btn btn-primary  btn-md">New Student</button> 
            </form>
        </div>

    </body>
</html>
