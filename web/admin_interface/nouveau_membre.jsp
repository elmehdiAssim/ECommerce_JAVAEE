<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='./header.jsp'%>
<title>membres</title>

<sql:update dataSource="${dataSource}" var="count">  
    update Membre set vu=1;  
</sql:update> 
                    
                    <div class="span9">
			<div class="content">
                            <div class="module">
				<div class="module-head">
                                    <h3>Membres</h3>
				</div>
			    <div class="module-option clearfix">
                                <form>
                                    <div class="input-append pull-left">
                                        <input type="text" class="span3" placeholder="nom...">
                                        <button type="submit" class="btn">
                                            <i class="icon-search"></i>
                                        </button>
                                    </div>
                                </form>									
                            </div>
                            <div class="module-body">									
                                <div class="row-fluid">	
                                    <!-- début notification nouveau memebre-->
                                    <sql:query var="membre" dataSource="${dataSource}">
                                            select * from Membre where categorie = 'client'
                                    </sql:query>
                                    <c:forEach var="row" items="${membre.rows}">
                                        <div class="media stream">
                                        <a href="#" class="media-avatar medium pull-left">
                                            <img src="images/user.png">
                                        </a>
                                        <div class="media-body">
                                            <div class="stream-headline">
                                                <h5 class="stream-author" style="color:blue">
                                                    <c:out value="${row.mot_utilisateur}" />
                                                    <small class="pull-right" style="font-size:12px">date d'inscription: <c:out value="${row.date_inscription}" /></small>														
                                                </h5>													
                                            </div>
                                            <table class="table table-striped">
                                                <thead>
                                                    <tr>													  
                                                        <th>NOM</th>
							<th>PRENOM</th>
							<th>USERNAME</th>
							<th>Tel</th>
							<th>Email</th>
						    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td><c:out value="${row.nom}" /></td>
							<td><c:out value="${row.prenom}" /></td>
							<td><c:out value="${row.mot_utilisateur}" /></td>
							<td><c:out value="${row.tel}" /></td>
							<td><c:out value="${row.email}" /></td>
                                                    </tr>													
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    </c:forEach><!--/.media .stream-->
																		
                                    <div class="media stream load-more">
                                        <a href="#">
                                            <i class="icon-refresh shaded"></i>
                                            show more...
                                        </a>
                                    </div>
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
