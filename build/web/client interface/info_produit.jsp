<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML> 
<html>
<head>
    <title>information produit</title>

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
                            <ul class="user_menu"><li class="act first"><a href=""><div class="button-t"><span>Create an Account</span></div></a></li><li class="last"><a href=""><div class="button-t"><span>Log in</span></div></a></li></ul>
                        </div>
					
                        <div class="header-bot">
                            <div class="logo">
                                <a href="index.html"><img src="images/#" alt=""/></a>  <!-- on doit mettre le logo -->
                            </div>
                            <div class="search">
                                <input type="text" class="textbox" value="" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '';}">
                                <button class="gray-button"><span>Search</span></button>
                            </div>
                            <div class="clear"></div> 
                        </div>		
                    </div>	
                    <div class="menu"> 	
			<div class="top-nav"> 
                            <ul>
                                <li><a href="consulterAnnonce1.html">Home</a></li>
                                <li><a href="#">About</a></li>						
                                <li><a href="envoyerMessage1.html">Contact</a></li>
                                <li><a href="#"></a></li>
                                <li><a href="#"></a></li>
                            </ul>
                            <div class="clear"></div> 
                        </div>
                    </div> 
                    <div class="banner-top">
			<div class="header_bottom_right_images">
                            <div class="about_wrapper">
                                <h1>Nom du produit</h1> 
                            </div>
                                <div class="about-group">
                                    <div class="about-top">	
                                        <div class="grid images_3_of_1">
                                            <img src="images/hweui.jpg" alt=""/>   <!-- ici on va mettre une image de 245*200 -->
                                        </div>
                                        <div class="grid span_2_of_3">
                                            <h3 style="color:black; font-weight:bold">Nom du Produit</h3>						
                                            <p>la descritpion du produit</p>
                                        </div><div class="clear"></div> 
                                    </div>
                                    <br/>
                                    <br/>
                                    <br/>
                                    <p class="about-para" style="text-align: center">plus d'info du produit</p>
                                    <div class="clear"></div>
                                    <br/><br/>
                                    <div class="team">
                                        <h2 style="font-weight:bold">Evaluer le produit</h2>
                                        <div class="cont">
                                            <div class="stars">                                                
                                                <input class="star star-5" id="star-5-2" type="radio" name="star"/>
                                                <label class="star star-5" for="star-5-2"></label>
                                                <input class="star star-4" id="star-4-2" type="radio" name="star"/>
                                                <label class="star star-4" for="star-4-2"></label>
                                                <input class="star star-3" id="star-3-2" type="radio" name="star"/>
                                                <label class="star star-3" for="star-3-2"></label>
                                                <input class="star star-2" id="star-2-2" type="radio" name="star"/>
                                                <label class="star star-2" for="star-2-2"></label>
                                                <input class="star star-1" id="star-1-2" type="radio" name="star"/>
                                                <label class="star star-1" for="star-1-2"></label>                                                
                                            </div>
                                        </div>
                                        <div class="section group">
                                            <div class="col span_2_of_c">
                                                <div class="contact-form">                                                           					    
                                                    <div>
                                                        <span><label>COMMENTAIRE</label></span>
                                                        <span><textarea name="userMsg"> </textarea></span>									
                                                        <span><input type="submit" value="Publier"></span> 						  
                                                    </div>                                                           
                                                </div>
                                            </div><div class="clear"></div>
                                        </div>
                                        <br/><br/>
                                        <h2 style="font-weight:bold">Meilleurs Commentaires des Clients</h2> 
                                        <br/>
                                        <div class="about-top">	
                                            <div class="grid images_1_of_1">
                                                <img src="images/user.png" alt=""/> 
                                            </div>
                                            <div class="grid span_2_of_3">
                                                <h3>
                                                    <span style="color:blue;font-weight:bold;font-size:18px">username</span>
                                                    <span class="pull-right" style="font-size:13px;color:gray">publié le: 21/03/2016</span>
                                                </h3>
                                                <p>I loved this smartphone</p>								
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star checked"></span>
                                                <span class="fa fa-star"></span>
                                                <span class="fa fa-star"></span>
                                            </div><div class="clear"></div> 
                                        </div>          
                                        <hr>									    
                                    </div>				  
                                </div>
                            </div>
                        
                            <div class="header-para">
                                <div class="box"> 
                                    <div class="box-heading"><h1><a href="#">Panier:&nbsp;</a></h1></div>
                                    <div class="box-content">
                                    Dans Votre Panier&nbsp;<strong> 0 articles</strong>
                                    </div>	
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

    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-46156385-1', 'cssscript.com');
      ga('send', 'pageview');

    </script>
</html>