package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.ActionCommande;
import entity.ProduitCommande;
import manager.ManagerProduit;
import entity.Client;
import entity.Commande;

/**
 * Servlet implementation class ControllerCommande
 */
@WebServlet("/controllerCommande")
public class ControllerCommande extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static HashMap<Integer, Integer> panier = new HashMap<>();
	private static HttpSession session;
    private static ArrayList<String> nomsProduits ;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerCommande() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public static String afficher() {
    	if (nomsProduits != null)
    	for(String nom : nomsProduits) {
    		return nom;
    	}
    	return null;
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		if (id != null) {
			int Id = Integer.parseInt(id);
			panier.put(Id, 1);
			session = request.getSession(false);
			session.setAttribute("panier", panier);
		}
		response.sendRedirect("controllerPrincipal?page=produit.jsp&id=" + id);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String button = request.getParameter("button");
		String id = request.getParameter("id");
		panier = (HashMap<Integer, Integer>) session.getAttribute("panier");
		if (button != null) {
			switch(button) {
			case "+" :
				//String id = request.getParameter("id");
				if (id != null) {
					int Id = Integer.parseInt(id);
					panier.put(Id,panier.get(Id)+1);
					//session.setAttribute("panier", panier);
					//request.getRequestDispatcher("panier.jsp").forward(request, response);
				}
				break;
			case "-":
				//String ID = request.getParameter("id");
				if (id != null) {
					int Id = Integer.parseInt(id);
					panier.put(Id,panier.get(Id)-1);
					//session.setAttribute("panier", panier);
					//request.getRequestDispatcher("panier.jsp").forward(request, response);
				}
				break;
			case "Commander" :
				nomsProduits = new ArrayList<>();
				Client client = (Client) session.getAttribute("client");
				Commande maCommande = ActionCommande.putCommande(client);
				ArrayList<ProduitCommande> listeArticlesCommandes = new ArrayList<>();
				for(Map.Entry<Integer, Integer> entry : panier.entrySet()) {
				    int key = entry.getKey();
				    int value = entry.getValue();
				    listeArticlesCommandes.add(ActionCommande.putProduit(maCommande, key, value));
				    nomsProduits.add( (ManagerProduit.getById(key).getNom() + " qte: " + value ));
				}
				MailController.sendEmail(ControllerCommande.afficher(), client.getEmail(), "recapitulatif de commande");	// BUG
				//request.getRequestDispatcher("panier.jsp").forward(request, response);
				break;
			}
		}
		response.sendRedirect("controllerPrincipal?page=panier.jsp");
	}

}
