package entity;

public class StatutCommande {
	private byte id;
	private String nom;

	public StatutCommande(byte id, String nom) {
		this.id = id;
		this.nom = nom;
	}

	public byte getId() {
		return id;
	}

	public String getNom() {
		return nom;
	}
}
