<%-- 
    Document   : form
    Created on : 8 Dec, 2016, 10:41:00 PM
    Author     : Zeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Form</title>
    </head>
    <body>
              <div class="container">
            <form action="${pageContext.request.contextPath}/admin/student/add" method="post"  role="form" data-toggle="validator" >

                <div class="form-group col-xs-6">
                    <h2>Student Information</h2>
                     <br/>
                     <input type="hidden" name="student.studentId" id="student.studentId" class="form-control" value="${student.studentId}" required="true"/>                                   

                    <label for="student.user.firstName" class="control-label col-xs-6">First Name:</label>
                    <input type="text" name="student.user.firstName" id="student.user.firstName" class="form-control" value="${student.user.firstName}" required="true"/>                                   

                    <label for="student.user.lastName" class="control-label col-xs-6">Last Name:</label>
                    <input type="text" name="student.user.lastName" id="student.user.lastName" class="form-control" value="${student.user.lastName}" required="true"/> 

                    <label for="student.user.dob" class="control-label col-xs-6">Birth Date:</label>
                    <input type="date"  name="student.user.dob" id="student.user.dob" class="form-control" value="${student.user.dob}" placeholder="yyyy-mm-dd" />

                                       <label for="student.user.gender" class="control-label col-xs-4">Gender:</label>
                    <input type="text" name="student.user.gender" id="student.user.gender" class="form-control" value="${student.user.gender}" placeholder="male" required="true"/>
                    
                    <label for="student.citizenship" class="control-label col-xs-6">Citizenship:</label>
                    <input type="text" name="student.citizenship" id="student.citizenship" class="form-control" value="${student.citizenship}" required="true"/> 

                    <label for="student.nric" class="control-label col-xs-6">NRIC:</label>
                    <input type="text" name="student.nric" id="student.nric" class="form-control" value="${student.nric}"  required="true"/>

                    <br/>
                    </div>

                <div class="form-group col-xs-6">
                    <h2>Login Information</h2>
                    <br/>
                    <input type="hidden" id="student.user.userId" name="student.user.userId" value="${student.user.userId}"/>

                    <label for="student.user.userName" class="control-label col-xs-6">User Name:</label>
                    <input type="text" name="student.user.userName" id="student.user.userName" class="form-control" value="${student.user.userName}" required="true"/>

                    <label for="student.user.password"  class="control-label col-xs-6">Password:</label>
                    <input type="text" name="student.user.password" id="student.user.password" class="form-control" value="${student.user.password}" required="true"/>

                    <label for="student.user.phone"  class="control-label col-xs-6">Phone:</label>
                    <input type="text" name="student.user.phone" id="student.user.phone" class="form-control" value="${student.user.phone}" required="true"/>

                    <label for="student.user.address"  class="control-label col-xs-6">Address:</label>
                    <input type="text" name="student.user.address" id="student.user.address" class="form-control" value="${student.user.address}" required="true"/>

                    <label for="student.user.email"  class="control-label col-xs-6">Email:</label>
                    <input type="text" name="student.user.email" id="student.user.email" class="form-control" value="${student.user.email}" placeholder="student@gmail.com" required="true"/>

                    
                    <input type="hidden" name="student.user.role" id="student.user.role" class="form-control" value="student" required="true"/>

                    <label for="student.user.status"  class="control-label col-xs-6">Status:</label>
                    <input type="text" name="student.user.status" id="student.user.status" class="form-control" value="${student.user.status}" required="true"/>
                </div>
                <div>
                    <br/>
                    <button type="submit" class="btn btn-primary  btn-md">Accept</button> 
                </div>

            </form>
              </div>
    </body>
</html>
