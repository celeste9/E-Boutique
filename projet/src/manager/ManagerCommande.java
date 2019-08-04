package manager;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import entity.AdresseClient;
import entity.Client;
import entity.Commande;
import entity.ProduitCommande;
import service.DBConnexion;

public class ManagerCommande {

	/*
	 * idClient integer not null references clients(id), dateCommande date not null,
	 * statut tinyint not null references statutsCommandes(id), adresseFacturation
	 * integer not null references adressesClients(id), adresseLivraison integer not
	 * null references adressesClients(id)
	 */

	static public Commande putCommande(Client client) {
		try {
			PreparedStatement ps = DBConnexion.getPs(
					"INSERT commandes (idClient,dateCommande,statut,adresseFacturation,adresseLivraison) values(?,?,?,?,?);");
			ps.setInt(1, client.getId());
			ps.setDate(2, Date.valueOf(LocalDate.now()));
			ps.setInt(3, 1);
			ps.setInt(4, 1);
			ps.setInt(5, 2);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConnexion.close();

		Commande retour = null;
		try {
			PreparedStatement ps = DBConnexion
					.getPs("SELECT * FROM commandes WHERE id=(SELECT MAX(id) FROM commandes WHERE idClient=?);");
			ps.setInt(1, client.getId());
			ps.executeQuery();
			ResultSet rs = ps.getResultSet();
			if (rs.next())
				retour = new Commande(rs.getInt(1), rs.getInt(2), rs.getDate(3), (byte) rs.getInt(4), rs.getInt(5),
						rs.getInt(6));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConnexion.close();

		return retour;
	}

	/*
	 * idCommande integer not null references commandes(id), idProduit integer not
	 * null references produits(id), quantite integer not null
	 */

	static public ProduitCommande putProduit(Commande commande, int idProduit, int qte) {
		try {
			PreparedStatement ps = DBConnexion
					.getPs("INSERT produitscommandes (idCommande,idProduit,quantite) values(?,?,?);");
			ps.setInt(1, commande.getId());
			ps.setInt(2, idProduit);
			ps.setInt(3, qte);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConnexion.close();

		ProduitCommande retour = null;
		try {
			PreparedStatement ps = DBConnexion
					.getPs("SELECT * FROM produitscommandes WHERE idCommande=? AND idProduit=?;");
			ps.setInt(1, commande.getId());
			ps.setInt(2, idProduit);
			ps.executeQuery();
			ResultSet rs = ps.getResultSet();
			if (rs.next())
				retour = new ProduitCommande(rs.getInt(1), rs.getInt(2), rs.getInt(3));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConnexion.close();

		return retour;
	}
	
	/*
	CREATE TABLE commandes(
	id integer not null primary key auto_increment,
	idClient integer not null,
    dateCommande date not null,
    statut tinyint not null,
    adresseFacturation integer not null,
    adresseLivraison integer not null,
    */
	
	static public ArrayList<Commande> getCommandes(int idClient){
		ArrayList<Commande> commandes = new ArrayList<Commande>();
		try {
			PreparedStatement ps = DBConnexion.getPs("SELECT * FROM commandes WHERE idClient=?");
			ps.setInt(1, idClient);
			ps.executeQuery();
			ResultSet rs = ps.getResultSet();
			while (rs.next())
				commandes.add(new Commande(rs.getInt(1), rs.getInt(2), rs.getDate(3), (byte)rs.getInt(4), rs.getInt(5), rs.getInt(6)));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConnexion.close();
		return commandes;
	}
}
