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

	<security:authorize access="isAuthenticated()">
		<security:authentication property="principal.username"/>님 반갑습니다.
		
		<form:form action="${pageContext.request.contextPath }/logout" method="POST">
			<input type="submit" value="로그아웃">
		</form:form>
		
		<%-- <security:authorize access="${pageContext.request.contextPath}/list">리스트</security:authorize> --%>
	</security:authorize>

</body>
</html>