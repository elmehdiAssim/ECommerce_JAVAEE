<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='./header.jsp'%>
<title>message Client </title>

                <div class="span9">
                    <div class="content">
                        <div class="module">
                            <div class="module-head">
                                <h3>Messages des clients</h3>
                            </div>
                            <div class="module-option clearfix">
                                <form>
                                    <div class="input-append pull-left">
                                        <input type="date" class="span3" placeholder="date...">
                                        <button type="submit" class="btn">
                                            <i class="icon-search"></i>
                                        </button>
                                    </div>
                                </form>									
                            </div>
                            <div class="module-body"> 
                                 <div class="row-fluid">	
                                    <!-- début message client-->
                                    <sql:query var="message" dataSource="${dataSource}">
                                        select * from Message inner join Membre on Message.id_membre=Membre.id_membre
                                            order by date_envoi desc
                                    </sql:query>
                                    <c:forEach var="row" items="${message.rows}">
                                        <div class="media stream">                                            
                                        <a href="#" class="media-avatar medium pull-left">
                                            <img src="images/user.png">
                                        </a>
                                        <div class="media-body">
                                            <div class="stream-headline">
                                                <h5 class="stream-author" style="color:blue">
                                                    <c:out value="${row.prenom}"/> <c:out value="${row.nom}"/>
                                                    <small class="pull-right" style="font-size:12px"><c:out value="${row.date_envoi}"/></small>														
                                                </h5>													
                                            </div>
                                            <div class="stream-text">
                                                <c:out value="${row.message}"/>
                                            </div> 
                                            <br/>
                                            <c:choose>
                                                <c:when test="${row.reponse == null}">                                                    
                                                    <form action="EnvoiEmail" method="post">           
                                                        <input type="hidden" name="email" value="${row.email}"/>
                                                        <input type="hidden" name="id_message" value="${row.id_message}"/>
                                                        <textarea name="reponse" class="span12" style="height: 70px;"></textarea>                                                                                               
                                                        <input type="submit" value="Envoyer" class="btn btn-medium btn-primary">
                                                    </form>
                                                </c:when>
                                                <c:otherwise>                                                    
                                                    <p style="color:red; font-size:12px; font-weight:bold">
                                                        &emsp;&emsp;&emsp; Votre réponse: 
                                                        ( <c:out value="${row.reponse}"/> )
                                                    </p>
                                                </c:otherwise>
                                            </c:choose>
                                            						
                                        </div>
                                    </div>
                                    </c:forEach><!--/.Fin message clients-->

                                    <div class="media stream load-more">
                                        <a href="#">
                                            <i class="icon-refresh shaded"></i>
                                                show more...
                                        </a>
                                    </div>
                                </div>                                    									
                            </div><!-- /.module-body-->
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
