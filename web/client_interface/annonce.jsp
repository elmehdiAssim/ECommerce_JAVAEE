
<%@include file='./header.jsp'%>
<title>all products</title>
<%
    VisiteDB.incriVisite();
%>
                                
                    <div class="banner-top">
			<div class="header-bottom">
                            <div class="header_bottom_right_images">
                                <div class="content-wrapper">		  
                                    <div class="content-top">
                                        <div class="about_wrapper">
                                            <h1>Our Products</h1>
                                        </div>
                                        <!-- debut: annonce -->
                                        <sql:query var="produit" dataSource="${dataSource}">
                                            select * from Produit where id_annonce is not null
                                        </sql:query>
                                        <c:forEach var="row" items="${produit.rows}">                                            
                                            
                                            <!-- obtenir la partie entière du prix de vente après remise-->
                                            <c:set var="prixVenteApresRemise" value="${row.prix_vente-row.prix_vente*row.taux_remise/100}"/>                                            
                                            <fmt:parseNumber var="prixVenteInteger" integerOnly="true" type="number" value="${prixVenteApresRemise}" />
                                            <!-- Fin -->
                                            
                                            <div class="text"> 	
                                            <div class="grid_1_of_3 images_1_of_3">
                                                <div class="grid_1">
                                                    <a href="info_produit.jsp?id_produit=${row.id_produit}&prixVenteInteger=${prixVenteInteger}">
                                                        <img src="../phoneImage/${row.image_link}" height="180px" title="continue reading"><!-- the heigth: 180px-->
                                                    </a> <!-- les images doivent être de 135*-->
                                                    <div class="grid_desc">
                                                        <p class="title"><c:out value="${row.designation}"/></p>
                                                        <!-- Début star evaluation -->                                                    
                                                        <c:set var="count" value="${0}"/>
                                                        <c:set var="totalNbrEtoile" value="${0}"/>
                                                        <sql:query var="evaluationProduit" dataSource="${dataSource}">                                            
                                                            select *  from EvaluationProduit where id_produit=${row.id_produit}
                                                        </sql:query>
                                                        <c:forEach var="row2" items="${evaluationProduit.rows}">
                                                            <c:set var="count" value="${count+1}"/>
                                                            <c:set var="totalNbrEtoile" value="${totalNbrEtoile+row2.nombre_etoile}"/>
                                                        </c:forEach>                                                    
                                                        <c:set var="width" value="${totalNbrEtoile*20/count}"/>                                                    
                                                        <div class="ratings">
                                                            <div class="empty-stars"></div>
                                                            <div class="full-stars" style="width:${width}%"></div>
                                                        </div>
                                                        <!-- Fin star evaluation-->
                                                        <div class="price" style="height:19px;">
                                                            <span class="reducedfrom"><c:out value="${prixVenteInteger}"/> MAD</span>
                                                            <span class="actual"><c:out value="${row.prix_vente}"/> MAD</span>
                                                        </div>
                                                        <div class="cart-button"> <!-- ici quand on clique sur details j'envoie id de produit et d'annonce dans url-->
                                                            <div class="cart">
                                                                <a class="button" href="info_produit.jsp?id_produit=${row.id_produit}&prixVenteInteger=${prixVenteInteger}"><span style="color:orangered">Details</span></a>
                                                            </div>                                                            
                                                            <a class="button" href="AjoutProduitPanier?idProduit=${row.id_produit}"><span style="color:orangered">Cart</span></a>
                                                            <div class="clear"></div>
                                                        </div>
                                                    </div>
                                                </div><div class="clear"></div>
                                            </div>															
                                        </div>
                                        </c:forEach>
                                        <!-- fin: annonce -->
                                        
                                    </div>												
                                </div>                            
                            </div>
                            
<%@include file='./footer.jsp'%>                            


    	
    	
            
