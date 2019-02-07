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
// ���̰� �ۼ��� ���� �󼼺��� and �����ϱ�, �����ϱ�

$(document).ready(function(){
	
	//�����ϱ� ���â���� ���� �����Ҷ�
    $("#condition").change(function(){
       var condition = $("#condition option:selected").val();
       $("#totalmoney").html("���� : "+$("#menu_price").val() * condition);
    });
    
    //�����ϱ� ���â���� ���� �����Ҷ�
    $("#condition_2").change(function(){
        var condition_2 = $("#condition_2 option:selected").val();
        $("#totalmoney_2").html("���� : "+$("#menu_price").val() * condition_2);
     });
    
});

//�����ϱ� ���â���� ���� �����ϰ� ���� ���������� �����Ҷ�(insertform������)
function coupon_buy(){
	var condition = $("#condition option:selected").val();
	location.href="coupon_buy?member_no=${user.member_no}&client_no=${coupon.client_no }&menu_no=${coupon.menu_no}&member_name=${user.member_name}&coupon_count="+condition;
}

function phone(){
	var member_phone = $("#friend_phone").val();
	var condition_2 = $("#condition_2 option:selected").val();
	location.href="coupon_gift?member_phone="+member_phone+"&member_from_no=${user.member_no}&member_no=${coupon.member_no}&client_no=${coupon.client_no}&menu_no=${coupon.menu_no}&coupon_count="+condition_2;
	
}

</script>
<meta charset="EUC-KR">
<title>���� �󼼺��� ������</title>
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
<input type="hidden" id="menu_price" value="${coupon.menu_price }" />

	<div class="container">

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				<b>���� �����ϱ� </b><small> ������ ������ Ȯ�����ּ���.</small>
			</h1>
		</div>
	</div>
	
	<div class="row">
		<article>			
			<div class="col-md-6" align="right">
				 <img src="${coupon.menu_image }"/>
			</div>			
			<div class="col-md-6" style="padding-top: 20px;">
			<h4>���޾�ü : ${coupon.client_name }</h4>
			<h4>�����̸� : ${coupon.menu_title }</h4>
			<h4>�ܿ� ���� : ${coupon.coupon_count } </h4>
			<h4>���� : 1</h4>
			<h4>���� : ${coupon.menu_price }</h4>
			<br><br>
			<button class="btn btn-default" data-target="#buyModal" data-toggle="modal">�����ϱ�</button>
			<div class="modal fade" id="buyModal" >
				<div class="modal-dialog">
					<div class="modal-content row" >
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">��</button>
							<h3 class="modal-title">���� �� ����</h3>
						</div>
					<div class="modal-body row">
					<div class="col-md-6" align="right">
						<img src="${coupon.menu_image }" />
					</div>
					<div class="col-md-6" style="padding-top: 30px;">
					<h4>
						���޾�ü : ${coupon.client_name }<br><br>
						�����̸� : ${coupon.menu_title }<br><br>
						���� : 
						<select id="condition">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
							<br><br>
						<span id="totalmoney">�ݾ� : ${coupon.menu_price }</span><br><br>
					</h4>
					</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="coupon_buy" onclick="coupon_buy();">�����ϱ�</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
					</div>
					</div>
				</div>
			</div>
			
			<button class="btn btn-default" data-target="#giftModal" data-toggle="modal">�����ϱ�</button>
		
			<div class="modal fade" id="giftModal" >
				<div class="modal-dialog">
					<div class="modal-content row" >
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">��</button>
							<h3 class="modal-title">���� �� ����</h3>
						</div>
					<div class="modal-body row">
					<div class="col-md-6" align="right">
						<img src="${coupon.menu_image }"/>
					</div>
					<div class="col-md-6" style="padding-top: 30px;">
					<h4>
						���޾�ü : ${coupon.client_name }<br><br>
						�����̸� : ${coupon.menu_title }<br><br>
						���� : 
						<select id="condition_2">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
							<option value="6">6</option>
							<option value="7">7</option>
							<option value="8">8</option>
							<option value="9">9</option>
							<option value="10">10</option>
						</select>
							<br><br>
						<span id="totalmoney_2">�ݾ� : ${coupon.menu_price }</span><br><br>
						���� �޴� ��� ��ȣ<br>
						: <input id="friend_phone" type="text" placeholder="ex)01012345678"/><br>
					</h4>
					</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" onclick="phone();">�����ϱ�</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
					</div>
					</div>
				</div>
			</div>
			</div>
			</article>	
			</div>
	</div>
	
	<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">
				<b>�޴� ������ </b><small> ���ϴ� �޴��� ������ �����ϼ���</small>
			</h2>
		</div>
	</div>
	<div class="row">
	<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="6">=====��ϵ� ������ �����ϴ�=====</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="dto">
				<article class="card col-12 col-md-4 col-lg-3">
				<header style="margin-bottom: 5px">
					<strong><span> ${dto.client_name }</span></strong>
				</header>
				<figure>
					<div class="frontpage_square img-rounded" onclick="location.href='coupon_detail?menu_no=${dto.menu_no}&coupon_count=${dto.coupon_count }'" style="cursor: pointer; padding-bottom: 330px;">
						   <img src="${dto.menu_image }"/>	
						   <div class="text">�ܿ� ${dto.coupon_count }</div>   
					</div>
				<aside style="margin-top: 5px">
					<div>
						<div id="${dto.menu_title }" class="col-xs-6" style="padding: 0">${dto.menu_title }</div>
					</div>
					<div class="story-entry_content_title">
						<strong> ���� : ${dto.menu_price } </strong>
					</div>
				</aside>
				</figure>
				</article>
			</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<br><br><br><br>
</body>
</html>