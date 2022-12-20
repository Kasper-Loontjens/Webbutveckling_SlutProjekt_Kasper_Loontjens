package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.GettheWeather;
import model.weatherBean;

@WebServlet("/OWservlet")
public class OWservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//Gets the session.
		HttpSession session = request.getSession();
		//saves city and country in bean
		String cityStr = request.getParameter("city");
		String countryStr = request.getParameter("country");
		weatherBean wBean = new weatherBean(cityStr, countryStr);
		//Gets weather attributes based on city/country
		GettheWeather.getWeather(wBean);
		//Sets bean
		request.setAttribute("wBean", wBean);
		//Saves city/country in a cookie if user accepted cookies or if user ignored the pop-up.		
		if (session.getAttribute("WantsCookies") == null || session.getAttribute("WantsCookies").equals("Yes") ) {
			Cookie ck = new Cookie(cityStr,countryStr);
			ck.setMaxAge(60*2);
			response.addCookie(ck);
		}
		//Forwards to page where weather is shown.
		RequestDispatcher rd = request.getRequestDispatcher("showWeather.jsp");
		rd.forward(request, response);
	}

}