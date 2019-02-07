<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지사항</h1>
<c:choose>
		<c:when test="${empty notice_list}">
			<h3> ---- 공지사항이 없습니다. ---- </h3>
		</c:when>
		
		<c:otherwise>
			<table>
				<tr>
				<td>글번호 <td>제목 <td>작성자 <td>날짜 <td>조회수
				</tr>
				<c:forEach var="notice" items="${notice_list }">
					<tr>
						<td>${notice.board_no }</td>
						<td><a href="../user/notice_detail?board_no=${notice.board_no }">${notice.board_title }</a></td>
						<td>${notice.board_writer }
						<td>${notice.board_date_create} </td>
						<td>${notice.board_count }</td>
					</tr>
				</c:forEach>
				<tr>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>