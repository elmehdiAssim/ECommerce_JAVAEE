<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='./header.jsp'%>
<title>modifier produit</title>
                    
                    <div class="span9">
			<div class="content">		
                            <div class="module">
				<div class="module-head">
                                    <h3>modification produit</h3>
				</div>
				<div class="module-body"> 
                                    <br/> 
				    <form class="form-horizontal row-fluid">	
                                        
                                        <sql:query var="produit" dataSource="${dataSource}">
                                                select * from Produit where id_produit=${param.id_produit}
                                        </sql:query>
					
                                        <c:forEach var="row" items="${produit.rows}">
                                            <div class="control-group">
                                                <label class="control-label">Designation</label>
                                                <div class="controls">
                                                    <input type="text" name="designation" value="${row.designation}" class="span8 tip">
                                                </div>
                                            </div> 

                                            <div class="control-group">
                                                <label class="control-label">Marque</label>
                                                <div class="controls">
                                                    <input type="text" name="marque" value="${row.marque}" class="span8 tip">
                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <label class="control-label">Couleur</label>
                                                <div class="controls">
                                                    <input type="text" name="couleur" value="${row.couleur}" class="span8 tip">
                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <label class="control-label" for="basicinput">Connexion</label>
                                                <div class="controls">
                                                    <input type="text" name="connexion" value="${row.connexion}" class="span8 tip">
                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <label class="control-label">Type de Batterie</label>
                                                <div class="controls">
                                                    <input type="text" name="typeBatterie" value="${row.type_batterie}" class="span8 tip">
                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <label class="control-label">Prix d'achat</label>
                                                <div class="controls">
                                                    <div class="input-append">
                                                        <input type="text" name="prixAchat" value="${row.prix_achat}" class="span8" size="40px">
                                                        <span class="add-on">MAD</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <label class="control-label">Prix de vente</label>
                                                <div class="controls">
                                                    <div class="input-append">
                                                        <input type="text" name="prixVente" value="${row.prix_vente}" class="span8" size="40px">
                                                        <span class="add-on">MAD</span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="control-group">
                                                <label class="control-label">Taux de remise</label>
                                                <div class="controls">
                                                    <div class="input-append">
                                                        <input type="text" name="tauxRemise" value="${row.taux_remise}" class="span8" size="43px">
                                                        <span class="add-on">%</span> 
                                                    </div>
                                                </div>
                                            </div>	

                                            <div class="control-group">
                                                <label class="control-label">Quantité en Stock</label>
                                                <div class="controls">
                                                    <div class="input-append">
                                                        <input type="text" name="quantiteStock" value="${row.quantite_stock}" class="span8" size="40px">
                                                        <span class="add-on">Unités</span> 
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- to upload image-->  
                                            <div class="control-group">
                                                <div class="controls">
                                                    <input type="file" name="img[]" class="file">
                                                    <div class="input-group col-xs-12">
                                                        <span class="input-group-addon"><i class="glyphicon glyphicon-picture"></i></span>
                                                        <input type="text" name="imageLink" value="${row.image_link}" class="span8" disabled >
                                                        <span class="input-group-btn">
                                                            <button class="browse btn btn-primary input-lg" type="button">
                                                                <i class="glyphicon glyphicon-search"></i>Browse...
                                                            </button>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- /. -->									

                                            <div class="control-group">
                                                <div class="controls">
                                                    <button type="submit" class="btn btn-large btn-success">Enregistrer</button>
                                                </div>
                                            </div>
                                        </c:forEach>
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
	
	<script>
            $(document).on('click', '.browse', function(){
                var file = $(this).parent().parent().parent().find('.file');
		file.trigger('click');
            });
            $(document).on('change', '.file', function(){
                $(this).parent().find('.span8').val($(this).val().replace(/C:\\fakepath\\/i, ''));
            });
	</script>
	<style>
            .file {
                visibility: hidden;
                position: absolute;
            }
	</style>
        
</body>
</html>
