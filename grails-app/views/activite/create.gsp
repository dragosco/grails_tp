<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav">
		<g:set var="entityName" value="${message(code: 'activite.label', default: 'Activite')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="create-activite" class="content scaffold-create" role="main">
			<div class="row">
				<div class="page-header col-md-offset-3 col-md-6">
					CREER UNE NOUVELLE ACTIVITE
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
			<g:form url="[resource:activiteInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<div class="row">
						<div class="col-md-6 col-md-offset-3">
							<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Valider')}" />
						</div>
					</div>

				</fieldset>
			</g:form>


		</div>
	</body>
</html>
