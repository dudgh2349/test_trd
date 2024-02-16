<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>Kakao 지도</title>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a680cf2656f7fd890d05c581ddd4a360&libraries=services,clusterer,drawing"></script>
<script src="../../resources/js/api.js"></script>
</head>
<body>
<div id="map" style="width:40vw;height:50vh;"></div>
<p>
    <button onclick="setCenter()">지도 중심좌표 이동시키기</button> 
    <button onclick="panTo()">지도 중심좌표 부드럽게 이동시키기</button> 
</p>
<div id="clickLatlng"></div>
</body>
<script>
	
	
</script>
</html>