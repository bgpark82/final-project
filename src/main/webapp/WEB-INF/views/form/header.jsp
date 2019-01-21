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
<meta charset="UTF-8">
<title>Insert title here</title>

 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script> 
 <script src="https://apis.google.com/js/platform.js" async defer></script> 
 <meta name="google-signin-client_id" content="690508328531-01hp95icnlji25iomgb897khfc4vevfu.apps.googleusercontent.com">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
 <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script> 
 
 
</head>
<body>

	<!-- 
	세션처리 
		${username}으로 세션을 불러옴
		username = id
	-->
							
	<security:authentication property="principal.username"/>님 반갑습니다.

	<form:form action="${pageContext.request.contextPath }/logout" method="POST">
		<input type="submit" value="로그아웃">
	</form:form>
</body>
</html>