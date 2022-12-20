   <%@page import="model.weatherBean"%>
    	
        <% 
        //Gets yes or no, based on user has answered if they wanted cookies.
        String cookieChoice = request.getParameter("cookieChoice");
		//If user hasn´t answered pop-up will show.
        if (session.getAttribute("WantsCookies") == null){
            %><footer><%
			//Prints the users answer then saves it as a session attribute.
        	if ("Yes".equals(cookieChoice)){
    			out.print("<p>Cookies saved!</p>");
    			session.setAttribute("WantsCookies", "Yes");
        	}else if ("No".equals(cookieChoice)){
    			out.print("<p>Cookies denied!</p>");
    			session.setAttribute("WantsCookies", "No");
        	}
            //Gets bean.
        	weatherBean wBean = (weatherBean) request.getAttribute("wBean");
			//Asks if user want to save cookies.
        	if (cookieChoice == null){
        		 %><p id="saveCookiesQ" >Save cookies?</p>
                 <form  method="get">
                 <!-- Will pass current city/country if there is one. -->
                 <%if (wBean !=null){%>
                 	<input type="hidden" name="city" value="<%=wBean.getCityStr() %>"/>
         			<input type="hidden" name="country" value="<%=wBean.getCountryStr() %>"/>
                 	<%
                 }%>
         		<input id="yesNoButtons" type="submit" name="cookieChoice" value="Yes" />
         		<input id="yesNoButtons" type="submit" name="cookieChoice" value="No" />
         		</form><%
         	}
            %></footer><%
        }
        %>
