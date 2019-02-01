<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제휴업체 조회 페이지</title>
</head>
<body>

   <h1>제휴업체 리스트</h1>
   
   <form action="registform">
   <table border="1">
      <tr>
         <th>이름</th>
         <th>ID</th>
         <th>PASSWORD</th>
      </tr>
      <c:choose>
         <c:when test="${empty list }">
            <tr>
               <td>-------고객 정보가 없습니다-------</td>
            </tr>
         </c:when>
         <c:otherwise>
            <c:forEach items="${list }" var="dto">
               <tr>
                  <td>${dto.member_name }</td>
                  <td>${dto.member_id }</td>
                  <td>${dto.member_password }</td>
               </tr>
            </c:forEach>
         </c:otherwise>
      </c:choose>
   </table>
   <hr>
   <input type="button" value="처음으로" onclick="location.href='#'"/>
   <input type="submit" value="회원가입"/>
   </form>
</body>
</html>