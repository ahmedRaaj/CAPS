<%@ page import="org.teameleven.caps.model.Course" %><%--
  Created by IntelliJ IDEA.
  User: LIU XURAN
  Date: 07/12/2016
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Course Form</title>
</head>
<body>
<h2>Course</h2>

<div class="container">
    <form  name="Course" action="${pageContext.request.contextPath}/admin/course/update" role="form" method="post" data-toggle="validator"   >
        <div class="form-group col-xs-8">
            <br/>
            <input  type="hidden" name="Course.courseId" id="Course.courseId" class="form-control" value="${Course.courseId}" />

            <label  class="control-label col-xs-8">Course Name:</label>
            <input  type="text" name="Course.name" id="Course.name" class="form-control" value="${Course.name}"/>

            <label  class="control-label col-xs-8">Duration:</label>
            <input type="text"  name="Course.duration" id="Course.duration" class="form-control" value="${Course.duration}" />

            <label class="control-label col-xs-8">Credits:</label>
            <input type="number" name="Course.credits" id="Course.credits" class="form-control" value="${Course.credits}"/>

            <label  class="control-label col-xs-8">Course Size:</label>
            <input type="number" name="Course.courseSize" id="Course.courseSize" class="form-control" value="${Course.courseSize}" />

            <label  class="control-label col-xs-8">Course Lecturer:</label>
            <input type="number" name="Course.lecturerId" id="Course.lecturerId" class="form-control"
                   value="${Course.lecturer.lecturerId}"/>
            <%--<input type="text" name="Course.lecturer.lecturerFirstName" id="Course.lecturer.lecturerFirstName" class="form-control"--%>
                   <%--value="${Course.lecturer.user.firstName}"/>--%>
            <%--<input type="text" name="Course.lecturer.ecturerLastName" id="Course.lecturer.lecturerLastName" class="form-control"--%>
                   <%--value="${Course.lecturer.user.lastName}"/>--%>
            <br/>
            <button type="reset" class="btn btn-primary  btn-md" >Cancel</button>
            <button type="submit" class="btn btn-primary  btn-md">Save</button>
        </div>

</form>
    </div>


</body>
</html>
