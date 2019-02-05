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

<meta charset="EUC-KR">
<title>공지사항</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	$("#category_btn").on("click", function(){
		category();
	});

	function category() {
		
		var selectBox_val = $("#category option:selected").val();
		
		var selectBox_text = $("#category option:selected").text();
		
		//alert("value 값: " + selectBox_val + " /////// " + "text 값:"+selectBox_text); 
		
		if(selectBox_val == 'all'){
			alert("value 값: " + selectBox_val + " /////// " + "text 값:"+selectBox_text); 
			location.href="  ";
		
		}else if(selectBox_val == '7Gram'){
			
		}else if(selectBox_val == 'mcbar'){
			
		}else if(selectBox_val == 'magicbar'){
		}
	}
});
</script>
<meta charset="EUC-KR">
<title>커뮤티니 안에 있는 학생들이 보는 공지사항</title>
</head>
<body>

	<!-- 작성자: 김단비
		작성 날짜: 16JAN19
		기능: 제휴업체 측에서 작성한 공지사항을 학생들이 볼 수 있는 페이지
		사용하는 DB 테이블 : board / member
		부가설명 : board 테이블에서 공지사항 게시판 정보들 가져오고 , member에서 작성자 값(제휴업체 이름)을 가져온다.  리턴값은 LIST이다.  -->
${user.member_name }님 환영합니다.<br>
	<h1>공지사항</h1>
	
	<jsp:useBean id="dto" class="kh.coupon.mvc.dto.BoardDto" scope="request"></jsp:useBean>
	
	
		<select class="selectBox" id="category" name="category">
			<option value="all" selected="selected">--전체공지--</option>
			<option value="7Gram">7Gram</option>
			<option value="mcbar">맥주창고</option>
			<option value="magicbar">요술포차</option>
		</select>
		<button id="category_btn">조회</button>

	
	<table border="1">
		<col width="50"> <!-- board_no -->
		<col width="100"> <!-- user_name -->
		<col width="500"> <!-- boardt_title -->
		<col width="300"> <!-- board_date_create -->
		<col width="100"> <!-- board_category-->
		<col width="70"> <!-- board_count -->
		
		<tr>
			<th>번호</th>
			<th>제휴업체</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="6"> --- 작성된 공지사항이 없습니다. --- </td>				
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${list }">
					<tr align="center">
						<td>${dto.board_no}</td>
						<td>${dto.client_no}</td>
						<td><a href="board_detail?board_no=${dto.board_no}"> ${dto.board_title}</a></td>
						<td><fmt:formatDate value="${dto.board_date_create}" pattern="yyyy년 MM월 dd일"></fmt:formatDate></td>
						<td>${dto.board_count}</td>
					</tr>								
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<hr>
	<input type="button" value="메인페이지로" class="btn btn-default" onclick="location.href='../home/main'"/>

	
</body>
</html>