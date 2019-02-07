<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건의사항작성페이지</title>
</head>


<!-- 드롭다운 -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/resources/css/dropdown.css">

<link href="${pageContext.request.contextPath}/resources/css/boardinsert.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">

<!-- Plugin CSS 팝업창 숨기는-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.css">

<!-- Custom styles for this template -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freelancer.min.css">


<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	  
    $("#condition").change(function(){      
       var condition = $("#condition option:selected").val();
       location.href="complain_insert?condition="+condition;
    });
    
});

</script>
<body>

	<!-- Navigation -->
	<%@ include file="../form_client/header.jsp" %>
	
	<!-- Header -->
	<header class="masthead bg-primary text-white text-center">
		<img class="img-fluid mb-5 d-block mx-auto" src="${pageContext.request.contextPath}/resources/img/건의사항.png" alt="">
	<h2>건의사항 작성</h2>
	</header>
	<br>
	<br>
	<div class="container">
		<form:form action="complain_insert" method="post">
			<input type="hidden" name="member_no" value="${user.member_no }">
			<input type="hidden" name="board_writer" value="${user.member_name }">
			<hr>
			<div class="subject_form">
				<div class="subject">카테고리</div>
				<div class="form-group">
					<select name="board_category">
						<option value="7Gram" selected>7Gram</option>
						<option value="맥주창고">맥주창고</option>
						<option value="요술포차">요술포차</option>
					</select>
	        	</div>
	        </div>
			<div class="subject_form">
				<div class="subject">제목</div>
				<div class="form-group">
	            	<input type="text" class="form-control" name="board_title">
	        	</div>
	        </div>
	        
	        <div class="content_form">
	        	<div class="content">
	        		<textarea rows="15" cols="120" name="board_content"></textarea>
	        	</div>
	        </div>
	        
	        <div style="text-align: right;">
				<button type="submit" class="btn btn-primary">글등록</button>
			</div>
		</form:form>
        <hr>

        	<div style="text-align: right;">
				<button type="button" class="btn btn-primary" onclick="location.href='complain_board_list'">목록으로</button>
			</div>
			<br>
			<br>
        
	</div>

	<!-- Footer -->
	<%@ include file="../form_client/footer.jsp" %>
</body>
</html>