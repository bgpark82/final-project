<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function getMenu_detail(){
		var menu_info = $("#menu_info").val().split(",");
		$("#menu_price").val(menu_info[3]);	
	}
	
	function menu_check(){
		if(!$.isNumeric($("#menu_price").val())){
			alert("메뉴를 골라주세요!");
			$("#menu_no").focus();
			$("#coupon_history_quantity").val("--선택--");
		}else{
			setTotal_cost();
		}
	}
	
	function setTotal_cost(){
		var menu_price = $("#menu_price").val();
		var coupon_history_quantity = $("#coupon_history_quantity").val();
		$("#coupon_history_cost").val(menu_price * coupon_history_quantity);
	}
	
	function coupon_purchase_order(){
		//유저 번
		var member_no = 100;
		var member_name = "회계팀_장세훈";
		var menu_info = $("#menu_info").val().split(",");
		var client_no = menu_info[0];
		var client_name = menu_info[1];
		var menu_no = menu_info[2];
		var coupon_history_quantity = $("#coupon_history_quantity").val();
		var coupon_history_cost = $("#coupon_history_cost").val();
		
		//alert("member_no="+member_no+"&client_no="+client_no+"&menu_no="+menu_no+"&member_name="+member_name+"&client_name="+client_name+"&coupon_history_quantity="+coupon_history_quantity+"&coupon_history_cost="+coupon_history_cost);
		location.href="../academy/coupon_purchase_order?member_no="+member_no+"&client_no="+client_no+"&menu_no="+menu_no+"&member_name="+member_name+"&client_name="+client_name+"&coupon_history_quantity="+coupon_history_quantity+"&coupon_history_cost="+coupon_history_cost;
	}
</script>
</head>
<body>
<h2>쿠폰 구매 요청</h2>
	<form method="post" action="">
		<table>
			<tr>
				<td>제휴업체</td><td></td>
			</tr>
			<tr>
				<td>메뉴</td>
				<td>
					<select id="menu_info" onchange="getMenu_detail();">
						<option>--선택--</option>
						<c:forEach var="menuDto" items="${menu_list }">
							<option value="${menuDto.client_no},${menuDto.client_name },${menuDto.menu_no },${ menuDto.menu_price}">${menuDto.menu_title }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>가격</td> <td><input type="text" id="menu_price" readonly="readonly"/></td>
			</tr>
			<tr>
				<td>수량</td> 
				<td>
					<select id="coupon_history_quantity" onchange="menu_check();">
						<option>--선택--</option>
						<option value="100">100</option>
						<option value="200">200</option>
						<option value="300">300</option>
						<option value="500">500</option>
						<option value="1000">1000</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>총액</td> <td><input type="text" id="coupon_history_cost" readonly="readonly" name="total_cost" /></td>
			</tr>
		</table>
		
		<input type="button" value="구매" onclick="coupon_purchase_order();">
	</form>
</body>
</html>