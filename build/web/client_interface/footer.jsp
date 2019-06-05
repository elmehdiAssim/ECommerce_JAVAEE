                            <div class="header-para">
                                
                                <div class="box-title">
					<h1><span class="title-icon"></span>
                                            <a href="annonce.jsp">Products</a>
                                        </h1>
				</div>
                                <div class="box-title">
					<h1><span class="title-icon"></span>
                                            <a href="#">About Us</a>
                                        </h1>
				</div>
                                <div class="box-title">
					<h1><span class="title-icon"></span>
                                            <a href="client_envoi_msg.jsp">Contact Us</a>
                                        </h1>
				</div>
                                
                                <div class="box"> 
                                    <div class="box-heading"><h1><a href="panier.jsp">Cart:&nbsp;</a></h1></div>
                                    <a href="panier.jsp">
                                        <div class="box-content">
                                            Now In Your Cart&nbsp;
                                            <strong> <!-- get nbr d'articles from hashtable-->
                                                <c:set var="quantite" scope="session" value="${0}"/>
                                                <c:forEach var="panier" items="${panier}">
                                                    <c:set var="quantite" scope="session" value="${quantite+panier.value}"/>                                                
                                                </c:forEach>
                                                <c:out value="${quantite}"/> items
                                            </strong>
                                        </div>
                                    </a>    
                                </div>			
                            </div>                          

                            <div class="clear"></div>                            

                            <div class="footer-bottom">
                                <div class="copy">
                                    <p>facebook, twitter ...</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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

