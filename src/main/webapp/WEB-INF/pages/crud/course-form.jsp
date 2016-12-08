<%@ page import="org.teameleven.caps.model.Course" %><%--
  Created by IntelliJ IDEA.
  User: LIU XURAN
  Date: 07/12/2016
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Course Form</title>
</head>
<body>
<div class="container">
    <form action="/admin/cupdate" method="post"  role="form" data-toggle="validator" >
        <div class="form-group col-xs-8">
            <br/>
            <label  class="control-label col-xs-8">Course Id:</label>
            <input type="text" name="courseId" id="courseId" class="form-control" value="${courseDetail.courseId}" disabled/>

            <label  class="control-label col-xs-8">Course Name:</label>
            <input type="text" name="courseName" id="courseName" class="form-control" value="${courseDetail.name}"/>

            <label  class="control-label col-xs-8">Duration:</label>
            <input type="text"  name="courseDuration" id="courseDuration" class="form-control" value="${courseDetail.duration}" />

            <label class="control-label col-xs-8">Credits:</label>
            <input type="text" name="credits" id="credits" class="form-control" value="${courseDetail.credits}"/>

            <label  class="control-label col-xs-8">Course Size:</label>
            <input type="text" name="courseSize" id="courseSize" class="form-control" value="${courseDetail.courseSize}" />

            <label  class="control-label col-xs-8">Course Lecture:</label>
            <input type="text" name="lecturer" id="lecturerFirstName" class="form-control"
                   value="${courseDetail.lecturer.user.firstName}"/>
            <input type="text" name="lecturer" id="lecturerLastName" class="form-control"
                   value="${courseDetail.lecturer.user.lastName}"/>
            <br/>
            <button type="reset" class="btn btn-primary  btn-md">Cancel</button>
            <button type="submit" class="btn btn-primary  btn-md">Save</button>
        </div>
        </form>
    </div>


</body>
</html>
