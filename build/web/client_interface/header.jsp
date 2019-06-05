<%@page import="org.ecommerce.dao.VisiteDB"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Enumeration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var="dataSource" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
      url="jdbc:sqlserver://localhost;databaseName=ECommerce;username=elmehdi;password=elmehdi"/>
<!DOCTYPE HTML>
<html>
<head>    
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href='http://fonts.googleapis.com/css?family=Playball' rel='stylesheet' type='text/css'> 
    
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://www.cssscript.com/wp-includes/css/sticky.css" rel="stylesheet" type="text/css">
    <link href="css/star_decoration.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    
    
    <div class="header-bg">
	<div class="wrap"> 
            <div class="h-bg">
                <div class="total">
                    <div class="header">
                        <div class="box_header_user_menu">
                            <ul class="user_menu"> 
                                <c:choose>
                                    <c:when test="${sessionScope.username == null}">
                                        <li class="last">
                                            <a href="../login_interface/creer_compte.jsp">
                                                <div class="button-t">
                                                    <span>Create an Account</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="last">
                                            <a href="../login_interface/login.jsp">
                                                <div class="button-t">
                                                    <span>Log in</span>
                                                </div>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="last">
                                            <a href="../admin_interface/LogoutServlet">
                                                <div class="button-t">
                                                    <span>Log out</span>
                                                </div>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                        
                        <c:if test="${sessionScope.username != null}">
                            <div class="header-right">
                                <ul class="follow_icon">                               
                                    <li>                                    
                                        <img src="images/client.png" width="30" height="30" align="middle"/>
                                        <span><c:out value="${sessionScope.username}"/></span>
                                    </li>              
                                </ul>
                            </div>        
                        </c:if>
                        <div class="clear"></div>                       
                    </div>	
                    
                    