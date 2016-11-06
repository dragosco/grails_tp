<%@ page import="grails_tp.User" %>
<%@ page import="grails_tp.Role" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-user" class="content scaffold-edit" role="main">
			<g:form url="[resource:userInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${userInstance?.version}" />

				<!-- si pas admin -->
				<sec:ifNotGranted roles="ROLE_ADMIN">
					<!-- si modérateur -->
					<sec:ifAllGranted roles="ROLE_MOD">
						<g:if test="${sec.username() == userInstance?.username || userInstance?.isSameAuthority("ROLE_OP")}">
							<div class="row">
								<div class="page-header col-md-offset-3 col-md-6">
									<span>MODE EDITION</span>
								</div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-4">
									<span class="label">Changer le pseudo</span>
								</div>
								<div class="col-md-2">
									<g:textField class="form-control" name="username" required="" value="${userInstance?.username}"/>
								</div>
							</div>
							<div class="row">
								<div class="col-md-2 col-md-offset-4">
									<span class="label">Changer le mot de passe</span>
								</div>
								<div class="col-md-2">
									<g:passwordField id="pass" class="form-control" name="newpassword" placeholder="Nouveau" required="" value=""/>
									<br>
									<g:passwordField id="confirm_pass" class="form-control" name="newpasswordconfirm" placeholder="Confirmer" required="" value=""/>
								</div>

							</div>
							<div id="pass_not_equal_div" class="row">
								<div class="col-md-offset-4 ">
									<span class="alert-danger">Les mots de passe ne correspondent pas</span>
								</div>
							</div>
						</g:if>
					</sec:ifAllGranted>
					<!-- si pas modérateur -->
					<sec:ifNotGranted roles="ROLE_MOD">
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
									<g:passwordField id="pass" class="form-control" name="newpassword" placeholder="Nouveau" required="" value=""/>
									<br>
									<g:passwordField id="confirm_pass" class="form-control" name="newpasswordconfirm" placeholder="Confirmer" required="" value=""/>
								</div>

							</div>
							<div id="pass_not_equal_div" class="row">
								<div class="col-md-offset-4 ">
									<span class="alert-danger">Les mots de passe ne correspondent pas</span>
								</div>
							</div>
						</g:if>
					</sec:ifNotGranted>
				</sec:ifNotGranted>
				<!-- si admin -->
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
							<span class="label">Niveau d'accès</span>
						</div>
						<div class="col-md-2">
							<g:select class="form-control" name="authority"
									  from="${Role.list().authority}"
									  value="${userInstance?.authorities.getAt(0).authority}" />
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
