package entity;

import java.util.ArrayList;

public class Produit {
	private int id;
	private String nom;
	private float prix;
	private String categorie;
	private String statut;
	private int quantite;
	private ArrayList<String> pathsImages=new ArrayList<String>();
	private String pathDescription;

	public Produit(int id, String nom, float prix, String categorie, String statut, int quantite,String pathDescription) {
		this.id = id;
		this.nom = nom;
		this.prix = prix;
		this.categorie = categorie;
		this.statut = statut;
		this.quantite = quantite;
		this.pathDescription=pathDescription;
	}

	public int getId() {
		return id;
	}

	public String getNom() {
		return nom;
	}

	public float getPrix() {
		return prix;
	}

	public String getCategorie() {
		return categorie;
	}

	public String getStatut() {
		return statut;
	}

	public int getQuantite() {
		return quantite;
	}
	
	public void addPathImage(String path) {
		this.pathsImages.add(path);
	}
	
	public ArrayList<String> getPathsImages(){
		return pathsImages;
	}
	
	public String getPathDescription() {
		return this.pathDescription;
	}
}
