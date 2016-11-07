
<%@ page import="grails_tp.Groupe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav">
		<g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-groupe" class="content scaffold-list" role="main">
			<div class="row">
				<div class="page-header col-md-offset-3 col-md-6">
					<span>LISTE GROUPES</span>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover">
					<thead>
							<tr>

								<th>Photo</th>
								<g:sortableColumn property="nom" title="${message(code: 'groupe.nom.label', default: 'Nom')}" />

								<th><g:message code="groupe.auteur.label" default="Auteur" /></th>

								<th><g:message code="groupe.parent.label" default="Parent" /></th>

								<th></th>
							</tr>
						</thead>
						<tbody>
						<g:each in="${groupeInstanceList}" status="i" var="groupeInstance">
							<g:if test="${groupeInstance?.nom != "Aucun"}">
								<tr>

									<td>
										<img style="width: 120px; height: auto;" src=${grailsApplication.config.images.groupes.url}${groupeInstance.photo?.nom}>
									</td>
									<td><g:link action="show" id="${groupeInstance.id}">${fieldValue(bean: groupeInstance, field: "nom")}</g:link></td>

									<td>${fieldValue(bean: groupeInstance, field: "auteur.username")}</td>

									<td>${fieldValue(bean: groupeInstance, field: "parent.nom")}</td>

									<td>
										<g:form url="[resource:groupeInstance, action:'delete']" method="DELETE" style="margin:0;">
											<g:link class="edit-btn fixed" action="edit" resource="${groupeInstance}"><g:message code="Editer" default="Edit" /></g:link>

											<g:actionSubmit class="delete-btn fixed" action="delete" value="Supprimer" onclick="return confirm('En êtes-vous certain ?');" />
										</g:form>
									</td>
								</tr>
							</g:if>
						</g:each>
						</tbody>
					</table>
					</div>
				</div>

			<div class="pagination row">
				<div class="col-md-12">
					<g:paginate total="${groupeInstanceCount ?: 0}" />
				</div>

			</div>
		</div>
	</body>
</html>
