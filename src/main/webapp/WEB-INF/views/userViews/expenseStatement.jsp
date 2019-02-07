<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Calendar"%>
<% request.setCharacterEncoding("UTF-8");%>
<% response.setContentType("text/html; charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���⳻��</title>

<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style type="text/css">
select {
	width: 80x;
	height: 30px;
	padding-left: 10px;
	font-size: 10px;
	color: gray;
	border: 1px solid gray;
	border-radius: 3px;
}

tr, th {
	text-align: center;
}
</style>

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>

			<div class="col-md-8">
				<br><br><h1 style="text-align: center">���� ���� ���⳻��</h1><br><hr>
				<form action="../user/search_expense" method="get">
					<input type="hidden" name="member_no" value="${user.member_no}" /> 
					
					<select name="year">
						<c:set var="today" value="<%=new java.util.Date()%>" />
						<fmt:formatDate value="${today}" pattern="yyyy" var="start" />
						<option value="">�⵵</option>
						<c:forEach begin="0" end="10" var="idx" step="1">
							<option value="<c:out value="${start - idx}" />">
								<c:out value="${start - idx}" />
							</option>
						</c:forEach>
						
					</select> <select name="month">
						<c:set var="today" value="<%=new java.util.Date()%>" />
						<fmt:formatDate value="${today}" pattern="mm" var="start" />
						<option value="">��</option>
						<c:forEach begin="1" end="12" var="idx" step="1">
							<option value="<c:out value="${idx}" />">
								<c:out value="${idx}" />
							</option>
						</c:forEach>
					</select> 
					
					<input class="btn btn-default btn-sm" type="submit" value="��ȸ" style="color: #202020" /> 
					<input	class="btn btn-default btn-sm" style="float: right" type="button" value="�л�������������" onclick="location.href='../home/main'" />
				</form>


				<!-- table -->
				<div class=��table-responsive�� align="center">
					<table class="table">

						<col width="100">
						<!-- board_no -->
						<col width="100">
						<!-- user_name -->
						<col width="200">
						<!-- boardt_title -->
						<col width="50">
						<!-- board_date_create -->
						<col width="70">
						<!-- board_category-->

						<thead class="thead-light">
							<tr>
								<th>����</th>
								<!--coupon_history_date -->
								<th>���޾�ü</th>
								<!--client_name -->
								<th>�޴���</th>
								<!--menu_title -->
								<th>����</th>
								<!--coupon_history_quantity -->
								<th>����</th>
								<!-- menu_price  -->
							</tr>
						</thead>

						<tbody>
							<c:set var="sum" value="0" />
							<c:choose>
								<c:when test="${empty dto }">
									<tr>
										<td colspan="5"><span
											style="color: #202020; font-size: large;">----- ���� ������
												�����ϴ�. -----</span></td>
									</tr>
								</c:when>
								<c:otherwise>

									<c:forEach var="dto" items="${dto }">
										<tr>

											<td><fmt:formatDate value="${dto.coupon_history_date}"
													pattern="yyyy�� MM�� dd��"></fmt:formatDate></td>
											<td>${dto.client_name}</td>
											<td>${dto.menu_title}</td>
											<td>${dto.coupon_history_quantity}</td>
											<td>${dto.coupon_history_cost}</td>
											<c:set var="sum" value="${sum + dto.coupon_history_cost}" />
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
					<hr>
					<h1 style="text-align: center" id="test">
						�̹� ���� �� <span style="color: #BE0000">${sum}��</span>�� �����ϼ̽��ϴ�.
					</h1>

					<div class="col-md-2"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>