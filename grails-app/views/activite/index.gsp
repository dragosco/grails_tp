
<%@ page import="grails_tp.Activite" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav">
		<g:set var="entityName" value="${message(code: 'activite.label', default: 'Activite')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-activite" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-activite" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nom" title="${message(code: 'activite.nom.label', default: 'Nom')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'activite.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="lat" title="${message(code: 'activite.lat.label', default: 'Lat')}" />
					
						<g:sortableColumn property="lng" title="${message(code: 'activite.lng.label', default: 'Lng')}" />
					
						<th><g:message code="activite.auteur.label" default="Auteur" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${activiteInstanceList}" status="i" var="activiteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${activiteInstance.id}">${fieldValue(bean: activiteInstance, field: "nom")}</g:link></td>
					
						<td>${fieldValue(bean: activiteInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: activiteInstance, field: "lat")}</td>
					
						<td>${fieldValue(bean: activiteInstance, field: "lng")}</td>
					
						<td>${fieldValue(bean: activiteInstance, field: "auteur")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${activiteInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
