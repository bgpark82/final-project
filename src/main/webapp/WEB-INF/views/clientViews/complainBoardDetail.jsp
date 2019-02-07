<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항 글 보기</title>

<!-- 드롭다운 -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/resources/css/dropdown.css">


<link href="${pageContext.request.contextPath}/resources/css/boarddetail.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<!-- Plugin CSS 팝업창 숨기는-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.css">

<!-- Custom styles for this template -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freelancer.min.css">

</head>
<body>

	<!-- Navigation -->
	<%@ include file="../form_client/header.jsp" %>
	
	<!-- Header -->
	<header class="masthead bg-primary text-white text-center">
		<img class="img-fluid mb-5 d-block mx-auto" src="${pageContext.request.contextPath}/resources/img/건의사항.png" alt="">
	<h2>건의사항 게시판</h2>
	</header>

	<section  class="portfolio" id="portfolio">
	<div class="container" style="height: 700px;" >
			<hr>
			
			<div class="subject_form">
				<div class="subject">카테고리</div>
				<div class="form-group">${dto.board_category }</div>
			</div>

			<div class="subject_form">
				<div class="subject">제목</div>
				<div class="form-group">${dto.board_title }</div>
			</div>

			<div class="writer_form">
				<div class="write">글쓴이</div>
				<div class="writer">${dto.board_writer }</div>
				<div class="hit">조회수 : &nbsp;&nbsp;${dto.board_count }</div>
				<div class="date_form">
					작성일 :&nbsp;&nbsp;
					<fmt:formatDate value="${dto.board_date_create }" pattern="yyyy.MM.dd" />
				</div>
			</div>
			<br>
			<br>
			<br>
			
			<div class="content">
				${dto.board_content }
			</div>

				<div class="button_container">
				<div class="update_button">
					<a class="upde" href="complain_updateform?board_no=${dto.board_no}">
					<button type="submit" class="btn btn-primary" style="text-align: right;">수정</button></a>
				</div>
				<div class="delete_button">
					<button type="button" class="btn btn-primary" style="text-align: right;" onclick="location.href='complain_delete?board_no=${dto.board_no}'">삭제</button>
				</div>
				<br>
				<br>
				<hr>
				<div style="text-align: right;">
					<button type="button" class="btn btn-primary" onclick="location.href='complain_board_list'">목록으로</button>
				</div>
			</div>
	</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
	</section>

	<!-- Footer -->
	<%@ include file="../form_client/footer.jsp" %>
</body>
</html>