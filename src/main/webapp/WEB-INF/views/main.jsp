<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<%	response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="./form/header.jsp" %>

	<security:authorize access="hasRole('USER')">
		<a href="../user/client_list">제휴업체 리스트</a>
		<a href="../user/my_coupon_list?member_no=${user.member_no }">내 쿠폰함</a>
		<a href="../user/mypage?member_no=${user.member_no }">마이페이지</a>
		<a href="../user/notice_list">공지사항</a>
	</security:authorize>
	
	
	<security:authorize access="hasRole('CLIENT')">
		<a href="../client/clientMain">클라이언트 메인페이지</a>
	</security:authorize>
	
	
	<security:authorize access="hasRole('ACCOUNT')">
		<a href="${pageContext.request.contextPath }/academy/coupon_stock">회계팀 로그인</a>
	</security:authorize>
	
	<security:authorize access="hasRole('PROMOTION')">
		<a href="${pageContext.request.contextPath }/academy/client_list">홍보팀 로그인</a>
	</security:authorize>
	
	<security:authorize access="hasRole('OPERATION')">
		<a href="${pageContext.request.contextPath }/academy/coupon_sale_page">운영팀 로그인</a>
	</security:authorize>
	
	
	<%-- <%@ include file="./form/footer.jsp" %> --%>
</body>
</html>