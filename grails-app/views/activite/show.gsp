
<%@ page import="grails_tp.Activite" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav">
		<g:set var="entityName" value="${message(code: 'activite.label', default: 'Activite')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-activite" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-activite" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list activite">
			
				<g:if test="${activiteInstance?.nom}">
				<li class="fieldcontain">
					<span id="nom-label" class="property-label"><g:message code="activite.nom.label" default="Nom" /></span>
					
						<span class="property-value" aria-labelledby="nom-label"><g:fieldValue bean="${activiteInstance}" field="nom"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activiteInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="activite.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${activiteInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activiteInstance?.lat}">
				<li class="fieldcontain">
					<span id="lat-label" class="property-label"><g:message code="activite.lat.label" default="Lat" /></span>
					
						<span class="property-value" aria-labelledby="lat-label"><g:fieldValue bean="${activiteInstance}" field="lat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activiteInstance?.lng}">
				<li class="fieldcontain">
					<span id="lng-label" class="property-label"><g:message code="activite.lng.label" default="Lng" /></span>
					
						<span class="property-value" aria-labelledby="lng-label"><g:fieldValue bean="${activiteInstance}" field="lng"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${activiteInstance?.auteur}">
				<li class="fieldcontain">
					<span id="auteur-label" class="property-label"><g:message code="activite.auteur.label" default="Auteur" /></span>
					
						<span class="property-value" aria-labelledby="auteur-label"><g:link controller="user" action="show" id="${activiteInstance?.auteur?.id}">${activiteInstance?.auteur?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${activiteInstance?.groupes}">
				<li class="fieldcontain">
					<span id="groupes-label" class="property-label"><g:message code="activite.groupes.label" default="Groupes" /></span>
					
						<g:each in="${activiteInstance.groupes}" var="g">
						<span class="property-value" aria-labelledby="groupes-label"><g:link controller="groupe" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${activiteInstance?.photos}">
				<li class="fieldcontain">
					<span id="photos-label" class="property-label"><g:message code="activite.photos.label" default="Photos" /></span>
					
						<g:each in="${activiteInstance.photos}" var="p">
						<span class="property-value" aria-labelledby="photos-label"><g:link controller="photo" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:activiteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${activiteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
