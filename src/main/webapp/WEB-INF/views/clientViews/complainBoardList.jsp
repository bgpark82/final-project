<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>건의사항 게시판 페이지</title>

<!-- 드롭다운 -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/resources/css/dropdown.css">

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">

<!-- Custom fonts for this template -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

<!-- Plugin CSS 팝업창 숨기는-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.css">

<!-- Custom styles for this template -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freelancer.min.css">

<!-- 게시판 style --> 
<style>
/* boardcss_list 에서 사용하는 글 목록 테이블 크기*/
.boardcss_list_table { width: 100%; }

/* 화면에 보여지는 글 목록 테이블 */
.list_table { width: 100%; }

/* 화면에 보여지는 caption */
.list_table caption { display: none; }

/* list_table 에서 사용되는 thead */
.list_table thead th { text-align: center; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; background: #faf9fa; }

/* list_table 에서 사용되는 tbody */
.list_table tbody td { text-align: center;  border-bottom: 1px solid #e5e5e5; padding: 5px 0; }

</style>

</head>


<body>

	<!-- Navigation -->
	<%@ include file="../form_client/header.jsp" %>
	
	
	
	
	
	
	<!-- Header -->
	<header class="masthead bg-primary text-white text-center">
		<img class="img-fluid mb-5 d-block mx-auto" src="${pageContext.request.contextPath}/resources/img/건의사항.png" alt="">
	<h2>건의사항 게시판</h2>
	</header>
	
	
	<section class="portfolio" id="portfolio">
	<div class="container" style="height: 700px;">
	<form class="boardcss_list_table" action="complain_insertform">
		<select id="condition">
			<option value="전체" <c:if test="${Name eq '전체'}">selected</c:if>>전체</option>
			<option value="7Gram"<c:if test="${param.condition=='7Gram'}">selected</c:if>>7Gram</option>
			<option value="맥주창고"<c:if test="${param.condition=='맥주창고'}">selected</c:if>>맥주창고</option>
			<option value="요술포차"<c:if test="${param.condition=='요술포차'}">selected</c:if>>요술포차</option>
		</select>
		<table class="list_table">
		<colgroup>
			<col width="10%" />
			<col width="20%" />
			<col width="25%" />
			<col width="25%" />
			<col width="10%" />
			<col width="10%" />
		</colgroup>
		<thead> 
			<tr> 
				<th>번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요</th>
			</tr>
		</thead>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td>작성 글 없음</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.board_no }</td>
							<td>${dto.board_category }</td>
							<td><a href="complain_detail?board_no=${dto.board_no }">${dto.board_title }</a></td>
							<td><fmt:formatDate value="${dto.board_date_create }" pattern="yyyy.MM.dd" /></td>	
							<td>${dto.board_count }</td>
							<td>${dto.board_like_count }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	<hr>
	<input type="submit" value="건의사항작성" class="btn btn-primary" id="b1" style="float: right;"/>
	</form>
	</div>


	</section>

	
	<!-- Footer -->
	<%@ include file="../form_client/footer.jsp" %>

	<!-- 카테고리선택관련 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			$("#condition").change(function() {
				var condition = $("#condition option:selected").val();
				location.href = "complain_search?condition=" + condition;
			});

		});
	</script>
	
</body>

</html>