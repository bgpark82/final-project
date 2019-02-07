<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%   request.setCharacterEncoding("UTF-8"); %>
<%   response.setContentType("text/html; charset=UTF-8");%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="css/register.css">
</head>
<body>

<!-- header -->


   <div class="container-fluid row" style="margin-bottom: 10%;">

      <br>
      <h1 style="text-align: center;">회 원 가 입</h1>
      <br>
      <hr>
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" align="center">
         <div class="col-md-2"></div>


         <div class="container col-md-3" style="margin-top: 5%">


   
   <a href="../home/register/user"><img class="image" src="${pageContext.request.contextPath}/resources/img/student_boy.png" style="cursor: pointer;" height="300px;"></a>
            <div class="overlay"
               onclick="location.href='../home/register/user'" style="cursor: pointer;">
               <div class="text">
                  <strong>사용자</strong>
               </div>
            </div>
         </div>

         <div class="col-md-2"></div>

         <div class="container col-md-3" style="margin-top: 5%">

   <a href="../home/register/client"><img class="image" src="${pageContext.request.contextPath}/resources/img/store.png" style="cursor: pointer;" height="300px;"></a>
            <div class="overlay"
               onclick="location.href='../home/register/client'"
               style="cursor: pointer;">
               <div class="text">
                  <strong>제휴업체</strong>
               </div>
            </div>
         </div>



         <div class="col-md-2"></div>
      </div>


   </div>


   <!-- footer -->
</body>
</html>
