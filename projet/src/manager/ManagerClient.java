package manager;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;

import entity.AdresseClient;
import entity.Client;
import entity.Produit;
import service.DBConnexion;

//	INSERT clients (prenom,nom,numeroTel,email,pwd,dateInscription) values('Pierre','Bodineau','4385037329','pbodinea@isi-mtl.com','isipb',123);

public class ManagerClient {
	static public int add(Client client) {
		/*
		 * Retourne 0 si pas de problème, 1 si email déjà dans db, 2 si email pas bon, 3
		 * si prenom pas bon, 4 si nom pas bon, 5 si numeroTel pas bon ...
		 */
		if (!isEmailAlreadyInDB(client.getEmail()))
			return 1;
		if (!isEmailOK(client.getEmail()))
			return 2;
		if (!isNomOK(client.getPrenom()))
			return 3;
		if (!isNomOK(client.getNom()))
			return 4;
		if (!isNumeroTelOK(client.getNumeroTel()))
			return 5;
		try {
			PreparedStatement ps = DBConnexion
					.getPs("INSERT clients (prenom,nom,numeroTel,email,pwd,dateInscription) values(?,?,?,?,?,?);");
			ps.setString(1, client.getPrenom());
			ps.setString(2, client.getNom());
			ps.setString(3, client.getNumeroTel());
			ps.setString(4, client.getEmail());
			ps.setString(5, client.getPwd());
			ps.setDate(6, Date.valueOf(LocalDate.now()));
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConnexion.close();
		return 0;
	}

	static public Client checkConnexion(Client client) {
		Client retour = null;
		try {
			PreparedStatement ps = DBConnexion.getPs("SELECT * FROM clients WHERE email=? AND pwd=?;");
			ps.setString(1, client.getEmail());
			ps.setString(2, client.getPwd());
			ps.executeQuery();
			ResultSet rs = ps.getResultSet();
			if (rs.next())
				retour = new Client(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getDate(7));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConnexion.close();
		return retour;
	}

	static private boolean isNomOK(String nom) {
		return nom.matches("^[a-zA-Z]{2,40}$") && nom.length() < 41;
	}

	static private boolean isNumeroTelOK(String numTel) {
		// return numTel.matches("^[0-9]{10}$");
		return numTel.matches("^\\d{10}$");
	}

	static private boolean isEmailOK(String email) {
		// return email.matches("^.+@[^\\.].*\\.[a-z]{2,}$");
		return email.matches("^[\\w\\.-]{1,}@\\w{1,}\\.\\w{1,}$") && email.length() < 41;
	}

	static private boolean isEmailAlreadyInDB(String email) {
		int id = -1;
		try {
			PreparedStatement ps = DBConnexion.getPs("SELECT id FROM clients WHERE email=?");
			ps.setString(1, email);
			ps.executeQuery();
			ResultSet rs = ps.getResultSet();
			if (rs.next())
				id = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConnexion.close();
		return id == -1;
	}

	static public HashMap<Integer,AdresseClient> getAdresses(int idClient) {
		HashMap<Integer,AdresseClient> adresses = new HashMap<Integer,AdresseClient>();
		try {
			PreparedStatement ps = DBConnexion.getPs("SELECT * FROM adressesclients WHERE idClient=?");
			ps.setInt(1, idClient);
			ps.executeQuery();
			ResultSet rs = ps.getResultSet();
			while (rs.next())
				adresses.put(rs.getInt(1),new AdresseClient(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7)));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConnexion.close();
		return adresses;
	}
}