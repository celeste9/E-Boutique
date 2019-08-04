<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="entity.Produit"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Panier</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<%! 
//HashMap<Integer, Integer> panier=null; %>

<% HashMap<Integer, Integer> panier= (HashMap<Integer, Integer>)session.getAttribute("panier"); 
float total=0;%>
	<%@ include file="headeretvolet.jsp"%>

	<section>
		<h1>Votre panier</h1>
	</section>
	<section>

		<table border="1">
			<tr>
				<th>Produit</th>
				<th>Prix</th>
				<th>Quantité</th>
				<th>Sous-total</th>
			</tr>

			<%if(panier != null){
				
				for(Map.Entry<Integer, Integer> entry : panier.entrySet()) {
				    //int key = entry.getKey();
				    Produit p=(Produit)request.getAttribute(entry.getKey().toString());
				    int value = entry.getValue();%>
				    <tr>
				    
				    <td><a href="controllerPrincipal?page=produit.jsp&id=<%=p.getId()%>"  style="color:blue;text-decoration: underline;"><%=p.getNom()%></a></td>
				     <td><%=p.getPrix()%></td>
				      <td><form action="controllerCommande" method="post">
						<input type="hidden" name="id" value="<%=p.getId()%>">
						<input type="submit" name="button" value="-">
						<%=value%>
						<input type="submit" name="button" value="+">
					</form></td>
				       <td><%=(p.getPrix()*value)%></td>
				    </tr>
				    <%total+=p.getPrix()*value;
				    
				}
			}
			
			%>
			<tr>
				<td colspan="3"><b>Total</b></td>
				<td><b><%=total %></b></td>
			</tr>

		</table>
		
		<br>
		<form action="controllerCommande" method="post">
		<input type="submit" name="button" value="Commander">
		</form>

	</section>

	<%@ include file="footer.jsp"%>

</body>
</html>