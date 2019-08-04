package action;

import entity.ProduitCommande;
import manager.ManagerCommande;

import javax.servlet.http.HttpServletRequest;

import entity.Client;
import entity.Commande;

public class ActionCommande {
	
	public static Commande putCommande(Client client) {
		/*Commande commande = ManagerCommande.putCommande(client);
		return commande;*/
		return ManagerCommande.putCommande(client);
	}
	
	public static ProduitCommande putProduit(Commande commande, int id,int qte) {
		/*ProduitCommande artCom = ManagerCommande.putProduit(commande,id,qte);
		return artCom;*/
		return ManagerCommande.putProduit(commande,id,qte);
	}
	
	public static void afficherCommandes(HttpServletRequest request,int idClient) {
		request.setAttribute("commandes", ManagerCommande.getCommandes(idClient));
	}
	
}
