<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.net.CookieStore"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="model.weatherBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>the weather</title>
<link href="./style.css" rel="stylesheet" type="text/css">

</head>
<body>
<main>
	<article>
	<%
	//Gets cookies and bean.
	weatherBean wBean = (weatherBean) request.getAttribute("wBean");
	Cookie cookies[] = request.getCookies();
	%>
	<!-- Prints weather update -->
	<h3>The Clouds in <%=wBean.getCityStr()%> is now <%=wBean.getCloudsStr()%> blowing <%=wBean.getWindDirectionStr()%></h3>
	<p class="date">The date is <%=wBean.getDateStr()%></p>
	</article>
	<article><%
		//Prints cookies as buttons. When pressed forwards to saved country/city in cookie.
		for (int i = 0; i < cookies.length; i++){
			if(!cookies[i].getName().equals("JSESSIONID")){%>				
				<form action="OWservlet" method="get">
				<input type="hidden" name="city" value="<%=cookies[i].getName() %>"/>
				<input type="hidden" name="country" value="<%= cookies[i].getValue()%>"/>
				<input class="buttons" id="borderRadiusNull" type="submit" value="<%=cookies[i].getName()%>" /><br />
				</form><% 
			}
		}%>
		 	<!-- Asks for a city and country. -->
		<form action="OWservlet" method="get">
		<input id="textBox" type="text" name="city" placeholder="City"/><br /> 
		<input id="textBox" type="text" name="country" placeholder="Country"/><br />
		<input class="buttons" type="submit" value="go" />
		</form>
	</article>	
	</main>
			<!-- Adds a pop-up asking if user want to save cookies -->
		<jsp:include page="/cookieQuestion.jsp"></jsp:include>
	
</body>
</html>