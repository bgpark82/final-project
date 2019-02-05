<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="EUC-KR">
<title>�ı� �� ������</title>
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

	<h1>�ı� �󼼺���</h1>
	
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
	<input type="button" value="���" class="btn btn-default" onclick="location.href='review_board_list'"/>
	<input type="button" value="����" class="btn btn-default" onclick="location.href='review_updateform?board_no=${dto.board_no}'"/>
	<input type="button" value="����" class="btn btn-default" onclick="location.href='review_delete?board_no=${dto.board_no}'"/>
</body>
</html>