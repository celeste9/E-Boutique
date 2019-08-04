<%@page import="entity.Produit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% Produit produit=(Produit)request.getAttribute("produit");
//if(produit != null){
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=produit.getNom()%></title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/produit.css">
</head>
<body>

	<%@ include file="headeretvolet.jsp"%>

	<section>
		<h1><%=produit.getNom()%></h1>
	</section>
	<section>
	
		<div id="prix"><span id="prix"><%=produit.getPrix() %> $</span></div>
					

		<h2>Images</h2>

		<%for(String s:produit.getPathsImages()){ %>
		<img src="<%=s%>">
		<%} %>

		<h2>Description</h2>

		<!-- <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p> -->
		<p><jsp:include page="${produit.getPathDescription()}"></jsp:include></p>

		<h2>Stock</h2>
		
		<p>Statut : <%=produit.getStatut()%></p>
		<p>Quantité en stock : <%=produit.getQuantite()%></p>

		<div id="panier"><span id="panier"><a id="panier" href="controllerCommande?id=<%= produit.getId()%>">ajouter au panier</a></span></div>
		
	</section>
<%
//}%>
	<%@ include file="footer.jsp"%>

</body>
</html>