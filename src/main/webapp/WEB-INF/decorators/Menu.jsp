<%@page import="org.teameleven.caps.model.User"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav class="navbar navbar-inverse bg-black sidebar" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle"     data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Team Eleven CAPS</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">Home<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home"></span></a></li>
                <li ><a href="#">Profile<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
                <%
                    User u = ((User)request.getSession().getAttribute("user"));
                    String type = u != null ? u.getRole() : null;

//                    session.getAttribute(role);
                    if(type != null && type.equals("student"))
                    {
                %>
                <li ><a href="../student/grade">Grades and GPA<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list-alt"></span></a></li>
                <li ><a href="../student/view">Courses<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-book"></span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Enrollment Details <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-tasks"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href="../student/enroll">Enrolled Courses</a></li>
                        <li><a href="#">Active Courses</a></li>
                    </ul>
                </li>
                <%}
                %>
                <%
                    if(type != null && type.equals("lecturer"))
                    {
                %>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Courses Details <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-folder-open"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href="#">Courses Taught</a></li>
                        <li><a href="#">Grade Course</a></li>
                    </ul>
                </li>
                <li ><a href="#">Course Enrollment<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-list-alt"></span></a></li>
                <li ><a href="#">Student Performance<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-book"></span></a></li>

                <%}
                %>
                <%
                    if(type != null && type.equals("admin"))
                    {
                %>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Student Management <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href="#">Add Student</a></li>
                        <li><a href="#">Manage the Students</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Lecturer Management <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-leaf"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href="#">Add Lecturer</a></li>
                        <li><a href="#">Manage the Lecturer</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Courses Management <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-tasks"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                        <li><a href="#">Add Courses</a></li>
                        <li><a href="#">Manage the Courses</a></li>
                    </ul>
                </li>
                <li ><a href="#">Manage Enrollment<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></a></li>
                <%}
                %>
                <li ><a href="#">Logout<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-minus-sign"></span></a></li>

            </ul>
        </div>
    </div>
</nav>


