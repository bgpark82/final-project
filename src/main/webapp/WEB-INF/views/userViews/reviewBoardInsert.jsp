<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	  
    $("#condition").change(function(){      
       var condition = $("#condition option:selected").val();
       location.href="review_insert?condition="+condition;   
    });
    
});

</script>
<meta charset="EUC-KR">
<title>후기 작성 페이지</title>
</head>
<body>
	${regist_dto.member_name }님 환영합니다.
	<h1>후기 작성 페이지</h1>
	<form action="review_insert" method="post">
	<table border="1">
		<tr>
			<th>작성자</th>
			<td><input type="text" value="${regist_dto.member_name }" name="review_writer" readonly="readonly"/></td>
		</tr>
		<tr>
			<th>구분</th>
			<td>
				<select id="condition">
					<option value="전체" <c:if test="${Name eq '전체'}">selected</c:if>>전체</option>
					<option value="7Gram" <c:if test="${param.condition=='7Gram'}">selected</c:if>>7Gram</option>
					<option value="맥주창고" <c:if test="${param.condition=='맥주창고'}">selected</c:if>>맥주창고</option>
					<option value="요술포차" <c:if test="${param.condition=='요술포차'}">selected</c:if>>요술포차</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="review_title"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="10" cols="60" name="review_content"></textarea></td>
		</tr>
	</table>
	<hr>
	<input type="button" value="취소" onclick="location.href='review_insertform'"/>
	<input type="submit" value="후기등록"/>
	</form>
</body>
</html>