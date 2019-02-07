<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지사항 상세보기</h1>

	<table border="1">
		<tr>
			<td align="right" colspan="2">${notice_dto.board_count } </td>
		</tr>
		<tr>
			<th>카테고리</th>
			<td>${notice_dto.board_category }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${notice_dto.board_writer }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td align="left">${notice_dto.board_title }</td> 
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" readonly="readonly">${notice_dto.board_content }</textarea></td>
		</tr>
	</table>
	<hr>
	<input type="button" value="목록" class="btn btn-default" onclick="location.href='../academy/notice_list'"/>
	<input type="button" value="수정" class="btn btn-default" onclick="location.href='../academy/notice_updateForm?board_no=${notice_dto.board_no}'"/>
	<input type="button" value="삭제" class="btn btn-default" onclick="location.href='../academy/notice_delete?board_no=${notice_dto.board_no}'"/> 
</body>
</html>