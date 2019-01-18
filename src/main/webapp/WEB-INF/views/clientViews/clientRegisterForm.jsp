<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

function idChk(){
	var doc = document.getElementsByName("member_id")[0];
	if(doc.value.trim()==""||doc.value==null){
		alert("아이디를 입력하세요.");
	}else{
		var target = "../user/idchk?member_id="+doc.value.trim();
		open(target,"아이디 중복 확인","width=500,height=500");
	}
}

function idChkConfirm(){
	var chk = document.getElementsByName("member_id")[0].title;
	if(chk=="n"){
		alert("아이디 중복 체크를 해주세요.")
		document.getElementsByName("member_id")[0].focus();
	}
}


</script>


</head>
<body>

<h1>제휴업체 회원가입</h1>

	<form action="../user/register" method="post">
	<input type="hidden" name="member_role" value="ROLE_CLIENT">
		<table>
			<tr>
				<th>프로필 사진</th>
				<td>
					이미지를 업로드 하세요.<input type="file" name="member_profile">
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="member_id" title="n" required="required">
					<input type="button" value="중복체크" onclick="idChk();">
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="text" name="member_password" required="required">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="member_name" onclick="idChkConfirm();" required="required">
				</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>
					<input type="text" name="member_nickname" onclick="idChkConfirm();">
				</td>
			</tr>

			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" name="member_phone" onclick="idChkConfirm();" required="required">
				</td>	
			</tr>		
			<tr>
				<th>이메일</th>
				<td>
					<input type="email" name="member_email" onclick="idChkConfirm();" required="required">
				</td>
			</tr>			
			<tr>
				<td colspan="2">
					<input type="submit" value="회원가입">
					<input type="button" value="가입취소">
				</td>
			</tr>
			
		</table>
	
	</form>


</body>
</html>