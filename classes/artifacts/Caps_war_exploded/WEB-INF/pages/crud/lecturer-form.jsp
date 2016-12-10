<%-- 
    Document   : lecturer-form
    Created on : 7 Dec, 2016, 4:46:22 PM
    Author     : Zeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lecturer Form</title>
    </head>
    <body>
        <div class="container">
            <form action="${pageContext.request.contextPath}/admin/lecturer/add" method="post" role="form" data-toggle="validator" >

                <div class="form-group col-xs-6">
                    <h2>Lecturer Information</h2>
                    <br>
                    <input type="hidden" id="lecturer.lecturerId" name="lecturer.lecturerId" class="form-control" value="${lecturer.lecturerId}" required="true"/>

                    <label for="lecturer.user.firstName" class="control-label col-xs-6">First Name:</label>
                    <input type="text" name="lecturer.user.firstName" id="lecturer.user.firstName" class="form-control" value="${lecturer.user.firstName}" required="true"/>                                   

                    <label for="lecturer.user.lastName" class="control-label col-xs-6">Last Name:</label>
                    <input type="text" name="lecturer.user.lastName" id="lecturer.user.lastName" class="form-control" value="${lecturer.user.lastName}" required="true"/> 

                    <label for="lecturer.user.dob" class="control-label col-xs-6">Birth Date:</label>
                    <input type="date"  name="lecturer.user.dob" id="lecturer.user.dob" class="form-control" value="${lecturer.user.dob}" placeholder="yyyy-mm-dd" required="true"/>

                    <label for="lecturer.user.gender" class="control-label col-xs-6">Gender:</label>
                    <input type="text" name="lecturer.user.gender" id="lecturer.user.gender" class="form-control" value="${lecturer.user.gender}" placeholder="male&female" required="true"/>

                    <label for="lecturer.position" class="control-label col-xs-6">Position:</label>
                    <input type="text" name="lecturer.position" id="lecturer.position" class="form-control" value="${lecturer.position}" required="true"/> 



                    <label for="lecturer.startDate" class="control-label col-xs-6">Start Date:</label>
                    <input type="date" name="lecturer.startDate" id="lecturer.startDate" class="form-control" value="${lecturer.startDate}" placeholder="dd-MM-yyy" required="true"/>

                    <label for="lecturer.endDate" class="control-label col-xs-6">End Date:</label>
                    <input type="date" name="lecturer.endDate" id="lecturer.endDate" class="form-control" value="${lecturer.endDate}" placeholder="dd-MM-yyy" />
                    <br>
                <div>                   
                    <button type="submit" class="btn btn-primary  btn-md">Accept</button> 
                </div>
                </div>

                <div class="from-group col-xs-6">
                    <h2>Login Information</h2>
                    <br/>
                    <input type="hidden" id="lecturer.user.userId" name="lecturer.user.userId" value="${lecturer.user.userId}">

                    <label for="lecturer.user.userName" class="control-label col-xs-6">User Name:</label>
                    <input type="text" name="lecturer.user.userName" id="lecturer.user.userName" class="form-control" value="${lecturer.user.userName}" required="true"/>

                    <label for="lecturer.user.password"  class="control-label col-xs-6">Password:</label>
                    <input type="text" name="lecturer.user.password" id="lecturer.user.password" class="form-control" value="${lecturer.user.password}" required="true"/>

                    <label for="lecturer.user.phone"  class="control-label col-xs-6">Phone:</label>
                    <input type="text" name="lecturer.user.phone" id="lecturer.user.phone" class="form-control" value="${lecturer.user.phone}" required="true"/>

                    <label for="lecturer.user.address"  class="control-label col-xs-6">Address:</label>
                    <input type="text" name="lecturer.user.address" id="lecturer.user.address" class="form-control" value="${lecturer.user.address}" required="true"/>

                    <label for="lecturer.user.email"  class="control-label col-xs-6">Email:</label>
                    <input type="text" name="lecturer.user.email" id="lecturer.user.email" class="form-control" value="${lecturer.user.email}" placeholder="lecturer@gmail.com" required="true"/>


                    <input type="hidden" name="lecturer.user.role" id="lecturer.user.role" class="form-control" value="lecturer" required="true"/>

                    <label for="lecturer.user.status"  class="control-label col-xs-6">Status:</label>
                    <input type="text" name="lecturer.user.status" id="lecturer.user.status" class="form-control" value="${lecturer.user.status}" required="true"/>
                </div>


            </form>


        </div> 

    </body>
</html>
