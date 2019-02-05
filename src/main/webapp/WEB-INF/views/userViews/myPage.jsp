<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

/* 캘린더 */ 
function expense() {
	var my_date = new Date();
	var year = my_date.getFullYear();
	var month = my_date.getMonth()+1;
	//$("#test").html(my_date.getFullYear());
	//$("#test").html(my_date.getMonth()+1);
	location.href="expense?member_no="+${user.member_no}+"&year="+year+"&month="+month;  
}

</script>
<meta charset="EUC-KR">
<title>마이페이지</title>
</head>
<body>
	<div class="container">
	
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				<b>내 정보 </b><small> 자신의 정보를 확인하세요</small>
			</h1>
		</div>
		<input type="button" value="나의 지출내역" class="btn btn-default" onclick="expense();" />
		<input type="button" value="메인으로" class="btn btn-default" onclick="location.href='../home/main'"/> 
	</div>
	</div>
	

</body>
</html>