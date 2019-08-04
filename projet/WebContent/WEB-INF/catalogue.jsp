<%@page import="entity.Produit" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catalogue</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

	<%@ include file="headeretvolet.jsp"%>

	<section>
	<%if(request.getParameter("cat")!=null){ %>
		<h1><%=request.getParameter("cat") %></h1>
	<%}else{ %>
		<h1>Catalogue</h1>
	<%} %>
	</section>

	<section>
		<!-- <div id="catalogue"> -->

		<!-- Insérer un scriplet en dessous -->
		
		<%for(Produit p:(ArrayList<Produit>)request.getAttribute("produits")){ %>
		
			<a href="controllerPrincipal?page=produit.jsp&id=<%=p.getId()%>">
				<div>
					<img src="<%=p.getPathsImages().get(0)%>">
					<b><%=p.getNom()%></b><br>
					<b><%=p.getPrix()%> $</b><br>
					<label><%=p.getStatut()%></label>
				</div>
			</a>
		<%} %>
			
			<!-- <div>
				<a href="produits/8700k.html"><img
					src="produits/images/8700k-1.jpg" alt=""></a>
				<h2>Intel Core i7 8700K</h2>
				<h4 class="baree">488,99 $</h4>
				<h4>399,99 $</h4>
				<ul>
					<li>Fréquence de base 3.7 GHz</li>
					<li>Fréquence de pointe 4.7 GHz</li>
					<li>Socket LGA 1151</li>
					<li>Nombre de coeurs physiques 6</li>
				</ul>
				<a class="more" href="produits/8700k.html">Plus de Détail...</a>
			</div>
			<div>
				<img src="produits/images/2700X-1.jpg" alt="" />
				<h2>AMD Ryzen 7 2700X</h2>
				<h4 class="baree">515,86 $</h4>
				<h4>499,99 $</h4>
				<ul>
					<li>Fabricant: AMD</li>
					<li>Nombre de cÅurs: 8 cÅurs</li>
					<li>Fréquence d'horloge: 4,3 GHz</li>
					<li>Fonctionnalité: Overclocking</li>
				</ul>
				<a class="more" href="#">Plus de détail...</a>
			</div>
			<div>
				<img src="produits/images/2080ti-2.png" alt="" />
				<h2>NVIDIA GeForce RTX 2080ti</h2>
				<h4 class="baree">1699,99 $</h4>
				<h4>1499,99 $</h4>
				<ul>
					<li>Fabricant: MSI</li>
					<li>Chipset: MSI</li>
					<li>Type de mémoire vidéo: GDDR</li>
					<li>Sortie: HDMI, DisplayPort</li>
				</ul>
				<a class="more" href="#">Plus de Détail</a>
			</div>
			<div>
				<img src="produits/images/rxvega64-1.jpg" alt="" />
				<h2>RXVEGA64-O8G-GAMING Radeon RX</h2>
				<h4 class="baree">884,46 $</h4>
				<h4>799,99 $</h4>
				<ul>
					<li>Fabricant: ASUS</li>
					<li>Chipset: ASUS</li>
					<li>Type de mémoire vidéo: GDDR5</li>
					<li>Interface: PCI Express</li>
				</ul>
				<a class="more" href="#">Plus de Détail</a>
			</div>
			<div>
				<img src="produits/images/x470gamingpro-1.jpg" alt="" />
				<h2>X470 GAMING PRO</h2>
				<h4 class="baree">159,99 $</h4>
				<h4>139,99 $</h4>
				<ul>
					<li>AMD RYZEN Series Processors 7th GEN</li>
					<li>Supports DDR4-3200+(OC) Memory</li>
					<li>DDR4 Boos</li>
					<li>MULTI-GPU</li>
				</ul>
				<a class="more" href="#">Plus de Détail ...</a>
			</div>
			<div>
				<img src="produits/images/z370PD3-1.png" alt="" />
				<h2>GIGABYTE Z370P D3/ATX Intel</h2>
				<h4 class="baree">170,80 $</h4>
				<h4>154,89 $</h4>
				<ul>
					<li>Intel Z370</li>
					<li>Support for 8th Generation Intel Core i7</li>
					<li>DDR4 4000(O.C.)</li>
				</ul>
				<a class="more" href="#">Plus de Détail ...</a>
			</div> -->

		<!-- Insérer un scriplet au dessus -->
		
		<!-- </div> -->
	</section>

	<%@ include file="footer.jsp"%>

</body>
</html>