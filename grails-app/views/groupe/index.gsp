
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

								<g:sortableColumn property="nom" title="${message(code: 'groupe.nom.label', default: 'Nom')}" />

								<th><g:message code="groupe.auteur.label" default="Auteur" /></th>

								<th><g:message code="groupe.parent.label" default="Parent" /></th>


							</tr>
						</thead>
						<tbody>
						<g:each in="${groupeInstanceList}" status="i" var="groupeInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show" id="${groupeInstance.id}">${fieldValue(bean: groupeInstance, field: "nom")}</g:link></td>

								<td>${fieldValue(bean: groupeInstance, field: "auteur.username")}</td>

								<td>${fieldValue(bean: groupeInstance, field: "parent.nom")}</td>


							</tr>
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
