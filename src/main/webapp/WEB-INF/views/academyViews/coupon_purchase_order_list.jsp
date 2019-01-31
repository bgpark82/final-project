<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<br>
	<h1>구매 요청 내역</h1>
	<c:choose>
		<c:when test="${empty coupon_purchase_order_list}">
			<h3> ---- 구매 요청 내역이 없습니다. ---- </h3>
		</c:when>
		
		<c:otherwise>
			<table>
				<tr>
				<td>제휴업체 번호<td>제휴업체 <td>메뉴 번호 <td>메뉴 <td>메뉴 가격 <td>수량 <td>비용
				</tr>
				<c:forEach var="coupon_purchase_Dto" items="${coupon_purchase_order_list }">
					<tr>
						<td>${coupon_purchase_Dto.client_no }</td>
						<td>${coupon_purchase_Dto.client_name }</td>
						<td>${coupon_purchase_Dto.menu_no} </td>
						<td>${coupon_purchase_Dto.menu_title }</td>
						<td>${coupon_purchase_Dto.menu_price }</td>
						<td>${coupon_purchase_Dto.coupon_count }</td>
						<td>${coupon_purchase_Dto.total_amount }</td>
						
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>