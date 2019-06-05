<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='./header.jsp'%>
<title>ajout produit</title>
                    
                    <div class="span9">
			<div class="content">		
                            <div class="module">
				<div class="module-head">
                                    <h3>ajout produit</h3>
				</div>
				<div class="module-body"> 
                                    <br/> 
				    <form action="AjoutProduit" method="post" class="form-horizontal row-fluid">										
										
					<div class="control-group">
                                            <label class="control-label">Designation</label>
                                            <div class="controls">
						<input type="text" name="designation" placeholder="désignation" class="span8 tip">
                                            </div>
					</div> 
											
					<div class="control-group">
                                            <label class="control-label">Marque</label>
                                            <div class="controls">
						<input type="text" name="marque" placeholder="marque" class="span8 tip">
                                            </div>
					</div>
											
					<div class="control-group">
                                            <label class="control-label">Couleur</label>
                                            <div class="controls">
						<input type="text" name="couleur" placeholder="couleur" class="span8 tip">
                                            </div>
					</div>					
										
					<div class="control-group">
                                            <label class="control-label">Connexion</label>
                                            <div class="controls">
						<input type="text" name="connexion" placeholder="connexions" class="span8 tip">
                                            </div>
					</div>
											
					<div class="control-group">
                                            <label class="control-label">Type de Batterie</label>
                                            <div class="controls">
                                                <input type="text" name="typeBatterie" placeholder="type de batterie" class="span8 tip">
                                            </div>
					</div>
										
					<div class="control-group">
                                            <label class="control-label">Prix d'achat</label>
                                            <div class="controls">
						<div class="input-append">
                                                    <input type="text" name="prixAchat" placeholder="0.000" class="span8" size="40px">
                                                    <span class="add-on">MAD</span>
						</div>
                                            </div>
					</div>
											
					<div class="control-group">
                                            <label class="control-label">Prix de vente</label>
                                            <div class="controls">
						<div class="input-append">
                                                    <input type="text" name="prixVente" placeholder="0.000" class="span8" size="40px">
                                                    <span class="add-on">MAD</span>
						</div>
                                            </div>
					</div>
											
					<div class="control-group">
                                            <label class="control-label">Taux de remise</label>
                                            <div class="controls">
						<div class="input-append">
                                                    <input type="text" name="tauxRemise" placeholder="0.00" class="span8" size="43px">
                                                    <span class="add-on">%</span> 
						</div>
                                            </div>
					</div>
                                        
                                        <div class="control-group">
                                            <label class="control-label">Quantité en Stock</label>
                                            <div class="controls">
						<div class="input-append">
                                                    <input type="text" name="quantiteStock" placeholder="0" class="span8" size="40px">
                                                    <span class="add-on">Unités</span> 
						</div>
                                            </div>
					</div>
											
					<!-- to upload image-->  
					<div class="control-group">
                                            <div class="controls">
						<input type="file" name="imageLink" class="file">
						<div class="input-group col-xs-12">
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-picture"></i></span>
                                                    <input type="text" placeholder="Upload Image" class="span8" disabled >
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
