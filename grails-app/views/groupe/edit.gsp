<%@ page import="grails_tp.Groupe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav">
		<g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-groupe" class="content scaffold-edit" role="main">
			<div class="row">
				<div class="page-header col-md-offset-3 col-md-6">
					${groupeInstance?.nom.toUpperCase()}
				</div>
			</div>
			<g:hasErrors bean="${groupeInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${groupeInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:uploadForm url="[resource:groupeInstance, action:'update']">
				<g:hiddenField name="version" value="${groupeInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<div class="row">
						<div class="col-md-4 col-md-offset-4">
							<g:submitButton name="update" class="save" value="Mettre à jour" />
						</div>
					</div>

				</fieldset>
			</g:uploadForm>
		</div>
	</body>
</html>
