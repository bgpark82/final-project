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
	<a href="../academy/coupon_stock">재고 내역</a> | 
	<a href="../academy/purchase_history">구매 내역</a> | 
	<a href="../academy/sales_history">판매 내역</a>
	<br>
	<h1>${coupon_history[0].coupon_history_info } 내역</h1>
	<c:choose>
		<c:when test="${empty coupon_history}">
			<h3> ---- ${coupon_history[0].coupon_history_info }내역이 없습니다. ---- </h3>
		</c:when>
		
		<c:otherwise>
			<table>
				<tr>
				<td>번호 <td>member_no <td>이름 <td>제휴업체 번호 <td>제휴업체 <td>메뉴번호 <td>메뉴 <td>수량 <td>비용 <td>거래 일시
				</tr>
				<c:forEach var="coupon_history" items="${coupon_history }">
					<tr>
						<td>${coupon_history.coupon_history_no }</td>
						<td>${coupon_history.member_no }</td>
						<td>${coupon_history.member_name} </td>
						<td>${coupon_history.client_no }</td>
						<td>${coupon_history.client_name }</td>
						<td>${coupon_history.menu_no }</td>
						<td>${coupon_history.menu_title }</td>
						<td>${coupon_history.coupon_history_quantity }</td>
						<td>${coupon_history.coupon_history_cost }</td>
						<td>${coupon_history.coupon_history_date }</td>
						<td>${coupon_history.coupon_history_info }</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	<table>
		
	</table>

</body>
</html>