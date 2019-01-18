<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>INDEX PAGE</h1>
<form action="home/login" method="post">
	ID<input type="text" name="user_id"> <br>
	PW<input type="text" name="user_pw"> <br>
	
	<input type="submit" value="로그인">
	<input type="button" value="회원가입" onclick="location.href='home/registerform'">
</form>

	<h3>컨트롤러 TEST</h3>
	<a href="home/test">homeControllerTest</a> <br>
	<a href="user/test">userControllerTest</a> <br>
	<a href="academy/test">academyControllerTest</a> <br>
	<a href="client/test">clientControllerTest</a> <br>
	
</body>
</html>