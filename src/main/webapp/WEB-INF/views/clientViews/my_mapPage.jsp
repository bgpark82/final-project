<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오시는길 페이지</title>

<!-- 드롭다운 -->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.6.2/css/font-awesome.min.css">
<link rel="stylesheet"type="text/css" href="${pageContext.request.contextPath}/resources/css/dropdown.css">

<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">

<!-- Custom fonts for this template -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">

<!-- Plugin CSS 팝업창 숨기는-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.css">

<!-- Custom styles for this template -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/freelancer.min.css">

<!-- 사이드 메뉴바 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sidemenubar.css">

</head>
<body>

	<!-- Navigation -->
	<%@ include file="../form_client/header.jsp" %>

	
	
	<!-- 지도나오는 부분 -->
	<div  style="margin-top:200px; margin-bottom: 804px;">
		<div class="row justify-content-center">
			<div>
				<img class="img-fluid mb-5 d-block mx-auto" src="${pageContext.request.contextPath}/resources/img/오시는길.png" alt="">
				<h2 class="text-center text-uppercase text-secondary mb-0">오시는길</h2>
			</div>
		</div>
		
		<br>
		
		<div class="row justify-content-center">	
			<div>
				<div style="height:400px; width:400px;" id="map"></div>
			</div>	
		</div>
	</div>

	
	<!-- Footer -->
	<%@ include file="../form_client/footer.jsp" %>
	
 	<!-- 지도api -->
	<script>
	function initMap() {
		var map;
		var myLatLng = {lat: 37.500653, lng: 127.034143};
	    map = new google.maps.Map(document.getElementById('map'), {
		    center: myLatLng,
 		    zoom: 17
 		  });
	    
	    var marker = new google.maps.Marker({
	        position: myLatLng,
	        map: map,
	        title: 'Hello World!'
	      });
	}
	
	</script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBZJabmz4nl1CgHEFdKOc_KqapQt7N1m-s&callback=initMap" async defer></script>

</body>
</html>