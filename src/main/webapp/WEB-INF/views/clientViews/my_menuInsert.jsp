<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출현황 페이지</title>

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

<!-- 사이드 메뉴바 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidemenubar.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>

<!-- 메뉴목록 style --> 
<style>
th{width:100%; text-align: center; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; background: #faf9fa;}
td{width:100%; border-top: 1px solid #e5e5e5; border-bottom: 1px solid #e5e5e5; padding: 8px 0; }
</style>

<script>
$(document).ready(function(){
	alert("check!")
	$('#submit').click(function() {
		var form = $('#fileUpload');
		var formData = new FormData(form)
		formData.append("file",$("#file")[0].files[0]);
		alert(form)
		alert(formData)
		console.log($("#file")[0].files[0])
		$.ajax({
				url: '../client/upload',
				type:'POST',
				enctype: 'multipart/form-data',
				data:formData,
				beforeSend : function(xhr)
                {   
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
				processData:false,
				contentType:false,
				cache:false,
				success:function(data){
					alert("성공")
					console.log(data)
				
					$('#img').append("<img style='width:200px; height:200px;' src=\'"+ data + "\' >" );
					$('#menu_image').attr('value',data)
				},
                error:function(error){
                	console.log("실패")
                	console.log(error)
                }
			})
	})
})
</script>

</head>

<body>

	<!-- Navigation -->
	<%@ include file="../form_client/header.jsp" %>

	
		<div  style="margin-top:200px; margin-bottom: 759px;">
		<div class="row justify-content-center">
			<div>
				<img class="img-fluid mb-5 d-block mx-auto" src="${pageContext.request.contextPath}/resources/img/메뉴관리.png" alt="">
				<h2 class="text-center text-uppercase text-secondary mb-0">메뉴추가</h2>
			</div>
		</div>
		
		<br>
		<br>
			<div class="row justify-content-center">	

			<form:form action="menu_insert" method="post"  style="text-align: center;">
			<input type="hidden" name="client_no" value="${client.client_no }">
				<input type="hidden" name="menu_image" id="menu_image"/>
				<table class="table table-sm">
					<tbody>
						<tr>
							<th>메뉴이름</th>
							<td><input type="text" name="menu_title" /></td>
						</tr>
						<tr>
							<th>메뉴가격</th>
							<td><input type="text" name="menu_price" /></td>
						</tr>
						<tr>
						<th>메뉴 이미지</th>
							<td>
								<span id="img"></span>
								<form method="POST" enctype="multipart/form-data" id="fileUpload"><br>
									<input type="file" name="file" id="file"/><br>
									<input type="button" value="사진 사용" id="submit"/>
								</form>
							</td>
						</tr>
						<tr>
							<th>메뉴상세정보</th>
							<td><textarea rows="10" cols="60" id="editor" name="menu_detail"></textarea></td>
						</tr>
	
					</tbody>
				</table>
					<input type="submit"  value="추가" class="btn btn-primary">
					<input type="button" onclick="location.href='menu_list?client_no=${client.client_no }'" value="취소" class="btn btn-primary">		
			</form:form>
								
			</div>
		</div>
	
	<!-- Footer -->
 	<%@ include file="../form_client/footer.jsp" %>

</body>
</html>