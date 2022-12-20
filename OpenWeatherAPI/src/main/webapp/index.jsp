<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OpenWeather</title>
<link href="./style.css" rel="stylesheet" type="text/css">
</head>
<body>
 	<main>
 	<!-- Asks for a city and country. -->
	<form id="questionForm" action="OWservlet" method="get">
		<input id="textBox" type="text" name="city" placeholder="City"/><br /> 
		<input id="textBox" type="text" name="country" placeholder="Country"/><br />
		<input class="buttons" type="submit" value="go" />
	</form>
	</main>
	
	<!-- Adds a pop-up asking if user want to save cookies -->
	<jsp:include page="/cookieQuestion.jsp"></jsp:include>
	
</body>
</html>