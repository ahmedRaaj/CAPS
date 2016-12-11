<%--
    Document   : LecturerMainpage
    Created on : 7 Dec, 2016, 4:31:41 PM
    Author     : ahmedraaj
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>ISS</title>
    </head>
    <body>
        <%
            String name = request.getParameter("Name");
        %>
        <div class="tile-area fg-white tile-area-scheme-lightTeal " style="height: 100%; max-height: 100% !important;padding: 50px 0px 0px;">
            <h1 class="tile-area-title" style="padding-top: 13px;">Welcome ${user.firstName} </h1>

            <div style="margin-left: 75%; padding: 0px 0px 0px;">

                <button class="image-button icon-right bg-transparent fg-white bg-lightTeal bg-hover-dark no-border">
                    <a href="../lecturer/profile">
                    <span class="sub-header no-margin text-light">${user.firstName} ${user.lastName}</span>                  
                    <span class="icon mif-user mif-3x"></span></a>
                </button>
                <button class="image-button fg-white bg-lightTeal bg-hover-darkBrown no-border">
                    <a href="../login/logout">
                        <span class="icon mif-lock"></span>
                         <span class="sub-header no-margin text-light">Log out</span>
                    </a>
                </button>

            </div>
            <div style="margin-left: 160px;padding-left: 30px;">



                <div class="tile-group double" style="margin-top: 40px;">
                    <span class="tile-group-title">Courses Details</span>
                    <div class="tile-container">
                        <a href="../lecturer/viewcourses" class="tile bg-indigo fg-white" data-role="tile">
                            <div class="tile-content iconic">
                                <span class="icon mif-books"></span>
                            </div>
                            <span class="tile-label">Courses Taught</span>
                        </a>

                        <div class="tile bg-darkBlue fg-white" data-role="tile" onclick="document.location.href = '../lecturer/gradecourse'">
                            <div class="tile-content iconic">
                                <span class="icon mif-list2"></span>
                            </div>
                            <span class="tile-label">Grade Course</span>
                        </div>
                    </div>

                </div>
                <div class="tile-group" style="margin-top: 40px;">
                    <span class="tile-group-title">Courses Details</span>
                    <div class="tile-container">
                        <a href="../lecturer/viewenrolment" class="tile bg-darkOrange fg-white" data-role="tile">
                            <div class="tile-content iconic">
                                <span class="icon mif-books"></span>
                            </div>
                            <span class="tile-label">Course Enrolment</span>
                        </a>

                    </div>


                </div>
                <div class="tile-group" style="margin-top: 40px;">
                    <span class="tile-group-title">Student Details</span>
                    <div class="tile-container">
                        <a href="../lecturer/viewperformance" class="tile bg-darkCyan fg-white" data-role="tile">
                            <div class="tile-content iconic">
                                <span class="icon mif-books"></span>
                            </div>
                            <span class="tile-label">Student Performance</span>
                        </a>

                    </div>


                </div>
            </div>
        </div>




    </body>
</html>
