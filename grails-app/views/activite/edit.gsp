<%@ page import="grails_tp.Activite" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav">
		<g:set var="entityName" value="${message(code: 'activite.label', default: 'Activite')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-activite" class="content scaffold-edit" role="main">
			<div class="row">
				<div class="page-header col-md-offset-3 col-md-6">
					${activiteInstance?.nom.toUpperCase()}
				</div>
			</div>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${activiteInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${activiteInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:activiteInstance, action:'update']" method="PUT"><!--enctype="multipart/form-data"-->
				<g:hiddenField name="version" value="${activiteInstance?.version}" />
				<fieldset class="form" >
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<g:actionSubmit class="save" action="update" value="Mettre à jour" />
						</div>
					</div>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
