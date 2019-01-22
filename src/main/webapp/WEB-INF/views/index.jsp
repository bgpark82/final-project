<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>INDEX PAGE</h1>
<form:form action="${pageContext.request.contextPath }/home/login" method="post" >
	ID : <input type="text" name="username"/> <br>
	PW : <input type="password" name="password"/> <br>
	자동 로그인 <input type="checkbox" name="remember-me"/>
	
	<input type="submit" value="로그인">
	<input type="button" value="회원가입" onclick="location.href='home/registerPage'">
</form:form>

	<c:if test="${param.error != null }">
		아이디/비밀번호를 확인해주세요.
	</c:if>
	
	<c:if test="${param.logout != null }">
		로그아웃 하셨습니다.
	</c:if>

	
	

	<h3>컨트롤러 TEST</h3>
	<a href="home/test">homeControllerTest</a> <br>
	<a href="user/test">userControllerTest</a> <br>
	<a href="academy/test">academyControllerTest</a> <br>
	<a href="client/test">clientControllerTest</a> <br>
	
</body>
</html>