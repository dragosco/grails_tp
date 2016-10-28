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
	<g:field type="number" name="lat" value="${fieldValue(bean: activiteInstance, field: 'lat')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'lng', 'error')} required">
	<label for="lng">
		<g:message code="activite.lng.label" default="Lng" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="number" name="lng" value="${fieldValue(bean: activiteInstance, field: 'lng')}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'groupes', 'error')} ">
	<label for="groupes">
		<g:message code="activite.groupes.label" default="Groupes" />
		
	</label>
	<ul>
		<g:each in="${listSuperGroupes}" var="groupeInstance">
			<li>${fieldValue(bean: groupeInstance, field: "nom")}
			</li>
		</g:each>
	</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'photos', 'error')} ">
	<label for="photos">
		<g:message code="activite.photos.label" default="Photos" />
		
	</label>
	<g:select name="photos" from="${grails_tp.Photo.list()}" multiple="multiple" optionKey="id" size="5" value="${activiteInstance?.photos*.id}" class="many-to-many"/>

</div>

