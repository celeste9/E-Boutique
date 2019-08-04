<%@page import="java.awt.Window"%>
<%@page import="entity.Client"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>Connexion</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<% String erreur = (String) request.getAttribute("erreur"); %>
	<%@ include file="headeretvolet.jsp"%>
	<section>
		<h1>Se connecter</h1>
	</section>
	<section>
		<form method="post" action="controllerClient">
			<!-- <center> -->
				<table border="1" width="30%" cellpadding="3">
					<!-- <thead>
						<tr>
							<th colspan="2">Login</th>
						</tr>
					</thead>
					<tbody> -->
						<tr>
							<td>Email</td>
							<td><input type="text" name="email"/></td>
						</tr>
						<tr>
							<td>Mot de passe</td>
							<td><input type="password" name="password"/></td>
						</tr>
						<tr>
							<td><input type="submit" name="button" value="connexion" /></td>
							<td><input type="reset" value="Reset" /></td>
						</tr>
						<tr>
							<td colspan="2">Pas encore inscrit ? <a
								href="controllerPrincipal?page=inscription.jsp">S'inscrire ici</a></td>
						</tr>
					<!-- </tbody> -->
				</table>
			<!-- </center> -->
			<% 
			
			if(erreur != null) {
				if( erreur.equals("incorrect")){
					
					%>
				<p style="color:red;">Login ou Password incorrect</p>
				<%	
				}
			}else if(request.getSession().getAttribute("client")!=null){
			%>
			<p style="color:green;">Connecté, bienvenue <%=((Client)request.getSession().getAttribute("client")).getPrenom() %></p>
			<%} %>
		</form>
	</section>
	
	<%@ include file="footer.jsp"%>

</body>
</html>