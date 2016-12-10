<%-- 
    Document   : viewCourseTaught
    Created on : Dec 8, 2016, 10:29:38 AM
    Author     : Janaki
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>View Courses Taught Page</title>
    </head>
    <body>
        <div style="padding-top: 50px;">
   <%--<jsp:include page="../menu.jspx"/>--%>
   <h3><center>LIST OF  COURSES</center></h3>
   <br/>
   
   <c:choose>
     <c:when test="${empty courses }">
       Table is empty.
     </c:when>
     <c:otherwise>
      <table class="table">
       <thead>
         <tr>
          
          <th> COURSE NAME </th>
          <th> COURSE SIZE </th>
          <th> CREDITS </th>
          <th> DURATION </th>
         </tr>
        </thead>
        <tbody>
        <c:forEach var="course" items="${courses}"><%--need to get arraylist from controller for items--%>
        <tr>
          
          <td> <c:out value="${course.name}"/> </td>
          <td> <c:out value="${course.courseSize}"/> </td>
          <td> <c:out value="${course.credits}"/> </td>
          <td> <c:out value="${course.duration}"/> </td>
        </tr>
        </c:forEach>
       </tbody>
     </table>
    </c:otherwise>
   </c:choose>
   <%--<jsp:include page="../footer.jspx"/>--%>
  </div>
 </body>

    </body>
</html>
