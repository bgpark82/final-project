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
						<td><a href="../academy/board_detail?board_no=${notice.board_no }">${notice.board_title }</a></td>
						<td>${notice.board_writer }
						<td>${notice.board_date_create} </td>
						<td>${notice.board_count }</td>
						<!-- member_no는 사용자 검색을 통해 값을 가져와서 보내주도록 바꾸자. -->
<%-- 						<td><input type="button" value="구매" onclick="a href='../academy/coupon_purchase_form?member_no=100&client_no=${coupon.client_no}&menu_no=${coupon.menu_no }&client_name=${coupon.client_name }'"></td> --%>
					</tr>
				</c:forEach>
				<tr>
				<td><input type="button" value="글쓰기" onclick="location.href='../academy/board_insertForm?board_category=공지사항'">
				</tr>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>