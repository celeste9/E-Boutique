<%@page import="java.util.ArrayList,java.util.HashMap,java.util.Map"%>
<%@page import="entity.AdresseClient,entity.Commande"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Mon compte</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

	<%@ include file="headeretvolet.jsp"%>

	<section>
		<h1>Mon compte</h1>
	</section>

	<section>

		<h2>Mes informations</h2>

		<%
			Client client = (Client) request.getSession().getAttribute("client");
		%>

		<table border="1" width="30%" cellpadding="5">
			<tr>
				<td>Nom</td>
				<td><input type="text" name="nom" value="<%=client.getNom()%>" /></td>
			</tr>
			<tr>
				<td>Prénom</td>
				<td><input type="text" name="prenom"
					value="<%=client.getPrenom()%>" /></td>
			</tr>
			<tr>
				<td>Numéro de téléphone</td>
				<td><input type="text" name="numero"
					value="<%=client.getNumeroTel()%>" /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email"
					value="<%=client.getEmail()%>" /></td>
			</tr>
			<tr>
				<td>Mot de passe</td>
				<td><input type="submit" name="chgpwd" value="Changer" /> !
					Cette fonctionnalité n'est pas encore implémentée !</td>
			</tr>
		</table>

		<h2>Mes adresses</h2>

		<%
			HashMap<Integer,AdresseClient> adresses = (HashMap<Integer,AdresseClient>) request.getAttribute("adresses");
			for (Map.Entry<Integer,AdresseClient> entry : adresses.entrySet()) {
				AdresseClient ac=entry.getValue();
		%>
		<form action="" style="display: inline-block;">
			<input type="hidden" name="idClient" value="<%=client.getId()%>">
			<input type="hidden" name="id" value="<%=ac.getId()%>">
			<table border="1" width="30%" cellpadding="5">
				<tr>
					<td>Numéro</td>
					<td><input type="text" name="noRue" value="<%=ac.getNoRue()%>" /></td>
				</tr>
				<tr>
					<td>Rue</td>
					<td><input type="text" name="nomRue"
						value="<%=ac.getNomRue()%>" /></td>
				</tr>
				<tr>
					<td>Code Postal</td>
					<td><input type="text" name="codePostal"
						value="<%=ac.getCodePostal()%>" /></td>
				</tr>
				<tr>
					<td>Ville</td>
					<td><input type="text" name="ville" value="<%=ac.getVille()%>" /></td>
				</tr>
				<tr>
					<td>Complément</td>
					<td><input type="text" name="complement"
						value="<%=(ac.getComplement()==null?"":ac.getComplement())%>" /></td>
				</tr>
				<tr>
					<td><input type="submit" name="button" value="Modifier" /> !
						Cette fonctionnalité n'est pas encore implémentée !</td>
					<td><input type="submit" name="button" value="Supprimer" /> !
						Cette fonctionnalité n'est pas encore implémentée !</td>
				</tr>
			</table>
		</form>
		<%
			}
		%>

		<form action="" style="display: inline-block;">
			<input type="hidden" name="idClient" value="<%=client.getId()%>">
			<table border="1" width="30%" cellpadding="5">
				<tr>
					<td>Numéro</td>
					<td><input type="text" name="noRue" /></td>
				</tr>
				<tr>
					<td>Rue</td>
					<td><input type="text" name="nomRue" /></td>
				</tr>
				<tr>
					<td>Code Postal</td>
					<td><input type="text" name="codePostal" /></td>
				</tr>
				<tr>
					<td>Ville</td>
					<td><input type="text" name="ville" /></td>
				</tr>
				<tr>
					<td>Complément</td>
					<td><input type="text" name="complement" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" name="button"
						value="Ajouter" /> ! Cette fonctionnalité n'est pas encore
						implémentée !</td>
				</tr>
			</table>
		</form>

		<h2>Mes commandes</h2>

		<%
			for (Commande c : (ArrayList<Commande>) request.getAttribute("commandes")) {
		%>
		<table>
			<tr>
				<td>Numéro de commande :</td>
				<td><%=c.getId()%></td>
			</tr>
			<tr>
				<td>Date de commande :</td>
				<td><%=c.getDateCommande()%></td>
			</tr>
			<tr>
				<td>Statut :</td>
				<td><%=c.getStatut()%></td>
			</tr>
			<tr>
				<td>Adresse de facturation :</td>
				<td><%=adresses.get(c.getAdresseFacturation())%></td>
			</tr>
			<tr>
				<td>Adresse de livraison :</td>
				<td><%=adresses.get(c.getAdresseLivraison())%></td>
			</tr>
			<tr>
				<td>Contenu :</td>
				<td>ToDo</td>
			</tr>

		</table>
		<br>
		<%
			}
		%>

	</section>

	<%@ include file="footer.jsp"%>
</body>
</html>