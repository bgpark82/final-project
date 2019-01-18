<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

onload=function(){
	var id = opener.document.getElementsByName("member_id")[0].value;
	document.getElementsByName("member_id")[0].value = id;
}

function confirm(bool){
	if(bool=="true"){
		opener.document.getElementsByName("member_password")[0].focus();
		opener.document.getElementsByName("member_id")[0].title = "y";
	}else{
		opener.document.getElementsByName("member_id")[0].focus();
	}
	self.close();
}


</script>

</head>
<body>

	<table>
		<tr>
			<td>
				<input type="text" name="member_id">
			</td>
		</tr>
		<tr>
			<td>
				<c:out value="${idNotUsed == 'true'?'아이디 생성 가능':'중복 아이디 존재' }"/>
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="확인" onclick="confirm('${idNotUsed}')">
			</td>
		</tr>
	
	</table>

</body>
</html>