<%@ page import="grails_tp.Activite" %>
<%@ page import="grails_tp.GroupeService" %>


<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'nom', 'error')} required">
	<div class="row">
		<div class="col-md-2 col-md-offset-4">
			<span class="label">Nom *</span>
		</div>
		<div class="col-md-3">
			<g:textField class="form-control" name="nom" required="" value="${activiteInstance?.nom}"/>
		</div>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'description', 'error')} ">
	<div class="row">
		<div class="col-md-2 col-md-offset-4">
			<span class="label">Description *</span>
		</div>
		<div class="col-md-3">
			<g:textArea class="form-control" name="description" value="${activiteInstance?.description}"/>
		</div>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'lat', 'error')} required">
	<div class="row">
		<div class="col-md-2 col-md-offset-4">
			<span class="label">Latitude *</span>
		</div>
		<div class="col-md-3">
			<g:field class="form-control" id="lat" type="number" name="lat" value="${fieldValue(bean: activiteInstance, field: 'lat')}" required=""/>
		</div>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'lng', 'error')} required">
	<div class="row">
		<div class="col-md-2 col-md-offset-4">
			<span class="label">Longitude *</span>
		</div>
		<div class="col-md-3">
			<g:field class="form-control" id="lng" type="number" name="lng" value="${fieldValue(bean: activiteInstance, field: 'lng')}" required=""/>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-6 col-md-offset-3 text-center">
		<span>Cliquer sur la carte pour localiser votre activité.</span>
	</div>
</div>
<div class="row">
	<div class="col-md-6 col-md-offset-3">
		<div id="map" style="width:100%;height:300px"></div>
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBL7CpoZYB65LA0bjOghxwIN98SaqXFwQA&callback=myMap"></script>
	</div>
</div>


<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'groupes', 'error')} ">
	<g:hiddenField id="groupes" name="groupList" value="${listIdGroupes}" />
	<div class="row">
		<div class="col-md-6 col-md-offset-3 text-center">
				<span>Afin d'afiner la recherche de votre activité, veuillez sélectionner les groupes auxquels elle appartient.</span>
		</div>
	</div>

	<g:each in="${listSuperGroupes}" var="superGroupe">
		<div class="row">
			<div class="col-md-2 col-md-offset-4">
				<span class="label">${fieldValue(bean: superGroupe, field: "nom")}</span>
			</div>
			<g:set var="mapSubGroupes" value="${listGroupeHierarchy.get(superGroupe)}" />

				<div class="col-md-3">
					<select class="superGroup form-control" onchange="refreshGroupList()">
						<option selected value> -- Faites un choix -- </option>
						<g:each in="${mapSubGroupes}" var="subGroupe">
							<g:set var="key" value="${subGroupe.getKey()}" />
							<g:set var="niveau" value="${subGroupe.getValue()}" />
							<option value=${key.id}>
								<g:each in="${0..niveau}" var="i">&nbsp;&nbsp;&nbsp;</g:each>
								${fieldValue(bean: key, field: "nom")}</option>
						</g:each>
					</select>
				</div>
		</div>

	</g:each>

</div>

<div class="fieldcontain ${hasErrors(bean: activiteInstance, field: 'photos', 'error')} ">
	<div class="row">
		<div class="col-md-3 col-md-offset-6">
			<div class="crop" id="previewContainer"><span class="glyphicon glyphicon-camera"></span></div>
			<div id="inputFileArea">
				<span>Choisir une photo *</span>
			</div>
		</div>
	</div>
</div>

<asset:javascript src="fileInputArea.js"/>
