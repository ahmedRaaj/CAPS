<%@page import="org.teameleven.caps.model.User"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<<<<<<< HEAD
<nav class="navbar navbar-inverse sidebar" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle"     data-toggle="collapse"data-target="#bs-sidebar-navbar-collapse-1">
=======
<nav class="navbar navbar-inverse bg-black sidebar" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle"     data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
>>>>>>> backup
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Team Eleven CAPS</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
            <ul class="nav navbar-nav">
<<<<<<< HEAD
                <li class="active"><a href="#">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
                <li ><a href="#">Profile<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
                <%
                    String type= request.getParameter("role");
=======
               
                <%
                    User u = ((User)request.getSession().getAttribute("user"));
                    String type = u != null ? u.getRole() : null;

>>>>>>> backup
//                    session.getAttribute(role);
                    if(type != null && type.equals("student"))
                    {
                %>
<<<<<<< HEAD
                <li ><a href="#">Grades and GPA<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list-alt"></span></a></li>
                <li ><a href="#">Courses<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-book"></span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Enrollment Details <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-tasks"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href="#">Enrolled Courses</a></li>
                        <li><a href="#">Active Courses</a></li>
=======
                 <li class="active"><a href="${pageContext.request.contextPath}/student/Mainpage">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
                <li ><a href="${pageContext.request.contextPath}/student/profile">Profile<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
                <li ><a href="${pageContext.request.contextPath}/student/grade">Grades and GPA<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list-alt"></span></a></li>
                <li ><a href="${pageContext.request.contextPath}/student/view">Courses<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-book"></span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Enrollment Details <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-tasks"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href="${pageContext.request.contextPath}/student/enroll">Enrolled Courses</a></li>
                        <li><a href="${pageContext.request.contextPath}/student/view">Active Courses</a></li>
>>>>>>> backup
                    </ul>
                </li>
                <%}
                %>
                <%
<<<<<<< HEAD
                    if(type != null && type.equals("lacturer"))
                    {
                %>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Courses Details <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-folder-open"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href="#">Courses Taught</a></li>
                        <li><a href="#">Grade Course</a></li>
                    </ul>
                </li>
                <li ><a href="#">Course Enrolment<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list-alt"></span></a></li>
                <li ><a href="#">Student Performance<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-book"></span></a></li>
=======
                    if(type != null && type.equals("lecturer"))
                    {
                %>
                 <li class="active"><a href="${pageContext.request.contextPath}/lecturer/Mainpage">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
                <li ><a href="${pageContext.request.contextPath}/lecturer/profile">Profile<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Courses Details <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-folder-open"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href="${pageContext.request.contextPath}/lecturer/viewcourses">Courses Taught</a></li>
                        <li><a href="${pageContext.request.contextPath}/lecturer/gradecourse">Grade Course</a></li>
                    </ul>
                </li>
                <li ><a href="${pageContext.request.contextPath}/lecturer/viewenrolment">Course Enrollment<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list-alt"></span></a></li>
                <li ><a href="${pageContext.request.contextPath}/lecturer/viewperformance">Student Performance<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-book"></span></a></li>
>>>>>>> backup

                <%}
                %>
                <%
                    if(type != null && type.equals("admin"))
                    {
                %>
<<<<<<< HEAD
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Student Management <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href="#">Add Student</a></li>
                        <li><a href="#">Manage the Students</a></li>
=======
                 <li class="active"><a href="${pageContext.request.contextPath}/admin/Mainpage">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
             <!--  <li ><a href="#">Profile<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>-->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Student Management <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href="${pageContext.request.contextPath}/admin/student.new">Add Student</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/student.list">Manage the Students</a></li>
>>>>>>> backup
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Lecturer Management <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-leaf"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
<<<<<<< HEAD
                        <li><a href="#">Add Lecturer</a></li>
                        <li><a href="#">Manage the Lecturer</a></li>
=======
                        <li><a href="${pageContext.request.contextPath}/admin/lecturer.new">Add Lecturer</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin/lecturer.list">Manage the Lecturer</a></li>
>>>>>>> backup
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Courses Management <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-tasks"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
<<<<<<< HEAD
                        <li><a href="#">Add Courses</a></li>
                        <li><a href="#">Manage the Courses</a></li>
                    </ul>
                </li>
                <li ><a href="#">Manage Enrolment<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a></li>
                <%}
                %>
                <li ><a href="#">Logout<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-minus-sign"></span></a></li>
=======
                        <li><a href="../admin/course.add">Add Courses</a></li>
                        <li><a href="../admin/course.list">Manage the Courses</a></li>
                    </ul>
                </li>
                <li ><a href="${pageContext.request.contextPath}/admin/enroll.show">Manage Enrollment<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a></li>
                <%}
                %>
                <li ><a href="${pageContext.request.contextPath}/login/logout">Logout<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-minus-sign"></span></a></li>
>>>>>>> backup

            </ul>
        </div>
    </div>
</nav>


