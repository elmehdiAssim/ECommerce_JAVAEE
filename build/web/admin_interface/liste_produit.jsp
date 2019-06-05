<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='./header.jsp'%>
<title>liste des produits</title>
                    
                    <div class="span9">
			<div class="content">
                            <div class="module">
				<div class="module-head">
                                    <h3>la liste des produits</h3>
				</div>
				<div class="module-body"> 
                                    <br /> 
                                    <div class="module-body table">                                    
                                        <table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped display" width="100%">
                                        <sql:query var="produit" dataSource="${dataSource}">
                                            select * from Produit
                                        </sql:query>
					<thead>
					    <tr>
                                                <th>Désignation</th>
						<th>Marque</th>
	 					<th>Prix achat / Vente</th>						
						<th>Taux de remise</th>
						<th>Quantité Stock</th>
						<th>Editer</th>
					    </tr>
					</thead>
					<tbody>
                                            <c:forEach var="row" items="${produit.rows}">
                                                <tr class="odd gradeX">
                                                    <td><c:out value="${row.designation}"/></td>
                                                    <td>
                                                        <p><c:out value="${row.marque}"/></p>
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
                                                    </td>
                                                    <td><c:out value="${row.prix_achat}"/> MAD / <c:out value="${row.prix_vente}"/> MAD</td>
                                                    
                                                    <td><c:out value="${row.taux_remise}"/> %</td>
                                                    <td><c:out value="${row.quantite_stock}"/></td>
                                                    <td><a href="modifier_produit.jsp?id_produit=${row.id_produit}" class="pull-left" style="font-weight:bold">
                                                            <u>éditer</u></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
					</tbody>											
				    </table>
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

<style>
/* Début star percentage decoration **********************/
.ratings {
  position: relative;
  vertical-align: middle;
  display: inline-block;
  color: #b1b1b1;
  overflow: hidden;
}

.full-stars{
  position: absolute;
  left: 0;
  top: 0;
  white-space: nowrap;
  overflow: hidden;
  color: #fde16d;
}

.empty-stars:before,
.full-stars:before {
  content: "\2605\2605\2605\2605\2605";
  font-size: 14pt;
}

.empty-stars:before {
  -webkit-text-stroke: 1px #848484;
}

.full-stars:before {
  -webkit-text-stroke: 1px orange;
}

/* Webkit-text-stroke is not supported on firefox or IE */
/* Firefox */
@-moz-document url-prefix() {
  .full-stars{
    color: #ECBE24;
  }
}
/* IE */

.full-stars{
    color: #ECBE24;
 }
/* Fin star percentage decoration ************************/    
</style>
</html>
