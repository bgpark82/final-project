<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>후기 수정 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	var input = $("td").eq(1)
	console.log(input.attr("id"))
	switch (input.attr("id")) {
	  case "0":
		  input.html("전체")
	    break;
	  case "1":
		  input.html("7Gram")
	    break;
	  case "2":
		  input.html("맥주창고")
	    break;
	  case "3":
		  input.html("요술포차")
	    break;
	}
})
</script>
</head>
<body>

	<h1>후기 수정하기</h1>
	<form:form action="../user/review_update?board_no=${dto.board_no }" method="post">
	<table border="1">
	<tr>
		<th>작성자</th>
		<td>${dto.board_writer }</td>
	</tr>
	<tr>
		<th>제휴업체</th>
		<td id="${dto.client_no }"></td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input type="text" value="${dto.board_title }" name="board_title"/></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><input type="text" value="${dto.board_content }" name="board_content"/></td>
	</tr>
	</table>
	<hr>
	<input type="button" value="취소" onclick="location.href='review_board_list'"/>
	<input type="submit" value="수정완료"/>
	</form:form>
</body>
</html>