<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

/* Ķ���� */ 
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
<title>����������</title>
</head>
<body>
	<div class="container">
	
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				<b>�� ���� </b><small> �ڽ��� ������ Ȯ���ϼ���</small>
			</h1>
		</div>
		<input type="button" value="���� ���⳻��" class="btn btn-default" onclick="expense();" />
		<input type="button" value="��������" class="btn btn-default" onclick="location.href='../home/main'"/> 
	</div>
	</div>
	

</body>
</html>