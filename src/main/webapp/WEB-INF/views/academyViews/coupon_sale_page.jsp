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

	<h1>쿠폰 판매</h1> |
	<a href="../academy/sales_history">판매 내역</a> | 
	<a href="../academy/">구매 요청 내역(제휴업체) - 구현안됨</a>
	
	<c:choose>
		<c:when test="${empty coupon_stockList}">
			<h3> ---- 재고가 없습니다. ---- </h3>
		</c:when>
		
		<c:otherwise>
			<table>
				<tr>
				<td>제휴업체 <td>메뉴 <td>가격 <td>수량 <td>
				</tr>
				<c:forEach var="coupon" items="${coupon_stockList }">
					<tr>
						<td>${coupon.client_name }</td>
						<td>${coupon.menu_title }</td>
						<td>${coupon.menu_price} </td>
						<td>${coupon.coupon_count }</td>
						<td><input type="button" value="판매" onclick="location.href='../academy/coupon_sale?member_no=${user.member_no }&client_no=${coupon.client_no}&menu_no=${coupon.menu_no }'"></td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	<table>
		
	</table>

</body>
</html>