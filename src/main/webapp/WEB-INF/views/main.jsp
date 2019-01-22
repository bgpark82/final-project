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

	${username }
	<security:authorize access="hasRole('USER')">
		<a href="../user/coupone_list">쿠폰 리스트</a>
	</security:authorize>
	
	
	<security:authorize access="hasRole('CLIENT')">
		<a href="../client/menu_list">메뉴 리스트</a>
	</security:authorize>
	
	<%-- <%@ include file="./form/footer.jsp" %> --%>
</body>
</html>