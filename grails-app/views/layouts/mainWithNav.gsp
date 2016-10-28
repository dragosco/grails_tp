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
    <asset:stylesheet src="application.css"/>
    <asset:javascript src="application.js"/>
    <g:layoutHead/>
    <r:layoutResources/>
</head>
<body>
<div class="container-fluid" id="topContainer">
    <div id="bck">
        <span id="logo">go out!</span>
    </div>
</div>
<div class="container-fluid" id="navContainer">
    <div class="container">
        <nav class="navbar navbar-default">
            <div class="container-fluid">

                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li><a href="${createLink(uri: '/')}"><span class="glyphicon glyphicon-home"></span></a></li>
                        <li><a href="${createLink(uri: '/activite/create/')}">NOUVELLE ACTIVITE</a></li>
                        <sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MOD'>
                            <li><a href="${createLink(uri: '/groupe/create/')}">NOUVEAU GROUPE</a></li>
                        </sec:ifAnyGranted>

                        <sec:ifAllGranted roles='ROLE_ADMIN'>
                            <li><a href="${createLink(uri: '/user/index/')}">GESTION UTILISATEURS</a></li>
                        </sec:ifAllGranted>

                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <sec:ifNotLoggedIn>
                            <li><a href="/grails_tp/login/auth"><span class="glyphicon glyphicon-log-in"></span></a></li>
                        </sec:ifNotLoggedIn>
                        <sec:ifLoggedIn>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><spam class="glyphicon glyphicon-user"></spam><span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a href="${createLink(uri: '/user/show/')}${sec.loggedInUserInfo(field:"id")}">Profil</a></li>
                                    <li><a href="${createLink(uri: '/logout')}">Se déconnecter</a></li>
                                </ul>
                            </li>
                        </sec:ifLoggedIn>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</div>

<div id="main" class="container">
    <g:layoutBody/>
    <r:layoutResources/>
    <div class="container"></div>
    <div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
</div>

<div id="bottom" class="container-fluid">

</div>
</body>
</html>
