<%@ page import="grails_tp.Groupe" %>


<div class="row">
	<div class="col-md-4 col-md-offset-4">
		<div class="crop" id="previewContainer">
			<g:if test="${actionName == 'edit'}">
				<img id="previewImage" src=${grailsApplication.config.images.groupes.url}${groupeInstance.photo?.nom} />
			</g:if>
			<g:if test="${actionName != 'edit'}">
				<span class="glyphicon glyphicon-camera"></span>
			</g:if>
		</div>
		<div id="inputFileArea">
			<span>Choisir une photo *</span>
		</div>
	</div>

</div>

<div class="row">
	<div class="col-md-4 col-md-offset-4">
		<div class="input-group fieldcontain ${hasErrors(bean: groupeInstance, field: 'nom', 'error')} required">
			<label for="nom">
				<g:message code="groupe.nom.label" default="Nom" />
				<span class="required-indicator">*</span>
			</label>

			<g:textField class="form-control" name="nom" required="" value="${groupeInstance?.nom}"/>

		</div>
	</div>
</div>

<div class="row">
	<div class="col-md-4 col-md-offset-4">
		<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'parent', 'error')} required">
			<label for="parent">
				<g:message code="groupe.parent.label" default="Parent" />
				<span class="required-indicator">*</span>
			</label>
			<g:if test="${actioName == "edit"}">
				<g:select class="many-to-one form-control"  id="parent" name="parent.id" from="${listeParentsPossibles}" optionKey="id" required="" value="${groupeInstance?.parent?.id}" optionValue="nom"/>
			</g:if>
			<g:if test="${actioName != "edit"}">
				<g:select class="many-to-one form-control"  id="parent" name="parent.id" from="${groupeInstance.list()}" optionKey="id" required="" value="${groupeInstance?.parent?.id}" optionValue="nom"/>
			</g:if>

		</div>
	</div>
</div>

<g:if test="${groupeInstance.id != null}">
	<div class="row">
		<div class="col-md-4 col-md-offset-2">
			Nouvelles activités. Cliquez et déposez pour les ajouter à la liste du groupe :
			<ol class="default vertical groupeElement">
				<g:if test="${nouvellesAtivites != null && !nouvellesAtivites.isEmpty()}">
					<g:each in="${nouvellesAtivites}" var="activite">
						<li id="${activite.id}" class="activiteElement"><g:link controller="activite" action="show" id="${activite.id}">${activite.nom}</g:link></li>
					</g:each>
				</g:if>
			</ol>
		</div>

		<div class="col-md-4">
			<g:hiddenField id="listeActivites" name="listeActivites" value="21:3,5,4,6" />
			Changer l'ordre de l'affichage des activités :
			<ol id="${groupeInstance.id}" class="default vertical groupeElement">
				<g:if test="${groupeInstance.activites != null && !groupeInstance.activites.isEmpty()}">
					<g:each in="${groupeInstance.activites}" var="a">
						<li id="${a.id}" class="activiteElement"><g:link controller="activite" action="show" id="${a.id}">${a.nom}</g:link></li>
					</g:each>
				</g:if>
			</ol>

			<g:if test="${listSubGroupes != null && !listSubGroupes.isEmpty()}">
				<ol>
					<g:set var="niveauAvant" value="0" />
					<g:each in="${listSubGroupes}" var="mapPair">
						<g:set var="groupe" value="${mapPair.getKey()}" />
						<g:set var="niveauCurrent" value="${mapPair.getValue()}" />

						<g:if test="${niveauAvant.toInteger() < niveauCurrent}">
							<g:each in="${(1..(niveauCurrent - niveauAvant.toInteger()))}" var="i">
								<li><ol>
							</g:each>
						</g:if>
						<li><g:link controller="groupe" action="show" id="${groupe.id}">${groupe.nom}</g:link>
							<ol id="${groupe.id}" class="default vertical groupeElement">
								<g:each in="${groupe.activites}" var="a">
									<li id="${a.id}" class="activiteElement"><g:link controller="activite" action="show" id="${a.id}">${a.nom}</g:link></li>
								</g:each>
							</ol>
						</li>
						<g:if test="${niveauAvant.toInteger() < niveauCurrent}">
							<g:each in="${(1..(niveauCurrent - niveauAvant.toInteger()))}" var="i">
								</ol></li>
							</g:each>
						</g:if>
					</g:each>
				</ol>
			</g:if>
		</div>
	</div>
</g:if>


<asset:javascript src="fileInputArea.js"/>
