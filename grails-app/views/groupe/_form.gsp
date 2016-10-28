<%@ page import="grails_tp.Groupe" %>

<div class="row">
	<div class="col-md-6">
		<div class="crop" id="previewContainer"><span class="glyphicon glyphicon-camera"></span></div>
		<div id="inputFileArea">
			<span>Choisir une photo *</span>
		</div>
	</div>
	<div class="col-md-6">
		<div class="row">
			<div class="col-md-12">
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
			<div class="col-md-12">
				<div class="fieldcontain ${hasErrors(bean: groupeInstance, field: 'parent', 'error')} required">
					<label for="parent">
						<g:message code="groupe.parent.label" default="Parent" />
						<span class="required-indicator">*</span>
					</label>
					<g:select class="many-to-one form-control"  id="parent" name="parent.id" from="${groupeInstance.list()}" optionKey="id" required="" value="${groupeInstance?.parent?.id}" optionValue="nom"/>

				</div>
			</div>
		</div>

	</div>

</div>



<asset:javascript src="dragndrop.js"/>