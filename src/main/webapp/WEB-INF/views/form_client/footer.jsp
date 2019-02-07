<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>				
<% response.setContentType("text/html; charset=UTF-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">

footer{
    width: 100%;
    background-color: #FAFAFA;
    margin: 5% 5% 8% 5%;
    color: black;
    position:relative;
}

/* .fa{
    padding: 15px;
    font-size: 25px;
    color: black;
}
.fa:hover{
    color:gray;
    text-decoration: none; 
} */
</style>
</head>
<body>

 	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">KH정보교육원</h4>
					<h4 class="text-uppercase mb-2">@(주)세훈팩토리</h4>
				</div>
				<div class="col-md-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">제휴업체 문의</h4>
					<h4 class="text-uppercase mb-4">전화: 010-1234-1234</h4>
					<h4 class="text-uppercase mb-4">주소: 서울특별시 테헤란로 1000-1</h4>
				</div>
				<div style="margin-left: 100px;">
				<input type="button" value="제휴업체문의" onclick="location.href='insertform'" class="btn btn-primary" style="padding: 1rem 1.75rem; font-size: 1.25rem; "/>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>