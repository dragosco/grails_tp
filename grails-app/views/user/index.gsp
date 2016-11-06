
<%@ page import="grails_tp.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-user" class="content scaffold-list" role="main">
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="row">
				<div class="page-header col-md-offset-3 col-md-6">
					<span>LISTE UTILISATEURS</span>
				</div>

			</div>
			<div class="row">
				<div class="col-md-4 col-md-offset-4 text-center">
					<g:link action="create" resource="${userInstance}"><span class="glyphicon glyphicon-plus"></span>Ajouter un utilisateur</g:link>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover">
						<thead>
						<tr>

							<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Pseudo')}" />

							<g:sortableColumn property="accountExpired" title="${message(code: 'user.accountExpired.label', default: 'Compte expiré')}" />

							<g:sortableColumn property="accountLocked" title="${message(code: 'user.accountLocked.label', default: 'Compte bloqué')}" />

							<g:sortableColumn property="enabled" title="${message(code: 'user.enabled.label', default: 'Fonctionnel')}" />

							<g:sortableColumn property="passwordExpired" title="${message(code: 'user.passwordExpired.label', default: 'Mot de passe expiré')}" />

							<th></th>
						</tr>
						</thead>
						<tbody>
						<g:each in="${userInstanceList}" status="i" var="userInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>

								<td><g:formatBoolean boolean="${userInstance.accountExpired}" /></td>

								<td><g:formatBoolean boolean="${userInstance.accountLocked}" /></td>

								<td><g:formatBoolean boolean="${userInstance.enabled}" /></td>

								<td><g:formatBoolean boolean="${userInstance.passwordExpired}" /></td>

								<td>
									<g:form url="[resource:userInstance, action:'delete']" method="DELETE" style="margin:0;">
										<g:link class="edit-btn fixed" action="edit" resource="${userInstance}">Editer</g:link>
										<g:actionSubmit class="delete-btn fixed" action="delete" value="Supprimer" onclick="return confirm('En êtes-vous certain ?');" />
									</g:form>
								</td>
							</tr>
						</g:each>
						</tbody>
					</table>
				</div>
			</div>

			<div class="pagination">
				<g:paginate total="${userInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
