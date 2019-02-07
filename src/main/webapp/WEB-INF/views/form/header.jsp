<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>				
<% response.setContentType("text/html; charset=UTF-8"); %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/gaia.css" rel="stylesheet">

    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Cambo|Poppins:400,600" rel="stylesheet" type="text/css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/fonts/pe-icon-7-stroke.css" rel="stylesheet">

    <!-- Canonical SEO -->
    <link rel="canonical" href="https://www.creative-tim.com/product/gaia-bootstrap-template">

    <!--  Social tags      -->
    <meta name="keywords" content="creative tim, html template, html css template, web template, bootstrap, css3 template, frontend, responsive bootstrap template">

    <meta name="description" content="Probably the most stylish bootstrap template in the world!">
  <!-- Twitter Card data -->

    <meta name="twitter:card" content="product">
    <meta name="twitter:site" content="@creativetim">
    <meta name="twitter:title" content="Gaia Bootstrap Template Demo by Creative Tim">

    <meta name="twitter:description" content="Probably the most stylish bootstrap template in the world!">
    <meta name="twitter:creator" content="@creativetim">
    <meta name="twitter:image" content="https://s3.amazonaws.com/creativetim_bucket/products/45/original/opt_gbt_thumbnail.jpg">
    <meta name="twitter:data1" content="Gaia Bootstrap Template Demo by Creative Tim">
    <meta name="twitter:label1" content="Product Type">
    <meta name="twitter:data2" content="Free">
    <meta name="twitter:label2" content="Price">
  
	<link rel="stylesheet" href="<c:url value='/resources/gaia-bootstrap-template/assets/css/bootstrap.css'/>" />
	<link rel="stylesheet" href="<c:url value='/resources/gaia-bootstrap-template/assets/css/demo.css'/>" />	
	<link rel="stylesheet" href="<c:url value='/resources/gaia-bootstrap-template/assets/css/gaia.css'/>" />
	<link rel="stylesheet" href="<c:url value='/resources/gaia-bootstrap-template/assets/js/bootstrap.js'/>" />
	<link rel="stylesheet" href="<c:url value='/resources/gaia-bootstrap-template/assets/js/modernizr.js'/>" />
	<link rel="stylesheet" href="<c:url value='/resources/gaia-bootstrap-template/assets/js/gaia.js'/>" />
	<link rel="stylesheet" href="<c:url value='/resources/gaia-bootstrap-template/assets/js/jquery.min.js'/>" />
	<link rel="stylesheet" href="<c:url value='/resources/gaia-bootstrap-template/freebie.html'/>" />


<meta charset="UTF-8">
<title>Insert title here</title>

 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script> 
 <script src="https://apis.google.com/js/platform.js" async defer></script> 
 <meta name="google-signin-client_id" content="690508328531-01hp95icnlji25iomgb897khfc4vevfu.apps.googleusercontent.com">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
 <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script> 
 
 
</head>
<body>
		
	<security:authentication property="principal.username"/>님 반갑습니다.

	<form:form action="${pageContext.request.contextPath }/logout" method="POST">
		<input type="submit" value="로그아웃">
	</form:form>

</body>
</html>