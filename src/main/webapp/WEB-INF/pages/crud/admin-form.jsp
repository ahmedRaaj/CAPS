<%-- 
    Document   : admin-form
    Created on : 7 Dec, 2016, 4:47:08 PM
    Author     : ahmedraaj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Form</title>
    </head>
    <body>
        <div class="container">
            <form action="#" method="post"  role="form" data-toggle="validator" >
                <c:if test ="${empty action}">                        	
                    <c:set var="action" value="add"/>
                </c:if>
                <input type="hidden" id="action" name="action" value="${action}">
                <input type="hidden" id="adminId" name="adminId" value="${admin.adminId}">
                <h2>Admin</h2>
               
                <div class="form-group col-xs-4">
                     <br></br>
                    <label for="admin.user.firstName" class="control-label col-xs-4">First Name:</label>
                    <input type="text" name="admin.user.firstName" id="admin.user.firstName" class="form-control" value="${admin.user.firstName}" required="true"/>                                   

                    <label for="admin.user.lastName" class="control-label col-xs-4">Last Name:</label>                   
                    <input type="text" name="admin.user.lastName" id="admin.user.lastName" class="form-control" value="${admin.user.lastName}" required="true"/> 

                    <label for="admin.user.dob" class="control-label col-xs-4">Birth Date</label>                 
                    <input type="date"  name="admin.user.dob" id="admin.user.dob" class="form-control" value="${admin.user.dob}" placeholder="dd-MM-yyy" required="true"/>

                    <label for="admin.user.gender" class="control-label col-xs-4">Gender:</label>
                    <input type="text" name="admin.user.gender" id="admin.user.gender" class="form-control" value="${admin.user.gender}" placeholder="male&female" required="true"/>

                    <label for="admin.position" class="control-label col-xs-4">Position:</label>
                    <input type="text" name="admin.user.position" id="admin.user.position" class="form-control" value="${admin.position}" required="true"/>

                    <br></br>
                    <br></br>
                    <h2>Login Information</h2>
                                        <br></br>
                    <input type="hidden" id="admin.user.userId" name="admin.user.userId" value="${admin.user.userId}">

                    <label for="admin.user.userName" class="control-label col-xs-4">User Name:</label>
                    <input type="text" name="admin.user.userName" id="admin.user.userName" class="form-control" value="${admin.user.userName}" required="true"/>

                    <label for="admin.user.password"  class="control-label col-xs-4">Password:</label>
                    <input type="text" name="admin.user.password" id="admin.user.password" class="form-control" value="${admin.user.password}" required="true"/>

                    <label for="admin.user.phone"  class="control-label col-xs-4">Phone:</label>
                    <input type="text" name="admin.user.phone" id="admin.user.phone" class="form-control" value="${admin.user.phone}" required="true"/>

                    <label for="admin.user.address"  class="control-label col-xs-4">Address:</label>
                    <input type="text" name="admin.user.address" id="admin.user.address" class="form-control" value="${admin.user.address}" required="true"/>

                    <label for="admin.user.email"  class="control-label col-xs-4">Email:</label>
                    <input type="text" name="admin.user.email" id="admin.user.email" class="form-control" value="${admin.user.email}" placeholder="123@gmail.com" required="true"/>

                    <input type="hidden" name="admin.user.role" id="admin.user.role" class="form-control" value="admin" required="true"/>

                    <label for="admin.user.status"  class="control-label col-xs-4">Status:</label>
                    <input type="text" name="admin.user.status" id="admin.user.status" class="form-control" value="${admin.user.status}" required="true"/>

                    <br></br>
                    <button type="submit" class="btn btn-primary  btn-md">Accept</button> 
                </div>

        </div> 
    </body>
</html>
