package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionClient;
import action.ActionCommande;
import action.ActionProduit;
import entity.Client;

/**
 * Servlet implementation class ControllerPrincipal
 */
@WebServlet("/controllerPrincipal")
public class ControllerPrincipal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ControllerPrincipal() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String page = request.getParameter("page");
		String ID = request.getParameter("id");
		ActionProduit.afficherCategories(request);
		if (page != null) {
			if (page.equals("produit.jsp") && ID != null) {
				int id = Integer.parseInt(ID);
				ActionProduit.afficherProduit(request, id);
			} else if (page.equals("index.jsp")) {
				ActionProduit.afficherDerniersProduits(request);
			} else if (page.equals("galerie.jsp")) {

			} else if (page.equals("catalogue.jsp")) {
				if (request.getParameter("cat") != null) {
					ActionProduit.afficherProduitParCategories(request, request.getParameter("cat"));
				} else {
					ActionProduit.afficherTous(request);
				}
			} else if (page.equals("comparatif.jsp")) {

			} else if (page.equals("contact.jsp")) {

			} else if (page.equals("panier.jsp")) {
				if (request.getSession().getAttribute("panier") != null)
					for (Map.Entry<Integer, Integer> entry : ((HashMap<Integer, Integer>) request.getSession()
							.getAttribute("panier")).entrySet())
						ActionProduit.afficherProduitDansPanier(request, entry.getKey());
			} else if (page.equals("connexion.jsp")) {

			} else if (page.equals("inscription.jsp")) {

			} else if (page.equals("profil.jsp")) {
				ActionClient.afficherAdresses(request, ((Client)request.getSession().getAttribute("client")).getId());
				ActionCommande.afficherCommandes(request, ((Client)request.getSession().getAttribute("client")).getId());
			} else {
				page = "index.jsp";
				ActionProduit.afficherDerniersProduits(request);
			}
		} else {
			page = "index.jsp";
			ActionProduit.afficherDerniersProduits(request);
		}
		request.getRequestDispatcher("WEB-INF/"+page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
