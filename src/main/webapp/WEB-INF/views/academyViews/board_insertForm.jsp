<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지사항 글입력</h1>
	
	<form action="../academy/board_insert">
		<input type="hidden" name="member_no" value="${user.member_no }">
	<table border="1">
		<tr>
			<th>카테고리</th>
			<td><input type="text" name="board_category" value=${board_category } readonly="readonly"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="board_writer" value="${user.member_name }" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>제목</th>
			<td align="left"><input type="text" name="board_title"/></td> 
		</tr>
		
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" name="board_content"></textarea></td>
		</tr>
	</table>
	<hr>
		<input type="submit" value="입력">
		<input type="button" value="취소" class="btn btn-default" onclick="location.href='../academy/notice_list'"/>
	</form>
</body>
</html>