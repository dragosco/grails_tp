<%--
  Created by IntelliJ IDEA.
  User: cojoc
  Date: 23/10/2016
  Time: 19:38
--%>
<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>GO OUT</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <r:require module="bootstrap"/>
    <meta name="layout" content="mainWithNav"/>
    <r:layoutResources/>
</head>
<body>




            <div class="row">
                <div class="page-header col-md-offset-4 col-md-4">
                    <span>CONNEXION</span>
                </div>
            </div>
            <g:if test="${params.login_error != null}">
                <div class="row">
                    <div class="col-md-offset-4 col-md-4 text-center">
                        <span class="alert-danger">Pseudo et/ou Mot de passe incorrect(s)</span>
                    </div>
                </div>
            </g:if>
            <form action='/grails_tp/j_spring_security_check' method='POST' id='loginForm' class='cssform' autocomplete='off'>
                <div class="row">
                    <div class="col-md-offset-4 col-md-4">
                        <input type='text' class='form-control' name='j_username' placeholder="Pseudo" id='username'/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-offset-4 col-md-4">
                        <input type='password' class='form-control' name='j_password' placeholder="Mot de passe"id='password'/>
                    </div>
                </div>
                <!--<div class="row">
                    <div class="col-md-offset-5 col-md-2">
                            <input type='checkbox' name='_spring_security_remember_me' id='remember_me' />
                            <label for='remember_me'>Souvenez-vous de moi</label>
                    </div>
                </div>-->
                <div class="row">
                    <div class="col-md-offset-4 col-md-4">
                        <input class="login" type='submit' id="submit" value='Se connecter'/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-offset-4 col-md-4 text-center">
                        <a href="/grails_tp/user/create">S'enregistrer</a>
                    </div>
                </div>
            </form>
    <script type='text/javascript'>
        (function() {
            document.forms['loginForm'].elements['j_username'].focus();
        })();
    </script>

    <r:layoutResources/>


    <div class="container"></div>
    <div id="spinner" class="spinner" style="display:none;">Loading&hellip;</div>

</body>
</html>
