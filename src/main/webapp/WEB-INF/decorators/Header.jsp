<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/BlurBackground.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/sidebar.css">

<<<<<<< HEAD
	<link rel="stylesheet" href="/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/BlurBackground.css">
	<link rel="stylesheet" href="/css/sidebar.css">
	<%
		String path=request.getRequestURL().toString();
	//	String server=request.getContextPath();
		if(path.contains("/Mainpage"))
		{
	%>

	<link rel="stylesheet" href="/css/metro.min.css">
	<link rel="stylesheet" href="/css/metro-icons.min.css">
	<link rel="stylesheet" href="/css/metro-colors.min.css">
	<link rel="stylesheet" href="/css/metro-schemes.min.css">
	<%}%>
=======
        <% 
          String path = request.getRequestURL().toString();
          if(path.contains("/Mainpage"))
          {
        %>
        
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/metro.min.css">
         <link rel="stylesheet" href="${pageContext.request.contextPath}/css/metro-icons.min.css">
          <link rel="stylesheet" href="${pageContext.request.contextPath}/css/metro-colors.min.css">
           <link rel="stylesheet" href="${pageContext.request.contextPath}/css/metro-checmes.min.css">
        
        <%}%>
        
>>>>>>> 396f0a3e580f409c7f02fe1a0bdf1cf570035753

</div>


