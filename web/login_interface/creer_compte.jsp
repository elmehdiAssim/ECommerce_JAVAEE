<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>create an account</title>
	<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link type="text/css" href="css/theme.css" rel="stylesheet">
	<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
	<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
        <script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
    <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        
</head>
<body>
    
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".navbar-inverse-collapse">
                    <i class="icon-reorder shaded"></i>
                </a>
                <a class="brand" href="index.html">
                    PHONIX
                </a>
                <div class="nav-collapse collapse navbar-inverse-collapse">
                    <ul class="nav pull-right">
                        <li>
                            <a href="#">Log In</a>
                        </li> 						
                    </ul>
                </div><!-- /.nav-collapse -->
            </div>
	</div><!-- /navbar-inner -->
    </div><!-- /navbar -->

    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="module module-login span4 offset4">
                    <form class="form-vertical" action="AjoutClient" method="post">
                        
                        <div class="module-head">
                            <h3>Create an account</h3>
                        </div>
                        
                        <div class="module-body">
		    			
                            <div class="control-group">
                                <div class="controls row-fluid">
                                    <input class="span12" type="text" name="nom" placeholder="Nom"/>
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="controls row-fluid">
                                    <input class="span12" type="text" name="prenom" placeholder="Prénom"/>
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="controls row-fluid">
                                    <input class="span12" type="date" name="date_naissance" placeholder="date_naissance"/>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">Sexe :</label>
                                <div class="controls">
                                    <label class="radio inline">
                                            <input type="radio" name="sexe" value="homme"/>
                                            Homme
                                    </label> 
                                    <label class="radio inline">
                                            <input type="radio" name="sexe" value="femme"/>
                                            Femme
                                    </label>												
                                </div>
                            </div>
							
                            <div class="control-group">
                                <div class="controls row-fluid">
                                    <input class="span12" type="text" name="tel" placeholder="N° de Téléphone">
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="controls row-fluid">
                                    <input class="span12" type="text" name="email" placeholder="Email">
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="controls row-fluid">
                                    <input class="span12" type="text" name="username" placeholder="Username">
                                </div>
                            </div>	

                            <div class="control-group">
                                <div class="controls row-fluid">
                                    <input class="span12" type="password" name="password" placeholder="Password">
                                </div>
                            </div>							
                        </div>
                        
                        <div class="module-foot">
                            <div class="control-group">
                                <div class="controls clearfix">
                                    <button type="submit" class="btn btn-primary pull-right">Create</button>
                                    <label class="checkbox">
                                            <input type="checkbox"> Remember me
                                    </label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div><!--/.wrapper-->
    
</body>

        
        <input id="message" type="hidden" value="${requestScope.message}"/>
        <script type="text/javascript">
            var message = document.getElementById('message').value;
            var messageLength = message.length;
            if (messageLength > 0) {
                alert(message);
            }            
        </script>            
    
</html>
