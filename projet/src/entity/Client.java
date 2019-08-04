package entity;

import java.sql.Date;

public class Client {
	private int id;
	private String prenom;
	private String nom;
	private String numeroTel;
	private String email;
	private String pwd;
	private Date dateInscription;

	public Client(int id, String prenom, String nom, String numeroTel, String email, String pwd, Date dateInscription) {
		this.id = id;
		this.prenom = prenom;
		this.nom = nom;
		this.numeroTel = numeroTel;
		this.email = email;
		this.pwd = pwd;
		this.dateInscription = dateInscription;
	}

	public Client(int id, String prenom, String nom, String numeroTel, String email, String pwd) {
		this.id = id;
		this.prenom = prenom;
		this.nom = nom;
		this.numeroTel = numeroTel;
		this.email = email;
		this.pwd = pwd;
	}

	public Client(int id, String prenom, String nom, String numeroTel, String email, Date dateInscription) {
		this.id = id;
		this.prenom = prenom;
		this.nom = nom;
		this.numeroTel = numeroTel;
		this.email = email;
		this.dateInscription = dateInscription;
	}

	public Client(String email, String pwd) {
		this.email = email;
		this.pwd = pwd;
	}

	public int getId() {
		return id;
	}

	public String getPrenom() {
		return prenom;
	}

	public String getNom() {
		return nom;
	}

	public String getNumeroTel() {
		return numeroTel;
	}

	public String getEmail() {
		return email;
	}

	public String getPwd() {
		return pwd;
	}

	public Date getDateInscription() {
		return dateInscription;
	}
}
