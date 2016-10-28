<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-user" class="content scaffold-create" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<div class="row">
				<div class="page-header col-md-offset-3 col-md-6">
					<span>NOUVEAU COMPTE</span>
				</div>
			</div>
			<g:form class="form" url="[resource:userInstance, action:'save']" >
			<div class="row">
				<div class="col-md-offset-3 col-md-3">
					<span class="label">Pseudo *</span>
				</div>
				<div class="col-md-3">
						<g:textField type="text" class="form-control" placeholder="ex. Bond007" name="username" required="" value="${userInstance?.username}"/>

				</div>

			</div>
			<div class="row">
				<div class="col-md-offset-3 col-md-3">
					<span class="label">Mot de passe *</span>
				</div>

				<div class="col-md-3">
						<g:passwordField id="pass" type="password" class="form-control" placeholder="Choisissez un mdp compliqué" name="password" required="" value="${userInstance?.password}"/>

				</div>
			</div>
			<div class="row">
				<div class="col-md-offset-3 col-md-3">
					<span class="label">Confirmation mot de passe *</span>
				</div>

				<div class="col-md-3">
						<g:passwordField id="confirm_pass" type="password" class="form-control" placeholder="Réintroduisez votre mdp" name="ConfirmPassword" required=""/>
				</div>
                <div id="pass_not_equal_div" class="col-md-3">
                    <span class="alert-danger">Les mots de pass ne correspondent pas</span>
                </div>
			</div>
			<div class="row">
				<div class="col-md-offset-6 col-md-3">
					<g:submitButton id="register_btn" name="create" class="save" value="Valider" />
				</div>
			</div>

			</g:form>
		</div>
	</body>
</html>
