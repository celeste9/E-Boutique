package entity;

public class ProduitCommande {
	private int idCommande;
	private int idProduit;
	private int quantite;

	public ProduitCommande(int idCommande, int idProduit, int quantite) {
		this.idCommande = idCommande;
		this.idProduit = idProduit;
		this.quantite = quantite;
	}

	public int getIdCommande() {
		return idCommande;
	}

	public int getIdProduit() {
		return idProduit;
	}

	public int getQuantite() {
		return quantite;
	}
}
