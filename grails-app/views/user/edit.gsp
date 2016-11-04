<%@ page import="grails_tp.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-user" class="content scaffold-edit" role="main">
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
			<g:form url="[resource:userInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${userInstance?.version}" />

				<sec:ifNotGranted roles="ROLE_ADMIN">
					<g:if test="${sec.username() == userInstance?.username}">

						<div class="row">
							<div class="page-header col-md-offset-3 col-md-6">
								<span>MODE EDITION</span>
							</div>
						</div>
						<div class="row">
							<div class="col-md-2 col-md-offset-4">
								<span class="label">Changer votre pseudo</span>
							</div>
							<div class="col-md-2">
								<g:textField class="form-control" name="username" required="" value="${userInstance?.username}"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-2 col-md-offset-4">
								<span class="label">Changer votre mot de passe</span>
							</div>
							<div class="col-md-2">
								<g:passwordField class="form-control" name="password" placeholder="Ancien" required="" value=""/>
								<br>
								<g:passwordField class="form-control" name="password" placeholder="Nouveau" required="" value=""/>
								<br>
								<g:passwordField class="form-control" name="password" placeholder="Confirmer" required="" value=""/>
							</div>
						</div>
					</g:if>
				</sec:ifNotGranted>
				<sec:ifAllGranted roles='ROLE_ADMIN'>

					<div class="row">
						<div class="page-header col-md-offset-3 col-md-6">
							<span>EDITER : </span><span style="color:red;">${userInstance?.username}</span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2 col-md-offset-4">
							<span class="label">Pseudo</span>
						</div>
						<div class="col-md-2">
							<g:textField class="form-control" name="username" required="" value="${userInstance?.username}"/>
						</div>
					</div>



					<div class="row">
						<div class="col-md-2 col-md-offset-4">
							<span class="label">Compte expiré</span>
						</div>
						<div class="col-md-2">
							<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
						</div>
					</div>


					<div class="row">
						<div class="col-md-2 col-md-offset-4">
							<span class="label">Compte bloqué</span>
						</div>
						<div class="col-md-2">
							<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
						</div>
					</div>


					<div class="row">
						<div class="col-md-2 col-md-offset-4">
							<span class="label">Fonctionnel</span>
						</div>
						<div class="col-md-2">
							<g:checkBox name="enabled" value="${userInstance?.enabled}" />
						</div>
					</div>


					<div class="row">
						<div class="col-md-2 col-md-offset-4">
							<span class="label">Mot de passe expiré</span>
						</div>
						<div class="col-md-2">
							<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
						</div>
					</div>


				</sec:ifAllGranted>
				<fieldset class="buttons">
					<div class="row">
						<div class="col-md-offset-4 col-md-4">
							<g:actionSubmit class="save" action="update" value="Mettre à jour" />
						</div>
					</div>

				</fieldset>
			</g:form>
		</div>
	</body>
</html>
