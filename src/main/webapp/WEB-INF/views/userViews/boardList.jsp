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

<meta charset="EUC-KR">
<title>��������</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){

	$("#category_btn").on("click", function(){
		category();
	});

	function category() {
		
		var selectBox_val = $("#category option:selected").val();
		
		var selectBox_text = $("#category option:selected").text();
		
		//alert("value ��: " + selectBox_val + " /////// " + "text ��:"+selectBox_text); 
		
		if(selectBox_val == 'all'){
			alert("value ��: " + selectBox_val + " /////// " + "text ��:"+selectBox_text); 
			location.href="  ";
		
		}else if(selectBox_val == '7Gram'){
			
		}else if(selectBox_val == 'mcbar'){
			
		}else if(selectBox_val == 'magicbar'){
		}
	}
});
</script>
<meta charset="EUC-KR">
<title>Ŀ��Ƽ�� �ȿ� �ִ� �л����� ���� ��������</title>
</head>
<body>

	<!-- �ۼ���: ��ܺ�
		�ۼ� ��¥: 16JAN19
		���: ���޾�ü ������ �ۼ��� ���������� �л����� �� �� �ִ� ������
		����ϴ� DB ���̺� : board / member
		�ΰ����� : board ���̺��� �������� �Խ��� ������ �������� , member���� �ۼ��� ��(���޾�ü �̸�)�� �����´�.  ���ϰ��� LIST�̴�.  -->
${user.member_name }�� ȯ���մϴ�.<br>
	<h1>��������</h1>
	
	<jsp:useBean id="dto" class="kh.coupon.mvc.dto.BoardDto" scope="request"></jsp:useBean>
	
	
		<select class="selectBox" id="category" name="category">
			<option value="all" selected="selected">--��ü����--</option>
			<option value="7Gram">7Gram</option>
			<option value="mcbar">����â��</option>
			<option value="magicbar">�������</option>
		</select>
		<button id="category_btn">��ȸ</button>

	
	<table border="1">
		<col width="50"> <!-- board_no -->
		<col width="100"> <!-- user_name -->
		<col width="500"> <!-- boardt_title -->
		<col width="300"> <!-- board_date_create -->
		<col width="100"> <!-- board_category-->
		<col width="70"> <!-- board_count -->
		
		<tr>
			<th>��ȣ</th>
			<th>���޾�ü</th>
			<th>����</th>
			<th>�ۼ���</th>
			<th>��ȸ��</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="6"> --- �ۼ��� ���������� �����ϴ�. --- </td>				
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="dto" items="${list }">
					<tr align="center">
						<td>${dto.board_no}</td>
						<td>${dto.client_no}</td>
						<td><a href="board_detail?board_no=${dto.board_no}"> ${dto.board_title}</a></td>
						<td><fmt:formatDate value="${dto.board_date_create}" pattern="yyyy�� MM�� dd��"></fmt:formatDate></td>
						<td>${dto.board_count}</td>
					</tr>								
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<hr>
	<input type="button" value="������������" class="btn btn-default" onclick="location.href='../home/main'"/>

	
</body>
</html>