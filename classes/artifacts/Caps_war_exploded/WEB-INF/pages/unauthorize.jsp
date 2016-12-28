<%--
  Created by IntelliJ IDEA.
  User: Zwe Htat Naing
  Date: 06/12/2016
  Time: 01:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="login" uri="http://login.com" %>
<html >
    <head>
        <link rel="stylesheet" href="../css/bootstrap.css">
        <link rel="stylesheet" href="../css/BlurBackground.css">
    </head>
    <body class="bkg">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="text-success text-center">
                        <h1><font color="red">*** Unauthorized Access ***</font> <font color="blue">(Please log in)</font></h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-8">
                        <div class="row">
                            <div class="imgdiv col-md-1 col-md-push-2 visible-lg" style="float: right; height: 420px; width: 420px;margin-top: 85px; margin-right: 300px;">
                                <img class="imgdiv" src="../image//AccessDenied2.jpg"> 
                            </div>
                        </div>        
                    </div>
                    <div class="col-md-3">
                        <%--${pageContext.request.contextPath}--%>
                        <form action="${pageContext.request.contextPath}/login/auth" method="post" id="LoginForm" role="form" >
                            <login:login/>
                        </form>
                    </div>
                </div>
            </div>

        </div>
        <script src="../js/jquery-1.10.2.min.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <script src="../js/ImgEffect.js"></script>
    </div>





</body>
</html>
