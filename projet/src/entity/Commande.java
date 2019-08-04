package entity;

import java.sql.Date;

public class Commande {
	private int id;
	private int idClient;
	private Date dateCommande;
	private byte statut;
	private int adresseFacturation;
	private int adresseLivraison;

	public Commande(int id, int idClient, Date dateCommande, byte statut, int adresseFacturation,
			int adresseLivraison) {
		this.id = id;
		this.idClient = idClient;
		this.dateCommande = dateCommande;
		this.statut = statut;
		this.adresseFacturation = adresseFacturation;
		this.adresseLivraison = adresseLivraison;
	}

	public int getId() {
		return id;
	}

	public int getIdClient() {
		return idClient;
	}

	public Date getDateCommande() {
		return dateCommande;
	}

	public byte getStatut() {
		return statut;
	}

	public int getAdresseFacturation() {
		return adresseFacturation;
	}

	public int getAdresseLivraison() {
		return adresseLivraison;
	}
}
