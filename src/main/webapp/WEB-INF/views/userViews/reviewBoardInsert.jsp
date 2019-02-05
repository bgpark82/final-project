<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	var input = $("input").eq(3)
	switch (input.attr("id")) {
	  case "0":
		  input.val("전체")
	    break;
	  case "1":
		  input.val("7Gram")
	    break;
	  case "2":
		  input.val("맥주창고")
	    break;
	  case "3":
		  input.val("요술포차")
	    break;
	}
})



</script>
<meta charset="UTF-8">
<title>후기 작성 페이지</title>
</head>
<body>
	${user.member_name }님 환영합니다.
	<h1>후기 작성 페이지</h1>
	<form:form action="review_insert" method="post">
	<input type="hidden" name="client_no" value="${client_no }">
	<input type="hidden" name="member_no" value="${user.member_no }">
	<table border="1">
		<tr>
			<th>작성자</th>
			<td><input type="text" value="${user.member_name }" name="board_writer" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>제휴업체</th>
			<td>
				<input type="text" id="${client_no }" readonly="readonly"/>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="board_title"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" name="board_content"></textarea></td>
		</tr>
	</table>
	<hr>
	<input type="button" value="취소" onclick="location.href='review_board_list'"/>
	<input type="submit" value="후기등록"/>
	</form:form>
</body>
</html>