<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='./header.jsp'%>
<title>commandes</title>
                    
                    <div class="span9">
			<div class="content">
                            <div class="module">
                            <div class="module-head">
				<h3>Commandes</h3>
                            </div>                                
                            <div class="module-option clearfix">
				<form>
                                    <div class="input-append pull-left">
					<input type="text" class="span3" placeholder="date..." id="datepicker">
					<button type="submit" class="btn">
                                            <i class="icon-search"></i>
					</button>
                                    </div>
				</form>									
                            </div>
                            <div class="module-body">									
				<div class="row-fluid">	
                                    
                                    <!-- Débur : infos Commande -->
                                    <sql:query var="commande" dataSource="${dataSource}">
                                            select * from Commande inner join Membre on 
                                                Commande.id_membre=Membre.id_membre
                                                    order by date_commande desc
                                    </sql:query>
                                    <c:forEach var="row" items="${commande.rows}">
                                        <div class="media stream">	
                                            <h5 class="stream-author" style="color:blue">
                                                ###Commande Numéro: <c:out value="${row.id_commande}" />																									
                                            </h5>
                                            <a href="#" class="media-avatar medium pull-left">
                                                <img src="images/user.png">
                                            </a>
                                            <div class="media-body">
                                                <div class="stream-headline">
                                                    <h5 class="stream-author" style="color:green">
                                                        Informations de Client :
                                                        <small class="pull-right" style="font-size:12px">date de réalisation: <c:out value="${row.date_commande}"/></small>														
                                                    </h5>													
                                                </div>
                                                <table class="table table-striped table-bordered table-condensed">
                                                    <thead>
                                                        <tr>													  
                                                            <th>NOM</th>
                                                            <th>PRENOM</th>
                                                            <th>USERNAME</th>
                                                            <th>EMAIL</th>
                                                            <th>TEL</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>													  
                                                            <td><c:out value="${row.nom}"/></td>
                                                            <td><c:out value="${row.prenom}"/></td>
                                                            <td><c:out value="${row.mot_utilisateur}"/></td>
                                                            <td><c:out value="${row.email}"/></td>
                                                            <td><c:out value="${row.tel}"/></td>
                                                        </tr>													
                                                    </tbody>
                                                </table>
                                                <div class="stream-headline">
                                                    <h5 class="stream-author" style="color:green">
                                                        Détails commande :																											
                                                    </h5>
                                                </div>
                                                <sql:query var="ligneCommande" dataSource="${dataSource}">
                                                        select * from LigneCommande inner join Produit on 
                                                            LigneCommande.id_produit=Produit.id_produit 
                                                                where id_commande = ${row.id_commande} 
                                                </sql:query>  
                                                             
                                                <table class="table table-striped table-bordered table-condensed">
                                                    <thead>
                                                        <tr>													  
                                                            <th>NOM PRODUIT</th>
                                                            <th>PRIX UNITAIRE</th>
                                                            <th>Taux de Remise</th>
                                                            <th>QUANTITE</th>
                                                            <th>TOTAL</th>													  
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:set var="prixTotal" value="${0}"/>
                                                    <c:forEach var="row2" items="${ligneCommande.rows}">
                                                        <!-- obtenir la partie entière du prix de vente après remise-->
                                                        <c:set var="prixVenteApresRemise" value="${row2.prix_vente-row2.prix_vente*row2.taux_remise/100}"/>                                            
                                                        <fmt:parseNumber var="prixVenteInteger" integerOnly="true" type="number" value="${prixVenteApresRemise}" />
                                                        <c:set var="prixTotal" value="${prixTotal+prixVenteInteger}"/>
                                                        
                                                        <!-- Fin -->
                                                        <tr>													  
                                                            <td><c:out value="${row2.designation}"/></td>
                                                            <td><c:out value="${row2.prix_vente}"/> MAD</td>
                                                            <td><c:out value="${row2.taux_remise}"/>%</td>
                                                            <td><c:out value="${row2.quantite_commandee}"/></td>
                                                            <td><c:out value="${prixVenteInteger}"/> MAD</td>
                                                        </tr>
                                                    </c:forEach>
                                                        <tr>													  
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td style="color:red">Total: <c:out value="${prixTotal}"/> MAD</td>
                                                        </tr>
                                                        <tr>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: black; font-weight:bold">ADRESSE LIVRAISON</td>
                                                            <td><c:out value="${row.adresse_livraison}"/></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="color: black; font-weight:bold">N° COMPTE</td>
                                                            <td><c:out value="${row.num_ComptePaiement}"/></td>
                                                            <td></td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                                
                                                <br/>                                            
                                            </div>                                
                                        </div>
                                    </c:forEach><!-- Fin : info Commande-->
                                    
                                    <div class="media stream load-more">
                                        <a href="#">
                                            <i class="icon-refresh shaded"></i>
                                            show more...
                                        </a>
                                    </div>
				</div>
                            </div>						
			</div><!--/.content-->						
                    </div><!--/.span9-->
		</div>
            </div><!--/.container-->
	</div><!--/.wrapper-->	
        
        <div class="footer">
            <div class="container">
                <b class="copyright">
            </div>
        </div>
        
</body>
</html>
