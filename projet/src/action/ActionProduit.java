package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import entity.Produit;
import manager.ManagerProduit;

public class ActionProduit {

	public static void afficherDerniersProduits(HttpServletRequest request) {
		
		/*ArrayList<Produit> top10DernieresTendances = new ArrayList<>();
		top10DernieresTendances = ManagerProduit.getBottomTen();
		request.setAttribute("produits", top10DernieresTendances);*/
		request.setAttribute("produits", ManagerProduit.getBottomTen());
		
	}
	
	public static void afficherCategories(HttpServletRequest request){
		/*ArrayList<String> listeCategories = new ArrayList<>();
		listeCategories = ManagerProduit.getCategories();
		request.setAttribute("categories", listeCategories);*/
		request.setAttribute("categories", ManagerProduit.getCategories());
	}
	
	public static void afficherTous(HttpServletRequest request) {
		/*ArrayList<Produit> listeProduits = new ArrayList<>();
		listeProduits = ManagerProduit.getAll();
		request.setAttribute("produits", listeProduits);*/
		request.setAttribute("produits", ManagerProduit.getAll());
	}
	
	public static void afficherProduit(HttpServletRequest request,int idProduit) {
		/*Produit unProduit = ManagerProduit.getById(idProduit);
		request.setAttribute("produit", unProduit);*/
		request.setAttribute("produit", ManagerProduit.getById(idProduit));
	}
	
	public static void afficherProduitParCategories(HttpServletRequest request,String categorie) {
		/*ArrayList<Produit> listeProduitParCategorie = new ArrayList<>();
		listeProduitParCategorie = ManagerProduit.getByCategorie(categorie);
		request.setAttribute("listeParCategories", listeProduitParCategorie);*/
		request.setAttribute("produits", ManagerProduit.getByCategorie(categorie));
	}
	
	public static void afficherProduitDansPanier(HttpServletRequest request,int idProduit) {
		request.setAttribute(((Integer)idProduit).toString(), ManagerProduit.getById(idProduit));
	}
}
