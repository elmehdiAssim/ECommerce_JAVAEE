<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var="dataSource" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
      url="jdbc:sqlserver://localhost;databaseName=ECommerce;username=elmehdi;password=elmehdi"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        		
		
        <link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
        <link type="text/css" href="css/theme.css" rel="stylesheet">
        <link type="text/css" href="css/barChart.css" rel="stylesheet">   
        <link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
        <link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
	
        <!-- to upload image to textfield-->
        <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
        <script src="scripts/flot/jquery.flot.resize.js" type="text/javascript"></script>
        <script src="scripts/datatables/jquery.dataTables.js" type="text/javascript"></script>
        <script src="scripts/common.js" type="text/javascript"></script>
        
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body>     
        
        <div class="navbar navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                        <i class="icon-reorder shaded"></i></a><a class="brand" href="index.html">PHONIX </a>
                    <div class="nav-collapse collapse navbar-inverse-collapse">
                        
                        <form class="navbar-search pull-left input-append" action="#">
                        <input type="text" class="span3">
                        <button class="btn" type="button">
                            <i class="icon-search"></i>
                        </button>
                        </form>
                        <ul class="nav pull-right">                            
                            <li><a href="#"><c:out value="${sessionScope.username}"/></a></li>
                            <li class="nav-user dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <img src="images/user.png" class="nav-avatar" />
                                <b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">Editer Profil</a></li>                                                                       
                                    <li class="divider"></li>
                                    <li><a href="LogoutServlet">Logout</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div><!-- /.nav-collapse -->
                </div><!-- /.container -->
            </div><!-- /navbar-inner -->
        </div><!-- /navbar -->
        
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="span3">
                        <div class="sidebar">
                            <ul class="widget widget-menu unstyled">
                                <li><a class="collapsed" data-toggle="collapse" href="#togglePages"><i class="menu-icon icon-book">
                                </i><i class="icon-chevron-down pull-right"></i><i class="icon-chevron-up pull-right">
                                </i>Gestion de Produit</a>
                                    <ul id="togglePages" class="collapse unstyled">
                                        <li><a href="liste_produit.jsp"><i class="menu-icon icon-book"></i>Modifier Produit</a></li>
                                        <li><a href="ajouter_produit.jsp"><i class="menu-icon icon-book"></i>Ajouter Produit</a></li>                                        
                                    </ul>
                                </li>
                                
                                <li><a href="produit_annonce.jsp"><i class="menu-icon icon-eye-open"></i>Gestion Annonce</a></li>
				<li>
                                    <!-- Début Notification commandes réalisées par les clients -->
                                    <sql:query var="commande" dataSource="${dataSource}">
                                            select count(*) as count from Commande where vu=0
                                    </sql:query>
                                    <c:forEach var="row" items="${commande.rows}">
                                        <a href="Notification?modifierQuoi=commande"><i class="menu-icon icon-paste"></i>Commandes
                                            <c:if test="${row.count > 0}">
                                                <b class="label green pull-right">${row.count}</b>
                                            </c:if>  
                                        </a>
                                    </c:forEach>
                                    <!-- Fin Notification commandes réalisées par les clients -->
                                </li>                                
                            </ul>
                            
                            <ul class="widget widget-menu unstyled">                                
                                <li>
                                    <!-- Début Notification messages envoyés par les clients-->
                                    <sql:query var="membre" dataSource="${dataSource}">
                                            select count(*) as count from Message where vu=0
                                    </sql:query>
                                    <c:forEach var="row" items="${membre.rows}">
                                        <a href="Notification?modifierQuoi=message"><i class="menu-icon icon-envelope"></i>Messages reçus
                                            <c:if test="${row.count > 0}">
                                                <b class="label green pull-right">${row.count}</b>
                                            </c:if>                                              
                                        </a>
                                    </c:forEach>
                                    <!-- Fin Notification messages envoyés par les clients-->
                                </li>
                                <li>
                                    <!-- Début Notification avis client  -->
                                    <sql:query var="evaluationProduit" dataSource="${dataSource}">
                                            select count(*) as count from EvaluationProduit where vu=0
                                    </sql:query>
                                    <c:forEach var="row" items="${evaluationProduit.rows}">
                                        <a href="Notification?modifierQuoi=evaluationProduit"><i class="menu-icon icon-tasks"></i>Avis Client
                                            <c:if test="${row.count > 0}">
                                                <b class="label green pull-right">${row.count}</b>
                                            </c:if>  
                                        </a>
                                    </c:forEach>
                                    <!-- Fin Notification avis client -->
                                </li>
                                
                                <li>
                                    <!-- Début Notification nouveaux membres-->
                                    <sql:query var="membre" dataSource="${dataSource}">
                                            select count(*) as count from Membre where vu=0
                                    </sql:query>                                            
                                    <c:forEach var="row" items="${membre.rows}">
                                        <a href="Notification?modifierQuoi=membre"><i class="menu-icon icon-signout"></i>Nouveaux Membres
                                            <c:if test="${row.count > 0}">
                                                <b class="label green pull-right">${row.count}</b>
                                            </c:if>   
                                        </a>
                                    </c:forEach> 
                                    <!-- Fin Notification nouveaux membres-->
                                </li>		
                            </ul>
                            
                            
                            <ul class="widget widget-menu unstyled">                                
                                <li><a href="charts.jsp"><i class="menu-icon icon-bar-chart"></i>Tables de Bord </a></li>
				<li><a href="#"><i class="menu-icon icon-envelope"></i>Envoyer Message</a></li>
				<li><a href="#"><i class="menu-icon"></i>Log Out</a></li>	
                            </ul>                            
                           
                        </div>
                        <!--/.sidebar-->
                    </div>