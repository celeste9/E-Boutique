package manager;

import entity.Client;
import entity.Produit;

public class Test {

	public static void main(String[] args) {
		System.out.print("ManagerClient.add (légal) : ");
		System.out.println(ManagerClient.add(new Client(-1, "prenom", "nom", "0617048493", "test@test.test", "TEST")));
		System.out.print("ManagerClient.add (email existe déjà) : ");
		System.out.println(ManagerClient.add(new Client(-1, "non", "non", "0000000000", "test@test.test", "TSET")));
		System.out.print("ManagerClient.add (email illégal) : ");
		System.out.println(ManagerClient.add(new Client(-1, "non", "non", "0000000000", "test@tes", "TSET")));
		System.out.print("ManagerClient.add (numTel trop court) : ");
		System.out.println(ManagerClient.add(new Client(-1, "prenom", "nom", "0617048", "tst@tst.tst", "TEST")));

		System.out.print("ManagerClient.checkConnexion (légal) : ");
		System.out.println(ManagerClient.checkConnexion(new Client("test@test.test", "TEST")));
		System.out.print("ManagerClient.checkConnexion (bad pwd) : ");
		System.out.println(ManagerClient.checkConnexion(new Client("test@test.test", "TST")));
		System.out.print("ManagerClient.checkConnexion (bad login) : ");
		System.out.println(ManagerClient.checkConnexion(new Client("tst@test.test", "TEST")));

		System.out.println();

		System.out.print("ManagerCommande.putCommande (client non loggé) : ");
		System.out.println(ManagerCommande.putCommande(new Client("test@test.test", "TEST")));
		System.out.print("ManagerCommande.putCommande (légal) : ");
		System.out.println(
				ManagerCommande.putCommande(ManagerClient.checkConnexion(new Client("test@test.test", "TEST"))));

		System.out.print("ManagerCommande.putProduit (idProduit existe pas) : ");
		System.out.println(ManagerCommande.putProduit(
				ManagerCommande.putCommande(ManagerClient.checkConnexion(new Client("test@test.test", "TEST"))), 10,
				5));
		System.out.print("ManagerCommande.putProduit (légal) : ");
		System.out.println(ManagerCommande.putProduit(
				ManagerCommande.putCommande(ManagerClient.checkConnexion(new Client("test@test.test", "TEST"))), 1, 5));

		System.out.println();

		System.out.println("ManagerProduit.getAll : ");
		for (Produit p : ManagerProduit.getAll())
			System.out.println(p.getNom());
		System.out.println();

		System.out.println("ManagerProduit.getBottomTen : ");
		for (Produit p : ManagerProduit.getBottomTen())
			System.out.println(p.getNom());
		System.out.println();

		System.out.println("ManagerProduit.getByCategorie (Processeurs) : ");
		for (Produit p : ManagerProduit.getByCategorie("Processeurs"))
			System.out.println(p.getNom());
		System.out.println();

		System.out.println("ManagerProduit.getByCategorie (vhfjakbsdh) : ");
		for (Produit p : ManagerProduit.getByCategorie("vhfjakbsdh"))
			System.out.println(p.getNom());
		System.out.println();

		System.out.print("ManagerProduit.getById (3) : ");
		System.out.println(ManagerProduit.getById(3));

		System.out.print("ManagerProduit.getById (10) : ");
		System.out.println(ManagerProduit.getById(10));

		System.out.println();
		System.out.println("ManagerProduit.getCategories : ");
		for (String s : ManagerProduit.getCategories())
			System.out.println(s);
		System.out.println();

	}

}
