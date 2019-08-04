package entity;

public class AdresseClient {
	private int id;
	private int idClient;
	private String noRue;
	private String nomRue;
	private String codePostal;
	private String ville;
	private String complement;

	public AdresseClient(int id, int idClient, String noRue, String nomRue, String codePostal, String ville,
			String complement) {
		this.id = id;
		this.idClient = idClient;
		this.noRue = noRue;
		this.nomRue = nomRue;
		this.codePostal = codePostal;
		this.ville = ville;
		this.complement = complement;
	}

	public int getId() {
		return id;
	}

	public int getIdClient() {
		return idClient;
	}

	public String getNoRue() {
		return noRue;
	}

	public String getNomRue() {
		return nomRue;
	}

	public String getCodePostal() {
		return codePostal;
	}

	public String getVille() {
		return ville;
	}

	public String getComplement() {
		return complement;
	}
	
	public String toString() {
		return this.noRue+" "+this.nomRue+", "+this.ville+" "+this.codePostal+(this.complement==null||this.complement.isEmpty()?"":" - "+this.complement);
	}
}
