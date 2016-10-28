<%@ page import="grails_tp.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-user" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${userInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${userInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:userInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${userInstance?.version}" />

				<sec:ifNotGranted roles="ROLE_ADMIN">
					<g:if test="${sec.username() == userInstance?.username}">
						<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
							<label for="username">
								<g:message code="user.username.label" default="Username" />
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="username" required="" value="${userInstance?.username}"/>

						</div>

						<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
							<label for="password">
								<g:message code="user.password.label" default="Password" />
								<span class="required-indicator">*</span>
							</label>
							<g:textField name="password" required="" value="${userInstance?.password}"/>

						</div>
					</g:if>
				</sec:ifNotGranted>
				<sec:ifAllGranted roles='ROLE_ADMIN'>
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
						<label for="username">
							<g:message code="user.username.label" default="Username" />
							<span class="required-indicator">*</span>
						</label>
						<g:textField name="username" required="" value="${userInstance?.username}"/>

					</div>
					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
						<label for="accountExpired">
							<g:message code="user.accountExpired.label" default="Account Expired" />

						</label>
						<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />

					</div>

					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
						<label for="accountLocked">
							<g:message code="user.accountLocked.label" default="Account Locked" />

						</label>
						<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />

					</div>

					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
						<label for="enabled">
							<g:message code="user.enabled.label" default="Enabled" />

						</label>
						<g:checkBox name="enabled" value="${userInstance?.enabled}" />

					</div>

					<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
						<label for="passwordExpired">
							<g:message code="user.passwordExpired.label" default="Password Expired" />

						</label>
						<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />

					</div>
				</sec:ifAllGranted>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
