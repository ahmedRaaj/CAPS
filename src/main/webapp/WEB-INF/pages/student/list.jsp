<%--
    Document   : list
    Created on : 6 Dec, 2016, 9:58:48 PM
    Author     : ahmedraaj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">

            <h2>Students</h2>
            <!--Search Form -->
            <form action="${pageContext.request.contextPath}/student/search" method="get" id="seachStudentForm" role="form" >
                <div class="form-group col-xs-5">
                    <input type="text" name="studentName" id="studentName" class="form-control" required="true"
                           placeholder="Type the Name or Last Name of the Student"/>
                </div>
                <button type="submit" class="btn btn-info">
                    <span class="glyphicon glyphicon-search"></span> Search
                </button>
                <br></br>
                <br></br>
            </form>


            <form action="${pageContext.request.contextPath}/student/list" method="post" id="studentForm" role="form" >
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
                                    <td>Birth date</td>
                                    <td>Citizenship</td>
                                    <td>NRIC</td>
                                    <td>Gender</td>
                                </tr>
                            </thead>
                            <c:forEach var="student" items="${studentList}">
                                <c:set var="classSucess" value=""/>
                                <c:if test ="${studentId == student.studentId}">
                                    <c:set var="classSucess" value="info"/>
                                </c:if>
                                <tr class="${classSucess}">
                                    <td><a href="${pageContext.request.contextPath}/student/form?studentId=${student.studentId}">${student.studentId}</a></td>

                                    <td>${student.firstName}</td>
                                    <td>${student.lastName}</td>
                                    <td>${student.dob}</td>
                                    <td>${student.citizenship}</td>
                                    <td>${student.nric}</td>
                                    <td>${student.gender}</td>
                                    <td><a href="#" id="remove"
                                           onclick="document.getElementById('action').value = 'remove';document.getElementById('studentId').value = '${student.studentId}';

                                                   document.getElementById('studentForm').submit();">
                                            <span class="glyphicon glyphicon-trash"/>
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


            <form action ="${pageContext.request.contextPath}/student/form">
                <br></br>
                <button type="submit" class="btn btn-primary  btn-md">New Student</button>
            </form>
        </div>

    </body>

</html>
