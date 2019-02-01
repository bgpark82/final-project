<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>

	<h1>회원가입</h1>
	
	<form action="regist_insert" method="post">
	<table border="1">
		<tr>
			<th>이름</th>
			<td><input type="text" placeholder="이름을 입력해주세요" name="member_name"/></td>
		</tr>
		<tr>
			<th>ID</th>
			<td><input type="text" placeholder="ID를 입력해주세요" name="member_id"/></td>
		</tr>
		<tr>
			<th>PASSWORD</th>
			<td><input type="text" placeholder="비밀번호를 입력해주세요" name="member_password"/></td>
		</tr>
	</table>
	<hr>
	<input type="button" value="취소" onclick="location.href='#'"/>
	<input type="submit" value="회원가입"/>
	</form>

</body>
</html>