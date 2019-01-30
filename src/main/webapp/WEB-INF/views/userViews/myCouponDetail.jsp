<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
// 민이가 작성한 쿠폰 사용하기

$(document).ready(function(){
	
	var coupon_count = $("#coupon_count").val();
	
	for(var i=1; i<=coupon_count; i++){
		$("#condition").append("<option value='"+i+"'>"+i+"</option>");
	}
});

//구매하기 모달창에서 수량 선택하고 이제 최종적으로 결제할때(insertform같은것)
function coupon_buy(){
	var condition = $("#condition option:selected").val();
	location.href="coupon_buy?member_no=${user.member_no}&client_no=${coupon.client_no }&menu_no=${coupon.menu_no}&coupon_count="+condition;
}

function coupon_use(num){
	//var use_num = $("#button").click().val();
	var client_password = $("#client_password").val();
	$("#client_password").val(client_password + "" +num);
}

function coupon_delete(){
	var client_password = $("#client_password").val();
	$("#client_password").val(client_password.slice(0,-1));
}

function coupon_use_input(){
	var paycode = $("#client_password").val();
	var condition = $("#condition option:selected").val();
	location.href="code_correct?member_no=${user.member_no}&client_no=${my_coupon.client_no}&menu_no=${my_coupon.menu_no}&paycode="+paycode+"&coupon_count="+condition;
}



</script>
<meta charset="EUC-KR">
<title>쿠폰 사용 페이지</title>
<style type="text/css">

.card{
   padding: 32px 10px 0 10px;
}

.frontpage_square{
   position:relative;
   overflow:hidden;
   padding-bottom:90%;
}

.frontpage_square img{
   position:absolute;
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
    overflow: hidden;
}

.frontpage_square:hover img{
    -webkit-transform:scale(1.1);
    -moz-transform:scale(1.1);
    -ms-transform:scale(1.1);   
    -o-transform:scale(1.1);
    transform:scale(1.1);
}

.text {
  color: #f2f2f2;
  font-size: 13px;
  padding: 8px 8px;
  position: absolute;
  bottom: 0;
  width: 100%;
  text-align: right;
}


</style>
</head>
<body>
<input type="hidden" id="coupon_count" value="${my_coupon.coupon_count}"/>
	<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				<b>쿠폰 사용하기 </b><small> 사용할 쿠폰의 수량을 선택해주세요.</small>
			</h1>
		</div>
	</div>
	
	<div class="row">
		<article>			
			<div class="col-md-6" align="right">
				 <img src="${my_coupon.menu_image }"/>
			</div>			
			<div class="col-md-6" style="padding-top: 20px;">
			<h4>제휴업체 : ${my_coupon.client_name }</h4>
			<h4>쿠폰이름 : ${my_coupon.menu_title }</h4>
			<h4>수량 : 
				<select id="condition">

				</select>
			</h4>
		
			<br><br>
			<button class="btn btn-default" data-target="#buyModal" data-toggle="modal">사용하기</button>
			<div class="modal fade" id="buyModal" >
				<div class="modal-dialog">
					<div class="modal-content row" >
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">×</button>
							<h3 class="modal-title">직원에게 화면을 보여주세요!</h3>
						</div>
					<div class="modal-body row" align="center">				
						<input type="text" id="client_password" placeholder="제휴업체 결제번호"/><br><br>
						<input type="button" id="button7" value="7" class="btn btn-default" onclick="coupon_use(this.value);"/>
						<input type="button" id="button8" value="8" class="btn btn-default" onclick="coupon_use(this.value);"/>
						<input type="button" id="button9" value="9" class="btn btn-default" onclick="coupon_use(this.value);"/><br>
						<input type="button" id="button4" value="4" class="btn btn-default" onclick="coupon_use(this.value);"/>
						<input type="button" id="button5" value="5" class="btn btn-default" onclick="coupon_use(this.value);"/>
						<input type="button" id="button6" value="6" class="btn btn-default" onclick="coupon_use(this.value);"/><br>
						<input type="button" id="button1" value="1" class="btn btn-default" onclick="coupon_use(this.value);"/>
						<input type="button" id="button2" value="2" class="btn btn-default" onclick="coupon_use(this.value);"/>
						<input type="button" id="button3" value="3" class="btn btn-default" onclick="coupon_use(this.value);"/><br>
						<input type="button" id="button0" value="0" class="btn btn-default" onclick="coupon_use(this.value);"/>
						<input type="button" id="button_delete" value="지우기" class="btn btn-default" onclick="coupon_delete();"/>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="coupon_buy" onclick="coupon_use_input();">사용하기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
					</div>
					</div>
				</div>
			</div>
			
			</div>
			</article>
			</div>
			</div>
<br><br><br><br>
</body>
</html>