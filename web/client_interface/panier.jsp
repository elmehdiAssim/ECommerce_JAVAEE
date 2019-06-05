<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var="dataSource" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
      url="jdbc:sqlserver://localhost;databaseName=ECommerce;username=elmehdi;password=elmehdi;"/>
<!DOCTYPE HTML>
<html>
<head>
    
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.2/css/star-rating.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.2/js/star-rating.min.js"></script>
    <!-- -->
    <title>your cart</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'>   

</head>
<body>
    <div class="header-bg">
	<div class="wrap"> 
            <div class="h-bg">
                <div class="total">
                    <div class="header">
                        <div class="box_header_user_menu">
                            <ul class="user_menu"> 
                                <c:choose>
                                    <c:when test="${sessionScope.username == null}">
                                        <li class="last">
                                            <a href="../login_interface/creer_compte.jsp">
                                                <div class="button-t">
                                                    <span>Create an Account</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="last">
                                            <a href="../login_interface/login.jsp">
                                                <div class="button-t">
                                                    <span>Log in</span>
                                                </div>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="last">
                                            <a href="../admin_interface/LogoutServlet">
                                                <div class="button-t">
                                                    <span>Log Out</span>
                                                </div>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                        
                        <c:if test="${sessionScope.username != null}">
                            <div class="header-right">
                                <ul class="follow_icon">                               
                                    <li>                                    
                                        <img src="images/client.png" width="30" height="30" align="middle"/>
                                        <span><c:out value="${sessionScope.username}"/></span>
                                    </li>              
                                </ul>
                            </div>        
                        </c:if><div class="clear"></div>                	
                    </div>
                    
                    <div class="banner-top">
			<div class="header-bottom">
                            <div class="header_bottom_right_images">
                                <div class="content-wrapper">		  
                                    <div class="content-top">
                                        <div class="about_wrapper">
                                            <h1>Your Cart</h1>
                                        </div>
                                        <br/><br/>
                                        <c:choose>   
                                            <c:when test="${not empty sessionScope.panier}">
                                                <!-- Début Tableau de panier si le panier n'est pas vide-->                                       
                                                <table class="table">
                                            <thead>
                                                <tr>      
                                                  <th></th>
                                                  <th>Price</th>
                                                  <th>Quantity</th>
                                                </tr>
                                            </thead>
                                            <tbody>                                                
                                                <c:forEach var="panier" items="${panier}">   
                                                    
                                                
                                                    <sql:query var="produit" dataSource="${dataSource}">
                                                        select * from Produit where id_produit=${panier.key}
                                                    </sql:query>  
                                                        
                                                    <c:set var="quantiteProduit" value="${panier.value}"/>                                                    
                                                
                                                    <c:forEach var="row" items="${produit.rows}">                                                

                                                        <c:set var="prixVenteApresRemise" value="${row.prix_vente-row.prix_vente*row.taux_remise/100}"/>                                            
                                                        <fmt:parseNumber var="prixVenteInteger" integerOnly="true" type="number" value="${prixVenteApresRemise}" />
                                                        
                                                        <tr>      
                                                            <td>
                                                                <div class="about-top">	
                                                                    <div class="grid images_1_of_1">
                                                                        <img src="../phoneImage/${row.image_link}" width="80" height="80"/> 
                                                                    </div>
                                                                    <div class="grid span_2_of_3"> 							
                                                                        <h4><c:out value="${row.designation}"/></h4>                                                                            	
                                                                        <a href="SuppProduitDePanier?idProduit=${row.id_produit}"><u>supprimer</u></a>
                                                                    </div><div class="clear"></div> 
                                                                </div>
                                                            </td>
                                                            <td><c:out value="${prixVenteInteger}"/> MAD</td>
                                                            <td>
                                                                <select onchange="location = this.value;"> 
                                                                    <c:forEach var="j" begin="1" end="5"> 
                                                                        <c:choose>
                                                                            <c:when test="${j == quantiteProduit}">
                                                                                <option value="ModifierPanier?idProduit=${row.id_produit}&quantite=${j}" selected>${j}</option>
                                                                            </c:when>     
                                                                            <c:otherwise>
                                                                                <option value="ModifierPanier?idProduit=${row.id_produit}&quantite=${j}">${j}</option>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </c:forEach> 
                                                                </select>
                                                            </td>
                                                        </tr>                                                           
                                                    </c:forEach>
                                                    <c:set var="prixTotal" value="${prixTotal+quantiteProduit*prixVenteInteger}"/>
                                                </c:forEach>
                                                <tr>
                                                    <td><h4 style="color: red">total:</h4></td>
                                                    <td></td>
                                                    <td><h4 style="color: red"><c:out value="${prixTotal}"/> MAD</h4></td>
                                                </tr>
                                                <tr>
                                                    <td><a href="../login_interface/livraison_paiement.jsp"><u>get your order</u></a></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>                                                
                                                <!-- Fin tableau de panier-->
                                            </c:when>
                                            <c:otherwise>
                                                <h1 style="font-size:30px; font-weight:bold">
                                                    Your Cart Is Empty For The Moment.
                                                </h1> <br/><br/><br/><br/><br/><br/><br/><br/>
                                            </c:otherwise>    
                                        </c:choose>
                                        
                                    </div>												
                                </div>                            
                            </div>
                    
                    
		
                            
<%@include file='./footer.jsp'%> 
<script>
document.getElementById('my_selection').onchange = function() {
    window.location.href = this.children[this.selectedIndex].getAttribute('href');
}
</script>
</html>

    	
    	
            	