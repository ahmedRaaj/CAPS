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
<div class="tile-area fg-white tile-area-scheme-lightBlue " style="height: 100%; max-height: 100% !important;padding: 50px 0px 0px;">


    <h1 class="tile-area-title" style="padding-top: 13px;">Welcome Name </h1>

    <div style="margin-left: 82%; padding: 0px 0px 0px;">

        <button class="image-button icon-right bg-transparent fg-white bg-lightBlue bg-hover-dark no-border">
            <span class="sub-header no-margin text-light">name</span>
            <span class="icon mif-user mif-3x"></span>
        </button>
        <button class="image-button fg-white bg-lightBlue bg-hover-darkBrown no-border">
            <span class="icon mif-lock"></span>
        </button>

    </div>
    <div style="margin-left: 160px;padding-left: 30px;">



        <div class="tile-group double" style="margin-top: 40px;">
            <span class="tile-group-title">Courses Details</span>
            <div class="tile-container">
                <a href="/lecturer/coutaught" class="tile bg-indigo fg-white" data-role="tile">
                    <div class="tile-content iconic">
                        <span class="icon mif-books"></span>
                    </div>
                    <span class="tile-label">Courses Taught</span>
                </a>

                <div class="tile bg-darkBlue fg-white" data-role="tile" onclick="document.location.href='/lecturer/grade'">
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
                <a href="/lecturer/csenrollment" class="tile bg-darkOrange fg-white" data-role="tile">
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
                <a href="/lecturer/stdperformance" class="tile bg-darkCyan fg-white" data-role="tile">
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
