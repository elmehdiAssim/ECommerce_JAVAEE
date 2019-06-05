<%@include file='./header.jsp'%>
<title>send message</title>
                            
                    <div class="banner-top">
			<div class="header-bottom">
                            <div class="header_bottom_right_images">
                                <div class="content-wrapper">		  
                                    <div class="content-top">
                                        <div class="about_wrapper">
                                            <h1>Contact Us</h1>
                                        </div>
                                    </div>
                                </div>
                                <div class="section group">
                                    <div class="col span_2_of_c">
                                        <div class="contact-form">                                            
                                            <c:catch var ="catchtheException">
                                                <sql:query var="membre" dataSource="${dataSource}">
                                                    select * from Membre where mot_utilisateur = '${sessionScope.username}'
                                                </sql:query>
                                            </c:catch>
                                                <c:choose>
                                                    <c:when test = "${catchtheException != null}">
                                                        <c:out value="${catchtheException}"/>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach var="row" items="${membre.rows}">
                                                            <c:set var="nom" value="${row.nom}"/>
                                                            <c:set var="prenom" value="${row.prenom}"/>
                                                            <c:set var="email" value="${row.email}"/>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>                                           
                                            
                                            <form action="EnvoiMsgParClient" method="post">
                                                
                                                    <div>
                                                        <span><label>NOM</label></span>
                                                        <span><input type="text" value="${nom}" class="textbox" disabled></span>
                                                    </div>
                                                    <div>
                                                        <span><label>PRENOM</label></span>
                                                        <span><input type="text" value="${prenom}" class="textbox" disabled></span>
                                                    </div>
                                                    <div>
                                                        <span><label>E-MAIL</label></span>
                                                        <span><input type="text" value="${email}" class="textbox" disabled></span>
                                                    </div>                                                    
                                                    <div>
                                                        <span><label>MESSAGE</label></span>
                                                        <span><textarea name="message"> </textarea></span>
                                                    </div>
                                                    <div>
                                                        <span><input type="submit" value="Envoyer"></span>
                                                    </div>
                                                
                                            </form>
                                        </div>
                                    </div><div class="clear"></div>
                                </div>
                            </div>
		
                            
<%@include file='./footer.jsp'%> 

</html>
<script>
document.getElementById('my_selection').onchange = function() {
    window.location.href = this.children[this.selectedIndex].getAttribute('href');
}
</script>

    	
    	
            	