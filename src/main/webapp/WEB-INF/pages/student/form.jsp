<%-- 
    Document   : form
    Created on : 6 Dec, 2016, 10:02:00 PM
    Author     : ahmedraaj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../css/bootstrap.min.css">   		
        <script src="../js/bootstrap.min.js"></script>     
    </head>
    <body>
        <div class="container">
            <form action="/#" method="post" class="form-horizontal" role="form" data-toggle="validator" >
                <c:if test ="${empty action}">                        	
                    <c:set var="action" value="add"/>
                </c:if>
                <input type="hidden" id="action" name="action" value="${action}">
                <input type="hidden" id="idEmployee" name="idEmployee" value="${student.studentId}">
                <h2>Employee</h2>
                <div class="form-group col-xs-4">
                    <label class="control-label">First Name:</label>
                    <input type="text" name="firstName" id="firstName" class="form-control" value="${student.firstName}" required="true"/>                                   

                    <label for="lastName" class="control-label">Last name:</label>                   
                    <input type="text" name="lastName" id="lastName" class="form-control" value="${student.lastName}" required="true"/> 

                    <label for="dob" class="control-label">Birth date</label>                 
                    <input type="date"  name="dob" id="dob" class="form-control" value="${student.dob}" maxlength="10" placeholder="dd-MM-yyy" required="true"/>

                    <label for="nric" class="control-label">NRIC: </label>                    
                    <input type="text" name="nric" id="nric" class="form-control" value="${student.nric}" required="true"/> 

                    <label for="gender" class="control-label">Gender:</label>
                    <input type="text" name="gender" id="gender" class="form-control" value="${student.gender}" required="true"/>

                    <label for="citizenship" class="control-label ">Citizenship:</label>                   
                    <input type="text" name="citizenship" id="citizenship" class="form-control" value="${student.citizenship}"  required="true"/>
                    </div>
                    <div class="form-group col-xs-4">
                    <h1>User Login Information</h1>
                    
                    <br></br>
                    <label for="user.userName" class="control-label">User Name</label>                 
                    <input type="text"  name="user.userName" id="user.userName" class="form-control" value="${student.user.userName}" maxlength="15"  required="true"/>

                    <label for="user.password" class="control-label">Password</label>                 
                    <input type="text"  name="user.password" id="user.password" class="form-control" value="${student.user.password}" maxlength="15"  required="true"/>
                    <label for="user.email" class="control-label">Email</label>                 
                    <input type="email"  name="user.email" id="user.email" class="form-control" value="${student.user.email}" maxlength="15"  required="true"/>
                    <label for="user.phone" class="control-label">Phone</label>                 
                    <input type="text"  name="user.phone" id="user.phone" class="form-control" value="${student.user.phone}" maxlength="15"  required="true"/>
                    
                    <label for="user.address" class="control-label">address</label>                 
                    <input type="text"  name="user.address" id="user.address" class="form-control" value="${student.user.address}" maxlength="15"  required="true"/>
                    
                    <button type="submit" class="btn btn-primary  btn-md">Accept</button> 
                </div>                                                      
            </form>
        </div>
    </body>
</html>
