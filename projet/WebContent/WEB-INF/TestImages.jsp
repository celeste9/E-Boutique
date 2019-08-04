<%@page import="entity.Produit"%>
<%@page import="manager.ManagerProduit"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		for (Produit p : ManagerProduit.getAll()) {
			for (String s : p.getPathsImages()) {
	%>
	<img alt="" src="<%=s%>">
	<%
		}
		}
	%>
	<div>  
<dialog id="myFirstDialog" style="width:50%;background-color:#F4FFEF;border:1px dotted black;">  
<p><q>I am so clever that sometimes I don't understand a single word of what I am saying.   
</q> - <cite>Oscar Wilde</cite></p>  
<button id="hide">Close</button>  
</dialog>  
<button id="show">Show Dialog</button>  
</div>  
	<script type="text/JavaScript">  
(function() {    
    var dialog = document.getElementById('myFirstDialog');    
    document.getElementById('show').onclick = function() {    
        dialog.show();    
    };    
    document.getElementById('hide').onclick = function() {    
        dialog.close();    
    };    
})();   
</script>
</body>
</html>