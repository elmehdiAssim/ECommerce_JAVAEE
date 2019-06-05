<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='./header.jsp'%>
<title>charts</title>

                    <div class="span9">
			<div class="content">
                            
                            <jsp:useBean id="now" class="java.util.Date" />
                            <fmt:formatDate var="currentYear" value="${now}" pattern="yyyy" />
                            <c:set var="activityYear" value="2017" />                     
                            
                            <!-- les compteurs : -->
                            <div class="module">                                
				<div class="module-head">
                                    <h3>Les compteurs :</h3>
				</div>
				<div class="module-body"> 
                                    <div class="row-fluid">
                                        <div class="span6">
                                            <div class="media user">
                                                <a class="media-avatar pull-left" href="#">
                                                    <div class="circle-text"><div>I'm a Circle!</div></div>
                                                </a>
                                                <div class="media-body">
                                                    <h3 class="media-title">
                                                        Total Visites
                                                    </h3>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    <div class="span6">
                                        <div class="media user">
                                            <a class="media-avatar pull-left" href="#">
                                                <div class="circle-text"><div>I'm a Circle!</div></div>
                                            </a>
                                            <div class="media-body">
                                                <h3 class="media-title">
                                                    Total Clients
                                                </h3>                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--/.row-fluid-->          
                                <div class="row-fluid">
                                        <div class="span6">
                                            <div class="media user">
                                                <a class="media-avatar pull-left" href="#">
                                                    <div class="circle-text"><div>I'm a Circle!</div></div>
                                                </a>
                                                <div class="media-body">
                                                    <h3 class="media-title">
                                                        Total Articles Vendus
                                                    </h3>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                    <div class="span6">
                                        <div class="media user">
                                            <a class="media-avatar pull-left" href="#">
                                                <div class="circle-text"><div>I'm a Circle!</div></div>
                                            </a>
                                            <div class="media-body">
                                                <h3 class="media-title">                                                    
                                                    Total Messages Envoyés
                                                </h3>                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--/.row-fluid--> 
                            </div>
                            </div>
                            <!-- les compteurs : fin -->
                            
                            <!-- Début : ici commence les charts -->
                            <div class="module">                                
				<div class="module-head">
                                    <h3>profit par mois</h3>
				</div>
				<div class="module-body"> 
                                    <form class="form-horizontal row-fluid">
                                        <div class="control-group">                                        
                                            <div class="controls">
                                                <select onchange="profilParMois()" id="profilParMoisSelect" class="span8">   
                                                    <c:forEach var="j" begin="${activityYear}" end="${currentYear}">
                                                        <option value="${j}">${j}</option>
                                                    </c:forEach>                                                        
                                                </select>
                                            </div>
                                        </div>
                                    </form><br/>
                                    <p style="text-align: center">
                                        <img id="profilParMoisImg" src="ProfilParMois"/>
                                    </p>                                    									
				</div><!-- /.module-body-->
                            </div><!-- Fin : ici commence les charts -->                    
                            
                            <!-- Début : ici commence les charts -->
                            <div class="module">
				<div class="module-head">
                                    <h3>quantite d'achat de produit</h3>
				</div>
				<div class="module-body"> 
                                    <form class="form-horizontal row-fluid">
                                        <div class="control-group">                                        
                                            <div class="controls">                                                
                                                <sql:query var="produit" dataSource="${dataSource}">
                                                    select * from Produit where id_annonce is not null
                                                </sql:query>
                                         
                                                 <select onchange="quantiteProduit()" id="quantiteProduitSelect" class="span8"> 
                                                    <c:forEach var="row" items="${produit.rows}">
                                                        <option value="${row.id_produit}">${row.designation}</option>
                                                    </c:forEach>                                                                                                         
                                                </select>                                                 
                                            </div>
                                        </div>
                                    </form><br/>
                                    <p style="text-align: center">
                                        <img id="quantiteProduitImg" src="QuantiteProduit"/>
                                    </p>                                    									
				</div><!-- /.module-body-->
                            </div><!-- Fin : ici commence les charts --> 
                            
                            <!-- Début : ici commence les charts -->
                            <div class="module">
				<div class="module-head">
                                    <h3>pourcentage d'achat par marque</h3>
				</div>
				<div class="module-body"> 
                                    <form class="form-horizontal row-fluid">
                                        <div class="control-group">                                        
                                            <div class="controls">
                                                <select onchange="pourcentage()" id="pourcentageSelect" class="span8">   
                                                    <c:forEach var="j" begin="${activityYear}" end="${currentYear}">
                                                        <option value="${j}">${j}</option>
                                                    </c:forEach>                                                        
                                                </select>                                         
                                            </div>
                                        </div>
                                    </form><br/>
                                    <p style="text-align: center">
                                        <img id="pourcentageImg" src="AchatParMarque"/>
                                    </p>                                                                                                                                                                              									
				</div><!-- /.module-body-->
                            </div><!-- Fin : ici commence les charts -->
                            
                            <!-- Début : ici commence les charts -->
                            <div class="module">
				<div class="module-head">
                                    <h3>nombre de visites</h3>
				</div>
				<div class="module-body"> 
                                    <form class="form-horizontal row-fluid">
                                        <div class="control-group">                                        
                                            <div class="controls">
                                                 <select onchange="nbrVis()" id="nbrVisSelect" class="span8">   
                                                    <c:forEach var="j" begin="${activityYear}" end="${currentYear}">
                                                        <option>${j}</option>
                                                    </c:forEach>                                                        
                                                </select> 
                                            </div>
                                        </div>
                                    </form><br/>
                                    <p style="text-align: center">
                                        <img id="nbrVisImg" src="NombreVisite"/>
                                    </p>                                    									
				</div><!-- /.module-body-->
                            </div><!-- Fin : ici commence les charts -->
                            
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

<script>
function profilParMois() {
    var chosenYear = document.getElementById("profilParMoisSelect").value;
    document.getElementById("profilParMoisImg").src = "ProfilParMois?chosenYear="+chosenYear;
}

function quantiteProduit() {
    var chosenProduct = document.getElementById("quantiteProduitSelect").value;
    document.getElementById("quantiteProduitImg").src = "QuantiteProduit?chosenProduct="+chosenProduct;    
}

function pourcentage() {
    var chosenYear = document.getElementById("pourcentageSelect").value;
    document.getElementById("pourcentageImg").src = "AchatParMarque?chosenYear="+chosenYear;
}

function nbrVis() {
    var chosenYear = document.getElementById("nbrVisSelect").value;
    document.getElementById("nbrVisImg").src = "NombreVisite?chosenYear="+chosenYear;
}
</script>
<style>
.circle-text {
    width:100%;
}
.circle-text:after {
    content: "";
    display: block;
    width: 100%;
    height:0;
    padding-bottom: 100%;
    background: #4679BD; 
    -moz-border-radius: 50%; 
    -webkit-border-radius: 50%; 
    border-radius: 50%;
}
.circle-text div {
    float:left;
    width:100%;
    padding-top:50%;
    line-height:1em;
    margin-top:-0.5em;
    text-align:center;
    color:white;
}
</style>

</html>
