<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='./header.jsp'%>
<title>evaluation produit</title>

<sql:update dataSource="${dataSource}">  
    update EvaluationProduit set vu=1;  
</sql:update> 

                <div class="span9">
                    <div class="content">
                        <div class="module">
                            <div class="module-head">
                                <h3>Commentaires des Clients</h3>
                            </div>
                            <div class="module-option clearfix">
                                <form>
                                    <div class="input-append pull-left">
                                        <input type="text" class="span3" placeholder="produit...">
                                        <button type="submit" class="btn">
                                            <i class="icon-search"></i>
                                        </button>
                                    </div>
                                </form>									
                            </div>
                            <div class="module-body">									
                                <div class="stream-list">	
                                    <!-- Début des évaluations des client sur les produit-->
                                    <sql:query var="evaluationProduit" dataSource="${dataSource}">
                                            select * from EvaluationProduit inner join Membre on 
                                                EvaluationProduit.id_membre = Membre.id_membre 
                                                    inner join Produit on EvaluationProduit.id_produit = Produit.id_produit
                                                        order by date_publication desc
                                    </sql:query>
                                    <c:forEach var="row" items="${evaluationProduit.rows}">
                                        <div class="media stream">
                                            <a href="#" class="media-avatar medium pull-left">
                                                <img src="images/user.png">
                                            </a>
                                            <div class="media-body">
                                                <div class="stream-headline">
                                                    <h5 class="stream-author">
                                                        <c:out value="${row.nom}"/> <c:out value="${row.prenom}"/>														
                                                        <small>(<c:out value="${row.designation}"/>)</small>
                                                        <small class="pull-right">
                                                            publié le: <c:out value="${row.date_publication}"/>
                                                        </small>
                                                    </h5>
                                                    <div class="stream-text">
                                                        <c:out value="${row.commentaire}"/> 														
                                                    </div>
                                                    <div>
                                                        <c:forEach var="j" begin="1" end="5">
                                                            <c:choose>
                                                                <c:when test="${j <= row.nombre_etoile}">
                                                                    <span><img src="images/checked_star.png"/></span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span><img src="images/unchecked_star.png"/></span>
                                                                </c:otherwise>
                                                            </c:choose>                                            	
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <form action="SuppEvaluation" method="post">
                                                    <input type="hidden" name="id_evaluation" value="${row.id_evaluation}"/>
                                                    <button type="submit" class="btn btn-mini btn-danger">Supprimer</button>
                                                </form>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <!-- Fin des évaluations des client sur les produit-->


                                    <div class="media stream load-more">
                                        <a href="#">
                                            <i class="icon-refresh shaded"></i>
                                                show more...
                                        </a>
                                    </div>
                                </div><!-- /.stream-list -->								
                            </div><!-- /.module-body -->
                        </div><!-- /.module -->						
                    </div><!--/.content-->						
                </div><!--/.span9-->        
            </div><!-- /.row-->
        </div><!--/.container-->
    </div><!--/.wrapper-->	

    <div class="footer">
        <div class="container">
            <b class="copyright">
        </div>
    </div>

</body>
</html>

