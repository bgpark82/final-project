<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<%	response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<meta charset="UTF-8">
<title>${client.client_name } 쿠폰목록 페이지</title>
<style type="text/css">
.card{
   padding: 32px 10px 0 10px;
}

.frontpage_square{
   position:relative;
   overflow:hidden;
   padding-bottom:90%;
}

.frontpage_square img{
   position:absolute;
    -webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.3s;
    overflow: hidden;
}

.frontpage_square:hover img{
    -webkit-transform:scale(1.1);
    -moz-transform:scale(1.1);
    -ms-transform:scale(1.1);   
    -o-transform:scale(1.1);
    transform:scale(1.1);
}

.text {
  color: #f2f2f2;
  font-size: 13px;
  padding: 8px 8px;
  position: absolute;
  bottom: 0;
  width: 100%;
  text-align: right;
}

</style>
<script type="text/javascript">
// 민이가 작성한 학생이 쿠폰 볼수있는 페이지(누르면 구매하는 창으로 이동)

$(document).ready(function(){
    $("span.glyphicon").on({   
        click: function(){
            $(this).css("color", "#C9233B");
        }
    });
});

</script>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">
				<b>${client_dto.client_name } 쿠폰목록 </b><small> 원하는 메뉴의 쿠폰을 구매하세요!</small> 
				<button class="btn btn-default" onclick="location.href='../user/review_board_list?board_category=${client_dto.client_name}'">이용후기</button>
				<button class="btn btn-default" onclick="location.href='../home/main'">메인으로</button>
			</h1>
		</div>
	</div>

	<div class="row">
	<c:choose>
		<c:when test="${empty list }">
			<tr>
				<td colspan="6">=====등록된 쿠폰이 없습니다=====</td>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list }" var="menu_dto">
				<article class="card col-12 col-md-4 col-lg-3">
				<header style="margin-bottom: 5px">
					<strong><span> ${menu_dto.client_name }</span></strong>
				</header>
				<figure>
					<div class="frontpage_square img-rounded" onclick="location.href='coupon_detail?client_no=${client_dto.client_no }&menu_no=${menu_dto.menu_no}'" style="cursor: pointer; padding-bottom: 330px;">
						  <img src="${menu_dto.menu_image }"/>
						  <div class="text">잔여 ${menu_dto.coupon_count }</div>
					</div>
				<aside style="margin-top: 5px">
					<div>
						<div id="${menu_dto.menu_title }" class="col-xs-6" style="padding: 0">${menu_dto.menu_title }</div>
					</div>
					<div class="story-entry_content_title">
						<strong> 가격 : ${menu_dto.menu_price } </strong>
					</div>
				</aside>
				</figure>
				</article>
			</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<br><br><br><br>


</body>
</html>