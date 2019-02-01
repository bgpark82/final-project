<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
  
    $("#condition").change(function(){      
       var condition = $("#condition option:selected").val();
       location.href="review_search?condition="+condition;   
    });
    
});
</script>
<meta charset="EUC-KR">
<title>이용후기 게시판 페이지</title>
</head>
<body>

<!-- 민이가 작성중 -->
${regist_dto.member_name }님 환영합니다.<br>
	<h1>이용후기 게시판</h1>
	<form action="review_insertform">
	<select id="condition">
		<option value="전체" <c:if test="${Name eq '전체'}">selected</c:if>>전체</option>
		<option value="7Gram" <c:if test="${param.condition=='7Gram'}">selected</c:if>>7Gram</option>
		<option value="맥주창고" <c:if test="${param.condition=='맥주창고'}">selected</c:if>>맥주창고</option>
		<option value="요술포차" <c:if test="${param.condition=='요술포차'}">selected</c:if>>요술포차</option>
	</select>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>분류</th>
			<th>제목</th>
			<th>작성일</th>
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
							<td>${dto.review_no }</td>
							<td>${dto.review_category }</td>
							<td><a href="review_detail?review_no=${dto.review_no }">${dto.review_title }</a></td>
							<td><fmt:formatDate value="${dto.review_date_create }" pattern="yyyy.MM.dd" /></td>			
							<td>${dto.review_count }</td>
							<td>${dto.review_like }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	<hr>
	<input type="button" value="학생메인페이지로" onclick="location.href='memberMain'"/>
	<input type="submit" value="후기작성"/>
	</form>
</body>
</html>