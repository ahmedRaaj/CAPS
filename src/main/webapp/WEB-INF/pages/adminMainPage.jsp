<%--
    Document   : AdminMainPage
    Created on : 7 Dec, 2016, 4:31:27 PM
    Author     : ahmedraaj
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <title>ISS</title>
    <body>
    <%
        String name = request.getParameter("Name");
    %>
    <div class="tile-area fg-white tile-area-scheme-lightTeal " style="height: 100%; max-height: 100% !important;padding: 50px 0px 0px;">


        <h1 class="tile-area-title" style="padding-top: 13px;">Welcome Name </h1>

        <div style="margin-left: 82%; padding: 0px 0px 0px;">

            <button class="image-button icon-right bg-transparent fg-white bg-lightTeal bg-hover-dark no-border">
                <span class="sub-header no-margin text-light">name</span>
                <span class="icon mif-user mif-3x"></span>
            </button>
            <button class="image-button fg-white bg-lightBlue bg-hover-darkBrown no-border">
                <span class="icon mif-lock"></span>
            </button>

        </div>
        <div style="margin-left: 100px;padding-left: 30px;">



            <div class="tile-group double" style="margin-top: 40px;">
                <span class="tile-group-title">Student Management</span>
                <div class="tile-container">
                    <a href="/student/add" class="tile bg-indigo fg-white" data-role="tile">
                        <div class="tile-content iconic">
                            <span class="icon mif-books"></span>
                        </div>
                        <span class="tile-label">Add Student</span>
                    </a>

                    <div class="tile bg-darkBlue fg-white" data-role="tile" onclick="document.location.href='/student/list'">
                        <div class="tile-content iconic">
                            <span class="icon mif-list2"></span>
                        </div>
                        <span class="tile-label">Manage the Students</span>
                    </div>
                </div>

            </div>
            <div class="tile-group double" style="margin-top: 40px;">
                <span class="tile-group-title">Lecturer Management</span>
                <div class="tile-container">
                    <a href="/lecturer/add" class="tile bg-darkOrange fg-white" data-role="tile">
                        <div class="tile-content iconic">
                            <span class="icon mif-books"></span>
                        </div>
                        <span class="tile-label">Add Lecturer</span>
                    </a>
                    <div class="tile bg-darkBlue fg-white" data-role="tile" onclick="document.location.href='/lecturer/list'">
                        <div class="tile-content iconic">
                            <span class="icon mif-list2"></span>
                        </div>
                        <span class="tile-label">Manage the Lecturer</span>
                    </div>

                </div>


            </div>
            <div class="tile-group double" style="margin-top: 40px;">
                <span class="tile-group-title">Courses Management</span>
                <div class="tile-container">
                    <a href="/courses/add" class="tile bg-darkCyan fg-white" data-role="tile">
                        <div class="tile-content iconic">
                            <span class="icon mif-books"></span>
                        </div>
                        <span class="tile-label">Add Courses</span>
                    </a>
                    <div class="tile bg-darkBlue fg-white" data-role="tile" onclick="document.location.href='/course/list'">
                        <div class="tile-content iconic">
                            <span class="icon mif-list2"></span>
                        </div>
                        <span class="tile-label">Manage the Courses</span>
                    </div>

                </div>


            </div>
            <div class="tile-group" style="margin-top: 40px;">
                <span class="tile-group-title">Enrolment</span>
                <div class="tile-container">
                    <a href="/enrollment/list" class="tile bg-darkOrange fg-white" data-role="tile">
                        <div class="tile-content iconic">
                            <span class="icon mif-books"></span>
                        </div>
                        <span class="tile-label">Manage Enrolment</span>
                    </a>

                </div>


            </div>
        </div>


    </div>
    </body>
</html>
