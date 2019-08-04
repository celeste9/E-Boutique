package manager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entity.Produit;
import service.DBConnexion;

public class ManagerProduit {
	static private ArrayList<Produit> produits;
	static private ArrayList<String> categories;
	static {
		
		ManagerProduit.produits = new ArrayList<Produit>();
		try {
			PreparedStatement ps = DBConnexion.getPs("SELECT * FROM produits");
			ps.executeQuery();
			ResultSet rs = ps.getResultSet();
			while (rs.next())
				ManagerProduit.produits.add(new Produit(rs.getInt(1), rs.getString(2), rs.getFloat(3), rs.getString(4),
						rs.getString(5), rs.getInt(6),rs.getString(7)));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConnexion.close();

		ManagerProduit.categories = new ArrayList<String>();
		try {
			PreparedStatement ps = DBConnexion.getPs("SELECT categorie FROM produits GROUP BY categorie;");
			ps.executeQuery();
			ResultSet rs = ps.getResultSet();
			while (rs.next())
				ManagerProduit.categories.add(rs.getString(1));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DBConnexion.close();
		
		for (Produit p : ManagerProduit.produits) {
			try {
				PreparedStatement ps = DBConnexion.getPs("SELECT chemin FROM imagesproduits WHERE idProduit=?;");
				ps.setInt(1, p.getId());
				ps.executeQuery();
				ResultSet rs = ps.getResultSet();
				while (rs.next())
					p.addPathImage(rs.getString(1));
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DBConnexion.close();
		}

	}

	static public ArrayList<Produit> getBottomTen() {
		if (ManagerProduit.produits.size() > 9) {
			ArrayList<Produit> produits=new ArrayList<Produit>();
			for(Produit p:ManagerProduit.produits.subList(ManagerProduit.produits.size() - 1 - 10,
					ManagerProduit.produits.size() - 1))
				produits.add(p);
			return produits;
		}else
			return ManagerProduit.produits;
	}

	static public ArrayList<String> getCategories() {
		return ManagerProduit.categories;
	}

	static public ArrayList<Produit> getAll() {
		return ManagerProduit.produits;
	}

	static public Produit getById(int id) {
		for (Produit p : ManagerProduit.produits)
			if (p.getId() == id)
				return p;
		return null;
	}

	static public ArrayList<Produit> getByCategorie(String categorie) {
		ArrayList<Produit> produits = new ArrayList<Produit>();
		for (Produit p : ManagerProduit.produits)
			if (p.getCategorie().equals(categorie))
				produits.add(p);
		return produits;
	}
}
