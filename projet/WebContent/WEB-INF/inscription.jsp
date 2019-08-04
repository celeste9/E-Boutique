<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Inscription</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<% String  erreur = (String) request.getAttribute("erreur"); %>
	<%@ include file="headeretvolet.jsp"%>
	<section>
		<h1>S'inscrire</h1>
	</section>
	<section>
		<form method="post" action="controllerClient">
			<!-- <center> -->
				<table border="1" width="30%" cellpadding="5">
					<!-- <thead>
						<tr>
							<th colspan="2">Entrer Informations</th>
						</tr>
					</thead>
					<tbody> -->
						<tr>
							<td>Nom</td>
							<td><input type="text" name="nom"/></td>
						</tr>
						<tr>
							<td>Prénom</td>
							<td><input type="text" name="prenom"/></td>
						</tr>
						<tr>
							<td>Numéro de téléphone</td>
							<td><input type="text" name="numero"/></td>
						</tr>
						<tr>
							<td>Email</td>
							<td><input type="text" name="email"/></td>
						</tr>
						<tr>
							<td>Mot de passe</td>
							<td><input type="password" name="password" /></td>
						</tr>
						<tr>
							<td><input type="submit" name="button" value="inscription" /></td>
							<td><input type="reset" value="Reset" /></td>
						</tr>
						<tr>
							<td colspan="2">Déja enregistré ? <a href="controllerPrincipal?page=connexion.jsp">Login</a></td>
						</tr>
					<!-- </tbody> -->
				</table>
			<!-- </center> -->
			
			<% 
		
			if(erreur!= null) {
				int code =0;
				code=Integer.parseInt(erreur);
				switch(code){
				case 0 :
					%>
						<P style="color:green;"> Inscription réussie</P>
						<%
							break;
					
				
				case 1 :
			%>
				<P style="color:red;"> Adresse email déjà utilisée</P>
				<%
					break;
				
				
				case 2 :
					%>
						<P style="color:red;"> Mauvais email</P>
						<%
							break;
						
				case 3 :
					%>
						<P style="color:red;"> Mauvais nom</P>
						<%
							break;
						
				case 4 :
					%>
						<P style="color:red;"> Mauvais prénom</P>
						<%
							break;
				case 5 :
					%>
						<P style="color:red;"> Mauvais numéro de téléphone</P>
						<%
							break;
				}
			}
		
			%>
		</form>
	</section>
	<%@ include file="footer.jsp"%>

</body>
</html>