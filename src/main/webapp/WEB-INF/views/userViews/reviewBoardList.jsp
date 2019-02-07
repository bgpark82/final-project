<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<meta charset="EUC-KR">
<title>�̿��ı� �Խ��� ������</title>
</head>
<body>

<!-- ���̰� �ۼ��� -->
${user.member_name }�� ȯ���մϴ�.<br>
	<h1>�̿��ı� �Խ���</h1>
	
	<table border="1">
		<tr>
			<th>��ȣ</th>
			<th>���޾�ü</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ��</th>
			<th>���ƿ�</th>
		</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="1">-------�ۼ��� ���� �����ϴ�-------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.board_no }</td>
							<td>${dto.board_category }</td>
							<td><a href="review_detail?board_no=${dto.board_no }">${dto.board_title }</a></td>
							<td><fmt:formatDate value="${dto.board_date_create}" pattern="yyyy�� MM�� dd��"></fmt:formatDate></td>
							<td>${dto.board_writer }</td>
							<td>${dto.board_count }</td>
							<td>${dto.board_like_count }</td>					
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	<hr>
	<input type="button" value="������������" class="btn btn-default" onclick="location.href='../home/main'"/>
	<input type="button" value="�ı��ۼ�" class="btn btn-default" onclick="location.href='../user/review_insertform?board_category=${board_category}'"/>
	
</body>
</html>