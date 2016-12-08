<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="dec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<%@ include file="Header.jsp"%>
<link rel="STYLESHEET" type="text/css" href="${ss}" />
</head>
<body>
<%


	if(!path.contains("/Mainpage"))
	{
%>
     <div class="container-fluid">
		 <div class="row">

			 <div class="col-sm-2 col-md-2 top">
				 <%@ include file="Menu.jsp"%>

			 </div>


		 <div class="col-sm-8 col-sm-offset-2 col-md-8 col-md-offset-1">
			 <%}%>
			 <h3>
				 <spring:message code="${bodyTitle}" />
			 </h3>
			 <dec:body />
		 </div>
		 </div>
	 </div>



<script src="/js/jquery-1.10.2.min.js"></script>


<script src="/js/bootstrap.min.js"></script>

<script src="/js/ImgEffect.js"></script>
<%

	if(path.contains("/Mainpage"))
	{
%>
<script src="/js/metro.min.js"></script>
  <script src="/js/Mainpage.js"></script>
<%}%>
<script src="/js/sidebar.js"></script>

	<!-- ======== Footer ======== -->
	<div id="footer" align="center">
		<small> &copy; ISS NUS SA Diploma 2016 </small>
	</div>
</body>
</html>
