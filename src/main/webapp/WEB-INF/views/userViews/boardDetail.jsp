<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="EUC-KR">
<title>�������� �� ������</title>
</head>
<body>

	<h1>���� �󼼺���</h1>
	
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
		<td>${dto.board_title }</td>
	</tr>
	<tr>
		<th>����</th>
		<td>${dto.board_content }</td>
	</tr>
	</table>
	<hr>
	<input type="button" value="���" class="btn btn-default" onclick="location.href='board_list'"/>

</body>
</html>