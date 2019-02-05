<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ı� ���� ������</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	var input = $("td").eq(1)
	console.log(input.attr("id"))
	switch (input.attr("id")) {
	  case "0":
		  input.html("��ü")
	    break;
	  case "1":
		  input.html("7Gram")
	    break;
	  case "2":
		  input.html("����â��")
	    break;
	  case "3":
		  input.html("�������")
	    break;
	}
})
</script>
</head>
<body>

	<h1>�ı� �����ϱ�</h1>
	<form:form action="../user/review_update?board_no=${dto.board_no }" method="post">
	<table border="1">
	<tr>
		<th>�ۼ���</th>
		<td>${dto.board_writer }</td>
	</tr>
	<tr>
		<th>���޾�ü</th>
		<td id="${dto.client_no }"></td>
	</tr>
	<tr>
		<th>����</th>
		<td><input type="text" value="${dto.board_title }" name="board_title"/></td>
	</tr>
	<tr>
		<th>����</th>
		<td><input type="text" value="${dto.board_content }" name="board_content"/></td>
	</tr>
	</table>
	<hr>
	<input type="button" value="���" onclick="location.href='review_board_list'"/>
	<input type="submit" value="�����Ϸ�"/>
	</form:form>
</body>
</html>