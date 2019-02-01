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

<form action="client/login" method="post">

	ID<input type="text" name="member_id"> <br>
	PW<input type="text" name="member_password"> <br>
	
	<input type="submit" value="로그인">
	<input type="button" value="회원가입" onclick="location.href='client/registform'">

</form>






	<h3>컨트롤러 TEST</h3>
	<a href="home/test">homeControllerTest</a> <br>
	
</body>
</html>