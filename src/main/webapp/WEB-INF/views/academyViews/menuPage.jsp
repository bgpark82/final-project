<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function getMenu_list(){
		var client_no = $("#client_no").val();
			$.ajax({
				type:"post",
				url:"../academy/menu_list",
				data:"client_no="+client_no,

				beforeSend : function(xhr)
                {   
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
				success:function(data){
					$("tbody").empty();
					values = data.menu_list; //java에서 정의한 ArrayList명을 적어준다.
	                $.each(values, function(index, value) {
	                	$("#cleint_no").append("<option value='"+value.client_no+"'>");
	                	$("tbody").append(
							"<tr>"+
								"<td>"+value.client_name+"</td>"+
								"<td>"+value.menu_title+"</td>"+
								"<td>"+value.menu_price+"</td>"+
							"</tr>"
						);
	                });
					$("tbody").append("<input type='button' value='구매' onclick=location.href='../academy/coupon_purchase_form?client_no="+client_no+"'>");
				}, error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
	
</script>
</head>
<body>
<h2>제휴업체 별 메뉴</h2>
제휴업체를 선택해주세요.
	<select id="client_no" onchange="getMenu_list();">
		<option>--선택--</option>
		<c:forEach var="client_Dto" items="${client_list }">
		<option value="${client_Dto.client_no }">${client_Dto.client_name }</option>
		</c:forEach>
	</select>
	
	<div id="test"></div>
	
	
	<table id="tableTest">
		<thead>
			<tr>
				<th>제휴업체</th><th>메뉴</th> <th>가격</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>

</body>
</html>