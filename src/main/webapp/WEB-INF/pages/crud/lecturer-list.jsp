<%-- 
    Document   : lecturer-list
    Created on : 7 Dec, 2016, 4:46:09 PM
    Author     : Zeng
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lecturer-List</title>
    </head>
    <body>
        <div class="container">
            <h2>
                Lecturer
            </h2>

            <!-- Search Form -->
            <form action="#" method="get" id="searchLecturerForm" role="form">
                <div class="form-group col-xs-5">
                    <input type="text" name="lecturerName" id="lecturerName" class="form-control" required="true"
                           placeholder="Type the Name or Last Name of the Lecture"/>
                </div>

                <button type="submit" class="btn btn-info">
                    <span class="glyphicon glyphicon-search"></span> 
                    Search
                </button>
                <br></br>
                <br></br>
            </form>

            <form action="#" method="post" id="lecturerForm" role="form">
                <input type="hidden" id="lecturerId" name="lecturerId">
                <input type="hidden" id="action" name="action">

                <c:choose>
                    <c:when test="${not empty lecturerList}">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <td>#</td>
                                    <td>First Name</td>
                                    <td>Last Name</td>
                                    <td>Gender</td>
                                    <td>Birth Date</td>
                                    <td>Position</td>
                                    <td>Start Date</td>
                                    <td>End Date</td>
                                </tr>
                            </thead>
                            <c:forEach var="lecturer" items="${lecturerList}">
                                <c:set var="classSucess" value=""/>
                                <c:if test="${lecturerId==lecturer.lecturerId}">
                                    <c:set var="classSucess" value="info"/>
                                </c:if>
                                <tr class="${classSucess}">
                                    <td><a href="${pageContext.request.contextPath}/crud/lecturer-form?lecturerId=${lecturer.lecturerId}">
                                            ${lecturer.lecturerId}
                                        </a>
                                    </td>
                                    <td>${lecturer.user.firstName}</td>
                                    <td>${lecturer.user.lastName}</td>
                                    <td>${lecturer.user.gender}</td>
                                    <td>${lecturer.user.dob}</td>
                                    <td>${lecturer.position}</td>
                                    <td>${lecturer.startDate}</td>
                                    <td>${lecturer.endDate}</td>
                                    <td><a href="#" id="remove" 
                                           onclick="document.getElementById('action').value = 'remove';document.getElementById('lecturerId').value = '${lecturer.lecturerId}';

                                                   document.getElementById('lecturerForm').submit();"> 
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
                            No Lecturer found matching your search criteria
                        </div>
                    </c:otherwise>
                </c:choose>
            </form>

            <form action="#">
                <br></br>
                <button type="submit" class="btn btn-primary  btn-md">New Lecturer</button> 
            </form>
        </div>

    </body>
</html>
