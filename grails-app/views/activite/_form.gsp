<%@ page import="grails_tp.Activite" %>
<%@ page import="grails_tp.GroupeService" %>


<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'nom', 'error')} required">
	<label for="nom">
		<g:message code="activite.nom.label" default="Nom" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nom" required="" value="${activiteInstance?.nom}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="activite.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${activiteInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'lat', 'error')} required">
	<label for="lat">
		<g:message code="activite.lat.label" default="Lat" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="lat" type="number" name="lat" value="${fieldValue(bean: activiteInstance, field: 'lat')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'lng', 'error')} required">
	<label for="lng">
		<g:message code="activite.lng.label" default="Lng" />
		<span class="required-indicator">*</span>
	</label>
	<g:field id="lng" type="number" name="lng" value="${fieldValue(bean: activiteInstance, field: 'lng')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'groupes', 'error')} ">
	<g:hiddenField id="groupes" name="groupList" value="${listIdGroupes}" />
	<label>
		<g:message code="activite.groupes.label" default="Groupes" />
	</label>
	<g:each in="${listSuperGroupes}" var="superGroupe">
		<label>${fieldValue(bean: superGroupe, field: "nom")}</label>
		<g:set var="mapSubGroupes" value="${listGroupeHierarchy.get(superGroupe)}" />
		<select class="superGroup" onchange="refreshGroupList()">
			<option selected value> -- Faites un choix -- </option>
			<g:each in="${mapSubGroupes}" var="subGroupe">
				<g:set var="key" value="${subGroupe.getKey()}" />
				<g:set var="niveau" value="${subGroupe.getValue()}" />
				<option value=${key.id}>
					<g:each in="${0..niveau}" var="i">&nbsp;&nbsp;&nbsp;</g:each>
					${fieldValue(bean: key, field: "nom")}</option>
			</g:each>
		</select>
	</g:each>

</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'photos', 'error')} ">
	<label for="photos">
		<g:message code="activite.photos.label" default="Photos" />
		
	</label>
	<g:select name="photos" from="${grails_tp.Photo.list()}" multiple="multiple" optionKey="id" size="5" value="${activiteInstance?.photos*.id}" class="many-to-many"/>

</div>

