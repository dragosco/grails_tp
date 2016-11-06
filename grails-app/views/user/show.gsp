
<%@ page import="grails_tp.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<div>

		<div id="show-user" class="content scaffold-show" role="main">
			<div class="row">
				<div class="page-header col-md-offset-3 col-md-6">
					<div style="height: 100px; width: 100px; margin: 0 auto; background-color: #aaaabb; border-radius: 100%; text-align: center;">
						<span class="glyphicon glyphicon-user" style="color: #fff; line-height: 100px; vertical-align: middle;"></span>
					</div>
					<span>${userInstance?.username}</span>

				</div>
			</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
		</div>
	</div>
		<div>
			<g:form url="[resource:userInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<div class="row">
						<sec:ifAllGranted roles='ROLE_ADMIN'>
							<div class="col-md-2 col-md-offset-4">
								<g:link class="edit-btn" action="edit" resource="${userInstance}">Editer</g:link>
							</div>
							<div class="col-md-2">
								<g:actionSubmit class="delete-btn" action="delete" value="Supprimer" onclick="return confirm('En êtes-vous certain ?');" />
							</div>
						</sec:ifAllGranted>
						<sec:ifNotGranted roles="ROLE_ADMIN">
							<div class="col-md-4 col-md-offset-4">
								<g:link class="edit-btn" action="edit" resource="${userInstance}">Editer</g:link>
							</div>
						</sec:ifNotGranted>
					</div>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
