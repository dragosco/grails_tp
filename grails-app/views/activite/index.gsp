
<%@ page import="grails_tp.Activite" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav">
		<g:set var="entityName" value="${message(code: 'activite.label', default: 'Activite')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-activite" class="content scaffold-list" role="main">
			<div class="row">
				<div class="page-header col-md-offset-3 col-md-6">
					<span>LISTE ACTIVITES</span>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-hover">
			<thead>
					<tr>

						<g:sortableColumn property="nom" title="${message(code: 'activite.nom.label', default: 'Nom')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'activite.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="lat" title="${message(code: 'activite.lat.label', default: 'Lat')}" />
					
						<g:sortableColumn property="lng" title="${message(code: 'activite.lng.label', default: 'Lng')}" />
					
						<th><g:message code="activite.auteur.label" default="Auteur" /></th>

                        <th></th>
					</tr>
				</thead>
				<tbody>
				<g:each in="${activiteInstanceList}" status="i" var="activiteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${activiteInstance.id}">${fieldValue(bean: activiteInstance, field: "nom")}</g:link></td>
					
						<td>${fieldValue(bean: activiteInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: activiteInstance, field: "lat")}</td>
					
						<td>${fieldValue(bean: activiteInstance, field: "lng")}</td>
					
						<td>${fieldValue(bean: activiteInstance, field: "auteur.username")}</td>

                        <td>
                            <g:form url="[resource:activiteInstance, action:'delete']" method="DELETE" style="margin:0;">
                            <g:link class="edit-btn fixed" action="edit" resource="${activiteInstance}"><g:message code="Editer" default="Edit" /></g:link>

                                <g:actionSubmit class="delete-btn fixed" action="delete" value="Supprimer" onclick="return confirm('En êtes-vous certain ?');" />
                            </g:form>
                        </td>
					</tr>
				</g:each>
				</tbody>
			</table>
			</div>
		</div>
			<div class="row">
				<div class="col-md-12">
					<div class="pagination">
						<g:paginate total="${activiteInstanceCount ?: 0}" />
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
