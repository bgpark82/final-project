<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
   function idChk() {
      var doc = document.getElementsByName("member_id")[0];
      var role = document.getElementById("role").value;
      if (doc.value.trim() == "" || doc.value == null) {
         alert("아이디를 입력하세요.");
      } else {
         var target = "../register/" + role + "/idchk?member_id="
               + doc.value.trim();
         open(target, "아이디 중복 확인", "width=500,height=500");
      }
   }

   function idChkConfirm() {
      var chk = document.getElementsByName("member_id")[0].title;
      if (chk == "n") {
         alert("아이디 중복 체크를 해주세요.")
         document.getElementsByName("member_id")[0].focus();
      }
   }
</script>
<script
   src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
   <div class="container">
      <div class="row">

   <div class="col-md-2"></div>

   <div class="col-md-8">
         <br><br><h1 style="text-align:center">사용자 회원가입</h1><br><br><br>

         <form:form action="../registerConfirm" method="post"
            modelAttribute="dto">
            <input type="hidden" id="role" value="${member_role }" />
            <form:hidden path="member_role" />
            <table class="table">
               <tr>
               <th>프로필사진</th>
               <td>
               <form class="md-form">
  <div class="file-field">
    <div class="btn btn-primary btn-sm float-left">
      <span>Choose file</span>
      <input type="file">
    </div>
    <div class="file-path-wrapper">
      <input class="file-path validate" type="text" placeholder="Upload your file">
    </div>
  </div>
</form>
               </td>
               </tr>
               <tr>
                  <th>아이디</th>
                  <td><form:input type="text" path="member_id" title="n" required="required" /> 
                     <input class="btn btn-default btn-sm"  type="button" value="중복체크"    onclick="idChk();" />
                  </td>
               </tr>
               <tr>
                  <th>비밀번호</th>
                  <td><form:input type="text" path="member_password"
                        required="required" /> <form:errors path="member_password"></form:errors>
                  </td>
               </tr>
               <tr>
                  <th>이름</th>
                  <td><form:input type="text" path="member_name"
                        onclick="idChkConfirm();" required="required" /></td>
               </tr>
               <tr>
                  <th>닉네임</th>
                  <td><form:input type="text" path="member_nickname"
                        onclick="idChkConfirm();" /></td>
               </tr>
               <tr>
                  <th>반</th>
                  <td><form:input type="text" path="member_class"
                        onclick="idChkConfirm();" required="required" /></td>
               </tr>
               <tr>
                  <th>전화번호</th>
                  <td><form:input type="text" path="member_phone"
                        onclick="idChkConfirm();" required="required" /></td>
               </tr>
               <tr>
                  <th>이메일</th>
                  <td><form:input type="email" path="member_email" onclick="idChkConfirm();" required="required" /></td>
               </tr>
            </table>
            
            <div style="float: right;">
               <input  class="btn btn-primary btn-sm" type="submit" value="회원가입"> 
               <input class="btn btn-primary btn-sm" type="button" value="가입취소">
            </div>
               
         </form:form>
    </div>
    
     <div class="col-md-2"></div>
      </div>
   </div>
</body>
</html>