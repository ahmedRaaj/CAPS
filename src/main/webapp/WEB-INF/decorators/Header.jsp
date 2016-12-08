<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div >

	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/BlurBackground.css">
	<link rel="stylesheet" href="/css/sidebar.css">
	<%
		String path=request.getRequestURL().toString();
		String server=request.getContextPath();
		if(path.contains("/Mainpage"))
		{
	%>

	<link rel="stylesheet" href="/css/metro.min.css">
	<link rel="stylesheet" href="/css/metro-icons.min.css">
	<link rel="stylesheet" href="/css/metro-colors.min.css">
	<link rel="stylesheet" href="/css/metro-schemes.min.css">
	<%}%>

</div>


