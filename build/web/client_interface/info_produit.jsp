<title>about the product</title>
<%@include file='./header.jsp'%>
                            
                    <div class="banner-top">
			<div class="header_bottom_right_images">
                            <div class="about_wrapper">
                                <h1>Détailles du produit</h1> 
                            </div>
                                <div class="about-group">
                                    <div>
                                        <sql:query var="produit" dataSource="${dataSource}">
                                            select * from Produit inner join Annonce on 
                                                Produit.id_annonce=Annonce.id_annonce where Produit.id_produit=${param.id_produit} 
                                        </sql:query>
                                        <c:forEach var="row" items="${produit.rows}">      
                                            <c:set var="idProduit" value="${row.id_produit}"/> <!-- obtenir idproduit pour l'évaluation du produit-->
                                            <div class="about-top">	
                                                <div class="grid images_3_of_1">
                                                    <img src="../phoneImage/${row.image_link}" width="400" height="230"/>   <!-- ici on va mettre une image de 245*200 -->
                                                    <br/>
                                                    <a href="AjoutProduitPanier?idProduit=${row.id_produit}" style="font-weight:bold;padding-left:3em"><u>add to cart</u></a>
                                                </div>
                                                <div class="grid span_2_of_3">
                                                    <h3 style="color:black; font-weight:bold; font-size:24px">
                                                        <c:out value="${row.designation}"/> 
                                                        &emsp;&emsp;--
                                                        <c:out value="${param.prixVenteInteger}"/> MAD
                                                    </h3>
                                                    <!-- Début star evaluation -->                                                    
                                                    <c:set var="count" value="${0}"/>
                                                    <c:set var="totalNbrEtoile" value="${0}"/>
                                                    <sql:query var="evaluationProduit" dataSource="${dataSource}">                                            
                                                        select *  from EvaluationProduit where id_produit=${param.id_produit}
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
                                                    <br/><br/>
                                                    <p><c:out value="${row.description}"/></p>
                                                    <br/>
                                                    <table>
                                                        <tr>
                                                            <td><h3 style="font-weight:bold">More details :</h3></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p style="font-weight:bold">Brand :</p></td>
                                                            <td><p><c:out value="${row.marque}"/></p></td>                                                            
                                                        </tr>
                                                        <tr>
                                                            <td><p style="font-weight:bold">Colour :</p></td>
                                                            <td><p><c:out value="${row.couleur}"/></p></td>                                                            
                                                        </tr>
                                                        <tr>
                                                            <td><p style="font-weight:bold">Connexion :</p></td>
                                                            <td><p><c:out value="${row.connexion}"/></p></td>                                                            
                                                        </tr>
                                                        <tr>
                                                            <td><p style="font-weight:bold">Battery :&emsp;</p></td>
                                                            <td><p><c:out value="${row.type_batterie}"/></p></td>                                                            
                                                        </tr>                    
                                                    </table>                                                   
                                                                                                         
                                                </div><div class="clear"></div> 
                                            </div>
                                            <br/><br/><br/>                     
                                            <div class="clear"></div>
                                        </c:forEach>
                                    </div>
                                    
                                    <div class="team">
                                        <form action="AjoutEvaluation" method="post">
                                            <h2 style="font-weight:bold">Share Your Review :</h2>
                                            <div class="cont">
                                                <div class="stars">                                                
                                                    <input class="star star-5" id="star-5-2" type="radio" name="star" value="5"/>
                                                    <label class="star star-5" for="star-5-2"></label>
                                                    <input class="star star-4" id="star-4-2" type="radio" name="star" value="4"/>
                                                    <label class="star star-4" for="star-4-2"></label>
                                                    <input class="star star-3" id="star-3-2" type="radio" name="star" value="3"/>
                                                    <label class="star star-3" for="star-3-2"></label>
                                                    <input class="star star-2" id="star-2-2" type="radio" name="star" value="2"/>
                                                    <label class="star star-2" for="star-2-2"></label>
                                                    <input class="star star-1" id="star-1-2" type="radio" name="star" value="1"/>
                                                    <label class="star star-1" for="star-1-2"></label>                                                
                                                </div>
                                            </div>
                                            <div class="section group">
                                                <div class="col span_2_of_c">
                                                    <div class="contact-form">                                                           					    
                                                        <div>
                                                            <span><label>COMMENT</label></span>
                                                            <span><textarea id="comment" name="commentaire"></textarea></span>									
                                                            <span><input type="submit" value="Share"></span> 						  
                                                        </div>                                                           
                                                    </div>
                                                </div><div class="clear"></div>
                                            </div>
                                            <input type="hidden" name="id_produit" value="${idProduit}"/>
                                            <input type="hidden" name="prixVenteInteger" value="${param.prixVenteInteger}"/>
                                        </form> 
                                        <br/><br/>
                                        
                                        <h2 style="font-weight:bold">Customers Reviews :</h2> 
                                        <br/>
                                        
                                        <!-- afficher les évaluation des clients-->
                                        <sql:query var="evaluation" dataSource="${dataSource}">
                                            select * from EvaluationProduit inner join Membre on 
                                                EvaluationProduit.id_membre=Membre.id_membre where id_produit=${param.id_produit}
                                                    order by date_publication
                                        </sql:query>
                                        <c:forEach var="row" items="${evaluation.rows}">
                                            <div class="about-top">	
                                                <div class="grid images_1_of_1">
                                                    <img src="images/client.png" height="70" width="60"/> 
                                                </div>
                                                <div class="grid span_2_of_3">                                                
                                                    <h3>
                                                        <span style="color:blue;font-weight:bold;font-size:18px"><c:out value="${row.mot_utilisateur}"/></span>
                                                        <span class="pull-right" style="font-size:13px;color:gray">published: <c:out value="${row.date_publication}"/></span>
                                                    </h3>
                                                    <p><c:out value="${row.commentaire}"/></p>  
                                                    <c:set var="nombreEtoile" value="${row.nombre_etoile}"/>
                                                    <c:forEach var="j" begin="1" end="5">
                                                        <c:choose>
                                                            <c:when test="${j <= row.nombre_etoile}">
                                                                <span class="fa fa-star checked"></span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="fa fa-star"></span>
                                                            </c:otherwise>    
                                                        </c:choose>                                                                                                  
                                                    </c:forEach>
                                                    <div class="pull-right" style="color:blue; font-weight: bold; font-size:13px">
                                                        <input type="hidden" id="${row.id_evaluation}" value="${row.commentaire}"/>
                                                        <a href="javascript:modify(${row.id_evaluation})" >
                                                            <u>modify</u>
                                                        </a>&nbsp;&nbsp;
                                                        <a href="#">
                                                            <u>delete</u>
                                                        </a>
                                                    </div>
                                                                
                                                </div><div class="clear"></div>                                                                    
                                            </div>
                                        </c:forEach>
                                        <!-- Fin -->
                                        
                                        <hr>									    
                                    </div>				  
                                </div>
                            </div>
                        
                            
<%@include file='./footer.jsp'%>     

<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-46156385-1', 'cssscript.com');
  ga('send', 'pageview');

function modify(ID){
    var text = document.getElementById(ID).value;
    document.getElementById('comment').value = text;
    
}
</script>