<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
  
    $("#condition").change(function(){      
       var client_no = $("#condition option:selected").val();
       location.href="review_search?client_no="+client_no;   
    });
    
});


</script>
<meta charset="EUC-KR">
<title>이용후기 게시판 페이지</title>
</head>
<body>

<!-- 민이가 작성중 -->
${user.member_name }님 환영합니다.<br>
	<h1>이용후기 게시판</h1>
	<form action="review_insertform">
	<select id="condition">
		<option value="0" <c:if test="${client_no eq 0}">selected</c:if>>전체</option>
		<option value="1" <c:if test="${client_no eq 1}">selected</c:if>>7Gram</option>
		<option value="2" <c:if test="${client_no eq 2}">selected</c:if>>맥주창고</option>
		<option value="3" <c:if test="${client_no eq 3}">selected</c:if>>요술포차</option>
	</select>
	
	<table border="1">
		<tr>
			<th>번호</th>
			<th>분류</th>
			<th>제휴업체</th>
			<th>제목</th>
			<th>작성일</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>좋아요</th>
		</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="1">-------작성한 글이 없습니다-------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.board_no }</td>
							<td>${dto.board_category }</td>
							<td>
								${dto.client_no }
							</td>
							<td><a href="review_detail?board_no=${dto.board_no }">${dto.board_title }</a></td>
							<td><fmt:formatDate value="${dto.board_date_create}" pattern="yyyy년 MM월 dd일"></fmt:formatDate></td>
							<td>${dto.board_writer }</td>
							<td>${dto.board_count }</td>
							<td>${dto.board_like }</td>					
						</tr>
						<input type="hidden" name="client_no" value="${client_no }"/>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	<hr>
	<input type="button" value="메인페이지로" class="btn btn-default" onclick="location.href='../home/main'"/>
	<input type="submit" value="후기작성" class="btn btn-default"/>
	</form>
</body>
</html>