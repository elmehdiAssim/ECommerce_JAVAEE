<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='./header.jsp'%>
<title>produit annonce</title>
                    
                    <div class="span9">
			<div class="content">
                            <div class="module">
				<div class="module-head">
                                    <h3>la liste des produits</h3>
				</div>
				<div class="module-body"> 
                                    <br /> 
                                    <div class="module-body table">                                        
					<table cellpadding="0" cellspacing="0" border="0" class="datatable-1 table table-bordered table-striped	display" width="100%">
                                            <sql:query var="produit" dataSource="${dataSource}">
                                                select * from Produit
                                            </sql:query>                                            
					    <thead>
						<tr>
						    <th>Désignation</th>
                                                    <th>Marque</th>						    
                                                    <th>Image</th>
                                                    <th>Ajouter Annonce</th>													
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="row" items="${produit.rows}">
                                                    <c:set var="id_annonce" value="${row.id_annonce}"/>
                                                    <tr class="odd gradeX">
                                                        <td><c:out value="${row.designation}"/><c:out value="${row.designation}"/></td>
                                                        <td><c:out value="${row.marque}"/></td>                                                        
                                                        <td style="text-align:center;vertical-align:middle;"><img src="../phoneImage/${row.image_link}" width="110px" height="110px"/></td>
                                                        <c:choose>
                                                            <c:when test="${id_annonce == null}">
                                                                <td style="text-align:center;vertical-align:middle;font-weight:bold">
                                                                    <a href="ajouter_annonce.jsp?id_produit=${row.id_produit}"><u>ajouter</u></a>
                                                                </td>
                                                            </c:when>
                                                            <c:otherwise>
                                                                    <td style="text-align:center;vertical-align:middle;font-weight:bold">
                                                                        <a href="SuppAnnonce?id_produit=${row.id_produit}">
                                                                            <u style="color:red">supprimer</u></a>
                                                                    </td>
                                                            </c:otherwise> 
                                                        </c:choose>                                                        												
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
</html>
