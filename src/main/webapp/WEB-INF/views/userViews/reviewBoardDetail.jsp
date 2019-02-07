<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="EUC-KR">
<title>후기 상세 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>

	<h1>후기 상세보기</h1>
	
	<table border="1">
	<tr>
		<th>작성자</th>
		<td>${dto.board_writer }</td>
	</tr>
	<tr>
		<th>제휴업체</th>
		<td>${dto.board_category }</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>${dto.board_title }</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>${dto.board_content }</td>
	</tr>
	</table>
	<hr>
	<input type="button" value="목록" class="btn btn-default" onclick="location.href='review_board_list?board_category=${dto.board_category}'"/>
	<input type="button" value="수정" class="btn btn-default" onclick="location.href='review_updateform?board_no=${dto.board_no}'"/>
	<input type="button" value="삭제" class="btn btn-default" onclick="location.href='review_delete?board_no=${dto.board_no}&board_category=${dto.board_category }'"/>
</body>
</html>