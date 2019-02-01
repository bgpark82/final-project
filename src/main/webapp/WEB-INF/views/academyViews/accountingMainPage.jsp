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
	<h1>재무팀</h1>
	<a href="../academy/coupon_stock">재고 내역</a> | 
	<a href="../academy/purchase_history">구매 내역</a> | 
	<a href="../academy/sales_history">판매 내역</a> | 
	<a href="../academy/coupon_purchase_order_list">구매 요청 내역(학원)</a> |	
	<a href="../academy/">구매 요청 내역(제휴업체) - 구현안됨</a>
	<a href="../academy/menuPage">제휴업체 별 메뉴</a> |
	<a href="../academy/purchase_statistics_page">업체별 쿠폰 구매 통계</a> |
	<a href="../academy/sale_statistics_page">업체별 쿠폰 판매 통계</a><br/>
	
	<h1>홍보팀</h1>
	<a href="../academy/client_list">제휴업체 목록</a> |
	<a href="../academy/client_registration_list">제휴업체 신청 목록</a> |
	<a href="../academy/purchase_statistics_page">업체별 쿠폰 구매 통계</a> |
	<a href="../academy/sale_statistics_page">업체별 쿠폰 판매 통계</a><br/>
	
	<h1>운영팀</h1>
	<a href="../academy/coupon_sale_page">쿠폰 판매</a> |
	<a href="../academy/sales_history">판매 내역</a> |	
	<a href="../academy/coupon_stock">재고 내역</a> 
	<a href="../academy/purchase_statistics_page">업체별 쿠폰 구매 통계</a> |
	<a href="../academy/sale_statistics_page">업체별 쿠폰 판매 통계</a><br/>
	
	
	
	<h1>쿠폰 재고</h1>
	<c:choose>
		<c:when test="${empty coupon_stockList}">
			<h3> ---- 재고가 없습니다. ---- </h3>
		</c:when>
		
		<c:otherwise>
			<table>
				<tr>
				<td>제휴업체 <td>메뉴 <td>가격 <td>수량
				</tr>
				<c:forEach var="coupon" items="${coupon_stockList }">
					<tr>
						<td>${coupon.client_name }</td>
						<td>${coupon.menu_title }</td>
						<td>${coupon.menu_price} </td>
						<td>${coupon.coupon_count }</td>
						<!-- member_no는 사용자 검색을 통해 값을 가져와서 보내주도록 바꾸자. -->
<%-- 						<td><input type="button" value="구매" onclick="a href='../academy/coupon_purchase_form?member_no=100&client_no=${coupon.client_no}&menu_no=${coupon.menu_no }&client_name=${coupon.client_name }'"></td> --%>
					
						
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
	<table>
		
	</table>

</body>
</html>