<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Produit" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Accueil</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

	<%@ include file="headeretvolet.jsp"%>

	<section>
		<h1>Accueil</h1>
	</section>

	<section>

		<!-- Insérer un scriplet en dessous -->

		<h2>Présentation</h2>
		<ol>
			<li>Les débuts</li>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
				pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
				culpa qui officia deserunt mollit anim id est laborum.</p>
			<li>Le développement</li>
			<ol>
				<li>Lorem</li>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
					enim ad minim veniam, quis nostrud exercitation ullamco laboris
					nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
					reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
					pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
					culpa qui officia deserunt mollit anim id est laborum.
				<li>Ipsum</li>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
					enim ad minim veniam, quis nostrud exercitation ullamco laboris
					nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
					reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
					pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
					culpa qui officia deserunt mollit anim id est laborum.
				<li>Dolor</li>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
					do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
					enim ad minim veniam, quis nostrud exercitation ullamco laboris
					nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in
					reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
					pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
					culpa qui officia deserunt mollit anim id est laborum.</p>
			</ol>
			<li>Maintenant</li>
			<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
				pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
				culpa qui officia deserunt mollit anim id est laborum.</p>
		</ol>
	</section>
	<section>
		<h2>Nouveautés</h2>

		<!-- Insérer un scriplet en dessous -->

					<%for(Produit p:(ArrayList<Produit>)request.getAttribute("produits")){ %>
					<a href="controllerPrincipal?page=produit.jsp&id=<%=p.getId()%>">
						<div>
							<img src="<%=p.getPathsImages().get(0)%>">
							<b><%=p.getNom()%></b>
						</div>
					</a>
					<%} %>

		<!-- <a href="catalogue/produits/x470gamingpro.jsp">
			<div>
				<img src="catalogue/produits/images/x470gamingpro-1.jpg"> <b>MSI
					x470 Gaming Pro</b>
			</div>
		</a> <a href="catalogue/produits/z370PD3.jsp">
			<div>
				<img src="catalogue/produits/images/z370PD3-1.png"> <b>Gigabyte
					x470P D3</b>
			</div>
		</a> <a href="catalogue/produits/8700k.jsp">
			<div>
				<img src="catalogue/produits/images/8700k-1.jpg"> <b>Intel
					Core i7 8700k</b>
			</div>
		</a> <a href="catalogue/produits/2700X.jsp">
			<div>
				<img src="catalogue/produits/images/2700X-1.jpg"> <b>AMD
					Ryzen 7 2700X</b>
			</div>
		</a> <a href="catalogue/produits/2080ti.jsp">
			<div>
				<img src="catalogue/produits/images/2080ti-1.jpg"> <b>NVidia
					Geforce RTX 2080Ti Founders Edition</b>
			</div>
		</a> <a href="catalogue/produits/rxvega64.jsp">
			<div>
				<img src="catalogue/produits/images/rxvega64-1.jpg"> <b>Asus
					Strix RX Vega 64</b>
			</div>
		</a> -->

		<!-- Insérer un scriplet au dessus -->

	</section>

	<%@ include file="footer.jsp"%>

</body>
</html>