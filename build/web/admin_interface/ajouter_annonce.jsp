<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='./header.jsp'%>
<title>ajouter annonce</title>
                    
                    <div class="span9">
			<div class="content">		
                            <div class="module">
				<div class="module-head">
                                    <h3>ajouter une annonce</h3>
				</div>
				<div class="module-body"> 
                                    <br/> 
				    <form action="AjoutAnnonce" method="post" class="form-horizontal row-fluid">                                        
                                        
                                        <sql:query var="produit" dataSource="${dataSource}">
                                            select * from Produit where id_produit=${param.id_produit}
                                        </sql:query>
                                                
					<c:forEach var="row" items="${produit.rows}">
                                            
                                            <input name="idProduit" value="${param.id_produit}" type="hidden"/>
                                            
                                            <div class="control-group">
                                                <label class="control-label">Designation</label>
                                                <div class="controls">
                                                    <input type="text" name="designation" value="${row.designation}" placeholder="désignation" class="span8 tip" disabled>
                                                </div>
                                            </div> 

                                            <div class="control-group">
                                                <label class="control-label">Marque</label>
                                                <div class="controls">
                                                    <input type="text" name="marque" value="${row.marque}" placeholder="marque" class="span8 tip" disabled>
                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <label class="control-label">Couleur</label>
                                                <div class="controls">
                                                    <input type="text" name="couleur" value="${row.couleur}" placeholder="couleur" class="span8 tip" disabled>
                                                </div>
                                            </div>				

                                            <div class="control-group">
                                                <label class="control-label">Connexion</label>
                                                <div class="controls">
                                                    <input type="text" name="connexion" value="${row.connexion}" placeholder="connexions" class="span8 tip" disabled>
                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <label class="control-label">Type de Batterie</label>
                                                <div class="controls">
                                                    <input type="text" name="typeBatterie" value="${row.type_batterie}" placeholder="type de batterie" class="span8 tip" disabled>
                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <label class="control-label">Prix d'achat</label>
                                                <div class="controls">
                                                    <div class="input-append">
                                                        <input type="text" name="prixAchat" value="${row.prix_achat}" placeholder="0.000" class="span8" size="40px" disabled>
                                                        <span class="add-on">MAD</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <label class="control-label">Prix de vente</label>
                                                <div class="controls">
                                                    <div class="input-append">
                                                        <input type="text" name="prixVente" value="${row.prix_vente}" placeholder="0.000" class="span8" size="40px" disabled>
                                                        <span class="add-on">MAD</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <label class="control-label">Taux de remise</label>
                                                <div class="controls">
                                                    <div class="input-append">
                                                        <input type="text" name="tauxRemise" value="${row.taux_remise}" placeholder="0.00" class="span8" size="43px" disabled>
                                                        <span class="add-on">%</span> 
                                                    </div>
                                                </div>
                                            </div>	

                                            <div class="control-group">
                                                <label class="control-label">Quantité en Stock</label>
                                                <div class="controls">
                                                    <div class="input-append">
                                                        <input type="text" name="quantiteStock" value="${row.quantite_stock}" placeholder="0" class="span8" size="40px" disabled>
                                                        <span class="add-on">Unités</span> 
                                                    </div>
                                                </div>
                                            </div>
					</c:forEach>						
					<div class="control-group">
                                            <label class="control-label">Description</label>
                                            <div class="controls">
						<textarea name="description" class="span8" rows="5"></textarea>
                                            </div>
					</div>									
											
					<div class="control-group">
                                            <div class="controls">
						<button type="submit" class="btn btn-large btn-success">Create</button>
                                            </div>
					</div>											  
                                    </form>									
				</div><!-- /.module-body-->
                            </div><!-- /.module-->						
			</div><!--/.content-->						
                    </div> <!--/.span9-->         
                </div><!--/.row-->
            </div><!--/.container-->
        </div><!--/.wrapper-->
        
        <div class="footer">
            <div class="container">
                <b class="copyright">
            </div>
        </div>        
        		
</body>
</html>
