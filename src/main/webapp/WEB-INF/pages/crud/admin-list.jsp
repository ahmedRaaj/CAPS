<%-- 
    Document   : admin-list
    Created on : 7 Dec, 2016, 4:46:57 PM
    Author     : Kaung
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <div class="container">
            <h2>
                Admins
            </h2>
            
            <!--Search Form -->
            <form action ="${pageContext.request.contextPath}/admin/admin/search" method="post" id="searchAdminForm" role="form">
                <div class="form-group col-xs-5">
                    <input type="text" name="search" id="search" class="form-control" required="true"
                           placeholder="Search by anything of the Admin"/>
                </div>    
                
                <button type="submit" class="btn btn-info">
                    <span class="glyphicon glyphicon-search"></span> 
                    Search
                </button>
                <br/>
                <br/>
            </form>
            
            <form action="${pageContext.request.contextPath}/admin/admin/list" method="post" id="adminForm" role="form">
                <input type="hidden" id="adminId" name="adminId">
                <input type="hidden" id="action" name="action">
            
                <c:choose>
                    <c:when test="${not empty adminList}">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <td>#</td>
                                    <td>First Name</td>
                                    <td>Last Name</td>
                                    <td>Gender</td>
                                    <td>Birth Date</td>
                                    <td>Position</td>
                                </tr>
                            </thead>
                            
                            <c:forEach var="admin" items="${adminList}">
                                <%--<c:set var="classSucess" value=""/>--%>
                                <%--<c:if test="${adminId==admin.adminId}">--%>
                                    <%--<c:set var="classSucess" value="info"/>--%>
                                <%--</c:if>--%>
                                <%--<tr class="${classSucess}">--%>
                                <tr>
                                    <%--<td><a href="${pageContext.request.contextPath}/admin/admin/edit?adminId=${admin.adminId}">--%>
                                            <%--${admin.adminId}</a> </td>--%>

                                    <td>${admin.adminId}</td>
                                    <td>${admin.user.firstName}</td>
                                    <td>${admin.user.lastName}</td>
                                    <td>${admin.user.gender}</td>
                                    <td>${admin.user.dob}</td>
                                    <td>${admin.position}</td>
                                    
                                    <td><a href="del?adminId=${admin.adminId}" id="remove" 
                                           onclick="document.getElementById('action').value = 'remove';document.getElementById('adminId').value = '${admin.adminId}';
                                                   document.getElementById('adminForm').submit();">
                                    <span class="glyphicon glyphicon-trash"/>
                                        </a></td>

                                    <td><a href="edit?adminId=${admin.adminId}" id="edit"
                                           onclick="document.getElementById('action').value = 'edit';document.getElementById('adminId').value = '${admin.adminId}';
                                                   document.getElementById('adminForm').submit();">
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
                        No Admin found matching your search criteria
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
                                        <li class="active">  <a  href="${pageContext.request.contextPath}/admin/admin/list?pageId=${i}">${i+1}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                        <li>  <a class="" href="${pageContext.request.contextPath}/admin/admin/list?pageId=${i}">${i+1}</a> </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <form action ="${pageContext.request.contextPath}/admin/admin/list">            
                        <br/>
                        <button type="submit" class="btn btn-primary  btn-md">Back</button> 
                    </form>
                </c:otherwise>
            </c:choose>
                
            <form action="${pageContext.request.contextPath}/admin/admin/new">
                <br/>
                <button type="submit" class="btn btn-primary  btn-md">New Admin</button> 
            </form>
        </div>
    </body>
</html>
