<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<%	response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/gaia-bootstrap-template/assets/css/bootstrap.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/gaia-bootstrap-template/assets/css/demo.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/gaia-bootstrap-template/assets/css/gaia.css'/>" />
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">

    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
    <link href="resources/gaia-bootstrap-template/assets/css/bootstrap.css" rel="stylesheet">
    <link href="resources/gaia-bootstrap-template/assets/css/gaia.css" rel="stylesheet">

    <!--     Fonts and icons     -->
    <link href="https://fonts.googleapis.com/css?family=Cambo|Poppins:400,600" rel="stylesheet" type="text/css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/css/fonts/pe-icon-7-stroke.css" rel="stylesheet">

    <!-- Canonical SEO -->
    <link rel="canonical" href="https://www.creative-tim.com/product/gaia-bootstrap-template">

    <!--  Social tags      -->
    <meta name="keywords" content="creative tim, html template, html css template, web template, bootstrap, css3 template, frontend, responsive bootstrap template">

    <meta name="description" content="Probably the most stylish bootstrap template in the world!">

<meta charset="UTF-8">

<title>메인페이지</title>
</head>
<body>
	
	<%@ include file="./form/header.jsp" %>	

	<security:authorize access="hasRole('USER')">
	
		<a href="../user/client_list">제휴업체 리스트</a>
		<a href="../user/my_coupon_list?member_no=${user.member_no }">내 쿠폰함</a>
		<a href="../user/mypage?member_no=${user.member_no }">마이페이지</a>
		<a href="../user/board_list">공지사항</a>
	</security:authorize>
	
	
	<security:authorize access="hasRole('CLIENT')">
		<a href="../client/menu_list">메뉴 리스트</a>
	</security:authorize>
	
	<%-- <%@ include file="./form/footer.jsp" %> --%>
</body>
</html>