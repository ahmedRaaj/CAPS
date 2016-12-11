<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: LIU XURAN
  Date: 10/12/2016
  Time: 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>Entorllment Management</title>
</head>
<body>

<div class="container">
    <h2>Entorllment Management</h2>

    <table class="table table-responsive">
        <thead>
        <tr>
            <td>Student ID</td>
            <td>Student Name</td>
            <td>Course ID</td>
            <td>Course Name</td>
            <td>Status</td>
        </tr>
        <%--</thead>  show enrollment information--%>
        <c:forEach var = "enroledCourse" items="${enroledCourseList}">
            <form id="manageenrollmentForm" action="${pageContext.request.contextPath}/admin/enroll.manage" method="post" role="form">
            <tr>
                <td><c:out value="${enroledCourse.student.studentId}"/></td>
                <td><c:out value="${enroledCourse.student.user.firstName} ${enroledCourse.student.user.lastName}"/></td>
                <td><c:out value="${enroledCourse.course.courseId}"/></td>
                <td><c:out value="${enroledCourse.course.name}"/></td>
                <td><c:out value="${enroledCourse.status}"/></td>

                <td><a href="enroll.manage?courseId=${enroledCourse.course.courseId}&studentId=${enroledCourse.student.studentId}&action=APPROVED&status=${enroledCourse.status}"
                       id="accept" onclick="document.getElementById('manageenrollmentForm').submit();">
                    <span>accept</span>
                </a></td>
                <td><a href="enroll.manage?courseId=${enroledCourse.course.courseId}&studentId=${enroledCourse.student.studentId}&action=REJECTED&status=${enroledCourse.status}"
                       id="reject" onclick="document.getElementById('manageenrollmentForm').submit();">
                    <span>reject</span>
                </a></td>
            </tr>
            </form>
        </c:forEach>
    </table>
    <c:choose>
        <c:when test ="${not empty count}">
            <div>
                <ul class="pagination">
                    <c:forEach var="i" begin="0" end="${count-1}" >
                        <c:choose>
                            <c:when test="${pageId == i}">
                                <li class="active">  <a  href="${pageContext.request.contextPath}/admin/enroll.show?pageId=${i}">${i+1}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li>  <a class="" href="${pageContext.request.contextPath}/admin/enroll.show?pageId=${i}">${i+1}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </div>
        </c:when>
        <c:otherwise>
            <form action ="${pageContext.request.contextPath}/admin/student.list">
                <br/>
                <button type="submit" class="btn btn-primary  btn-md">Back</button>
            </form>
        </c:otherwise>
    </c:choose>



</div>
</body>
</html>
