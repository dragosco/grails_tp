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
		<div id="main" class="container">
			<div class="container">
				<g:layoutBody/>
				<r:layoutResources/>
			</div>


			<div class="container"><a href="${createLink(uri: '/user/create')}">Créer un nouveau compte</a></div>
			<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
		</div>
	</body>
</html>
