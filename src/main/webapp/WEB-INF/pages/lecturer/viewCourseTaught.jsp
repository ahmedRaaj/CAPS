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
                                  <c:choose>
                                    <c:when test ="${not empty count}">
                                        <div>
                                            <ul class="pagination">
                                                <c:forEach var="i" begin="0" end="${count-1}" >
                                                    <c:choose>
                                                        <c:when test="${pageId == i}">
                                                            <li class="active">  <a  href="${pageContext.request.contextPath}/lecturer/viewcourses?pageId=${i}">${i+1}</a></li>
                                                            </c:when>
                                                            <c:otherwise>
                                                            <li>  <a class="" href="${pageContext.request.contextPath}/lecturer/viewcourses?pageId=${i}">${i+1}</a> </li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                            </ul>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <form action ="${pageContext.request.contextPath}/lecturer/viewcourses?pageId=0">            
                                            <br/>
                                            <button type="submit" class="btn btn-primary">Back</button> 
                                        </form>
                                        
                                    </c:otherwise>
                                </c:choose>  
  </div>
 </body>

  
</html>
