<%-- 
    Document   : student-profile
    Created on : Dec 10, 2016, 1:02:45 PM
    Author     : Kaung
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Profile</title>
    </head>


    <body>
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="head-container">
                <div class= "panel-info">
                    <img alt="User Picture" src="../../../image/anonymous user.png" class="image-set img-responsive" width="150 px" height="150 px">
                </div>

                <div class="body-container">
                    <form class="panel-body"> 
                        <div id="body">
                            <table class="table table-user-information table-hover">
                                <tbody>
                                    <tr class="row-1">
                                        <td class="1"> <strong>Full Name: </strong> </p> </td>
                                        <td class="1"> ${user.firstName} ${user.lastName} </td>
                                    </tr>
                                    <tr class="row-2">
                                        <td class="2"> <strong> Account role: </strong> </td>
                                        <td class="2"> ${user.role} </td>
                                    </tr>
                                    <tr class="row-3">
                                        <td class="3"> <strong> Phone: </strong> </td>
                                        <td class="3"> ${user.phone} </td>
                                    </tr>
                                    <tr class="row-4">
                                        <td class="4"> <strong> Email: </strong> </td>
                                        <td class="4"> ${user.email} </td>
                                    </tr>
                                    <tr class="row-5">
                                        <td class="5"> <strong> Password: </strong> </td>
                                        <td class="5"> 
                                            <input type="password" value="${user.password}" disabled="true"> 
                                            <a href="#" class="button button-shadow"> Change Password </a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </form>

                    <form action="${pageContext.request.contextPath}/student/Mainpage">
                        <br/>
                        <button type="submit" class="btn btn-primary  btn-md"> Back to Main </button> 
                    </form>
                </div>

            </div>
        </div>
    </body>
</html>
