<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<%	response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���޾�ü ���</title>
</head>
<body>

	<c:choose>
		<c:when test="${empty client_list}">
		 	--- ��ϵ� ���޾�ü�� �����ϴ� ---
		</c:when>
		<c:otherwise>
			<c:forEach items="${client_list }" var="client_dto">
				<a href="../user/coupon_list?client_no=${client_dto.client_no }">${client_dto.client_name }</a><br>
			</c:forEach>		
		</c:otherwise>
	</c:choose>


</body>
</html>