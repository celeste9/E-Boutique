package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionClient;
import entity.Client;

/**
 * Servlet implementation class ControllerClient
 */
@WebServlet("/controllerClient")
public class ControllerClient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerClient() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().invalidate();
		// request.getRequestDispatcher("controllerPrincipal").forward(request,
		// response);
		response.sendRedirect("controllerPrincipal");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String button = request.getParameter("button");
		String mail = request.getParameter("email");
		String password = request.getParameter("password");
		String nom = request.getParameter("nom");
		String prenom = request.getParameter("prenom");
		String numero = request.getParameter("numero");
		if (button != null) {
			switch (button) {
			case "connexion":
				if (mail != null && password != null) {
					Client cl = new Client(mail, password);
					ActionClient.verifierSiDansBD(request, cl);
					request.getRequestDispatcher("controllerPrincipal?page=connexion.jsp").forward(request, response);
				}
				break;
			case "inscription":
				//java.util.Date d1 = new java.util.Date();
				//java.sql.Date aujourdhui = Date.valueOf(LocalDate.now());
				Date aujourdhui = Date.valueOf(LocalDate.now());
				if (mail != null && password != null && nom != null && prenom != null && numero != null) {
					Client client = new Client(-1, prenom, nom, numero, mail, password, aujourdhui);
					ActionClient.inserer(request, client);
					request.getRequestDispatcher("controllerPrincipal?page=inscription.jsp").forward(request, response);
				}
				break;
			case "connexion reset":
				request.getRequestDispatcher("controllerPrincipal?page=connexion.jsp").forward(request, response);
				break;
			case "inscription reset":
				request.getRequestDispatcher("controllerPrincipal?page=inscription.jsp").forward(request, response);
				break;
			}
		}
	}
}
