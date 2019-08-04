package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import entity.Client;
import manager.ManagerClient;

public class ActionClient {

	public static void inserer(HttpServletRequest request,Client client) {
		/*int erreur = ManagerClient.add(client);
		String ERREUR = "" + erreur;
		request.setAttribute("erreur", ERREUR);*/
		request.setAttribute("erreur", "" + ManagerClient.add(client));
	}
	
	public static void verifierSiDansBD(HttpServletRequest request,Client client) {
		HttpSession session = null;
		Client clientTest = ManagerClient.checkConnexion(client);
		if(clientTest != null) {
			session = request.getSession();
			session.setAttribute("client", clientTest);
		}
		else {
			request.setAttribute("erreur", "incorrect");
		}
	}

	public static void afficherAdresses(HttpServletRequest request,int idClient) {
		request.setAttribute("adresses", ManagerClient.getAdresses(idClient));
	}
}
