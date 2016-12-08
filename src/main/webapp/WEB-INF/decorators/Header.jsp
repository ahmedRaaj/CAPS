<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div >

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/BlurBackground.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">
	<%
		String path=request.getRequestURL().toString();
	//	String server=request.getContextPath();
		if(path.contains("/Mainpage"))
		{
	%>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/metro.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/metro-icons.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/metro-colors.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/metro-schemes.min.css">
	<%}%>

</div>


