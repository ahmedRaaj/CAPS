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
        <title>Lecturer List</title>
    </head>
    <body>
        <div class="container">
            <h2>
                Lecturers
            </h2>

            <!-- Search Form -->
            <form action="${pageContext.request.contextPath}/admin/lecturer.search" method="post" id="searchLecturerForm" role="form">
                <div class="form-group col-xs-5">
                    <input type="text" name="search" id="search" class="form-control" required="true"
                           placeholder="Search by anything of the Lecture"/>
                </div>

                <button type="submit" class="btn btn-info">
                    <span class="glyphicon glyphicon-search"></span> 
                    Search
                </button>
                <br/>
                <br/>
            </form>

            <form action="${pageContext.request.contextPath}/admin/lecturer.list" method="post" id="lecturerForm" role="form">
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
                                    <%--<td><a href="${pageContext.request.contextPath}/admin/lecturer/edit?lecturerId=${lecturer.lecturerId}">--%>
                                            <%--${lecturer.lecturerId}--%>
                                        <%--</a>--%>
                                    <%--</td>--%>
                                    <td> ${lecturer.lecturerId}</td>
                                    <td>${lecturer.user.firstName}</td>
                                    <td>${lecturer.user.lastName}</td>
                                    <td>${lecturer.user.gender}</td>
                                    <td>${lecturer.user.dob}</td>
                                    <td>${lecturer.position}</td>
                                    <td>${lecturer.startDate}</td>
                                    <td>${lecturer.endDate}</td>
                                    <td><a href="del?lecturerId=${lecturer.lecturerId}" id="remove">
                                <span class="glyphicon glyphicon-trash"/>
                            </a></td>
                                    <td><a href="edit?lecturerId=${lecturer.lecturerId}" id="edit"
                                           onclick="document.getElementById('action').value = 'edit';document.getElementById('lecturerId').value = '${lecturer.lecturerId}';
                                                   document.getElementById('lecturerForm').submit();">
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
                            No Lecturer found matching your search criteria
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
                                        <li class="active">  <a  href="${pageContext.request.contextPath}/admin/lecturer/list?pageId=${i}">${i+1}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li>  <a class="" href="${pageContext.request.contextPath}/admin/lecturer/list?pageId=${i}">${i+1}</a> </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <form action ="${pageContext.request.contextPath}/admin/lecturer/list">            
                        <br/>
                        <button type="submit" class="btn btn-primary  btn-md">Back</button> 
                    </form>
                </c:otherwise>
            </c:choose>
                
        </div>
 <button type="submit" class="btn btn-primary btn-md" onclick="document.location.href='${pageContext.request.contextPath}/admin/lecturer/new'">New Lecturer</button>
    </body>
</html>
