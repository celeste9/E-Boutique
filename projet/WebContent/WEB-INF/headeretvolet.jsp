<%@ page import="entity.Client" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<header>
	<aside>
		<a href="controllerPrincipal?page=index.jsp"><img src="images/logo1.png" /></a>
	</aside>
	<aside>
		<!-- if(request.getSession().isValid()) -->
		
		<%if(request.getSession().getAttribute("client")!=null){
			%>
			<b>Bonjour <%=((Client)request.getSession().getAttribute("client")).getPrenom() %></b>
			<br> <a href="controllerPrincipal?page=profil.jsp">Mon compte</a>
			<br> <a href="controllerClient">Se déconnecter</a>
			<%}else{ %>
		
		<a href="controllerPrincipal?page=connexion.jsp">Se connecter</a> <br> <a
			href="controllerPrincipal?page=inscription.jsp">S'inscrire</a>
			<%} %>
			<%int nbArticles=0;
			if(request.getSession().getAttribute("panier")!=null){
				nbArticles=((HashMap<Integer, Integer>)request.getSession().getAttribute("panier")).entrySet().size();
			}
			%>
			
		<br> <a href="controllerPrincipal?page=panier.jsp">Mon panier (<%=nbArticles
				 %>)</a>
				<br><br>
	</aside>
</header>
<nav>
	<aside>
		<ul>
			<li><a href="controllerPrincipal?page=index.jsp">Accueil</a></li>
			<!-- <li><a href="controllerPrincipal?page=galerie.jsp">Galerie</a></li> -->
			<li><a href="controllerPrincipal?page=catalogue.jsp">Catalogue</a>
				<ul>

					<!-- Insérer un scriplet en dessous -->
					
					<%for(String s:(ArrayList<String>)request.getAttribute("categories")){ %>
					<li><a href="controllerPrincipal?page=catalogue.jsp&cat=<%=s%>"><%=s%></a></li>
					<%} %>

					<!-- <li><a href="controllerPrincipal?page=catalogue.jsp&cat=cartes_meres">Cartes Mères</a>
						<ul>
							<li><a href="controllerPrincipal?page=produit.jsp&id=1">Intel Core i7 8700k</a></li>
							<li><a href="controllerPrincipal?page=produit.jsp&id=2">AMD Ryzen 2700k</a></li>
						</ul></li>
					<li><a href="catalogue.jsp?cat=processeurs">Processeurs</a>
						<ul>
							<li><a href="controllerPrincipal?page=produit.jsp&id=3">NVidia Geforce RTX 2080Ti FE</a></li>
							<li><a href="controllerPrincipal?page=produit.jsp&id=4">Asus Strix RX Vega 64</a></li>
						</ul></li>
					<li><a href="catalogue.jsp?cat=cartes_graphiques">Cartes
							Graphiques</a>
						<ul>
							<li><a href="controllerPrincipal?page=produit.jsp&id=5">NVidia Geforce RTX 2080Ti
									Founders Edition</a></li>
							<li><a href="controllerPrincipal?page=produit.jsp&id=6">Asus Strix RX Vega 64</a></li>
						</ul></li> -->

					<!-- Insérer un scriplet au dessus -->

				</ul></li>
			<!-- <li><a href="controllerPrincipal?page=comparatif.jsp">Comparatif</a>
				<ul> -->

					<!-- Insérer un scriplet en dessous -->
					
					<%//for(String s:(ArrayList<String>)request.getAttribute("categories")){ %>
					<!-- <li><a href="controllerPrincipal?page=comparatif.jsp&cat=<%//=s%>"><%//=s%></a></li> -->
					<%//} %>

					<!-- <li><a href="controllerPrincipal?page=comparatif.jsp&cat=cartes_meres">Cartes Mères</a></li>
					<li><a href="controllerPrincipal?page=comparatif.jsp&cat=processeurs">Processeurs</a></li>
					<li><a href="controllerPrincipal?page=comparatif.jsp&cat=cartes_graphiques">Cartes
							Graphiques</a></li> -->

					<!-- Insérer un scriplet au dessus -->

				<!-- </ul></li>
			<li><a href="controllerPrincipal?page=contact.jsp">Contact</a></li> -->
		</ul>
	</aside>
	<aside>