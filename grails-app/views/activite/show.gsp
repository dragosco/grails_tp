
<%@ page import="grails_tp.Activite" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav">
		<g:set var="entityName" value="${message(code: 'activite.label', default: 'Activite')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-activite" class="content scaffold-show" role="main">

			<div class="row">
				<div class="page-header col-md-12">
					${activiteInstance?.nom.toUpperCase()}
				</div>
			</div>

			<div class="row">
				<div class="col-md-9">
					<div id="map_activite_unique" style="width:100%; height:400px;"></div>
					<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBL7CpoZYB65LA0bjOghxwIN98SaqXFwQA&callback=mapActivite"></script>
				</div>
				<div class="col-md-3">
						${activiteInstance?.description}
						<div id="nomActiviteDiv">
							${activiteInstance?.nom}
						</div>
						<input class="latActivite" type="hidden" value="${activiteInstance?.lat}" />
						<input class="lngActivite" type="hidden" value="${activiteInstance?.lng}" />

						${activiteInstance?.auteur}

						<g:each in="${activiteInstance.groupes}" var="g">
							<ul class="list-inline">
								<li>
									<g:link controller="groupe" action="show" id="${g.id}">${g?.nom}</g:link>
								</li>
							</ul>

						</g:each>
				</div>
			</div>


			<g:form url="[resource:activiteInstance, action:'delete']" method="DELETE">
				<div class="row">
					<div class="col-md-2 col-md-offset-4">
						<g:link class="edit-btn" action="edit" resource="${activiteInstance}"><g:message code="Editer" default="Edit" /></g:link>
					</div>
					<div class="col-md-2">
						<g:actionSubmit class="delete-btn" action="delete" value="Supprimer" onclick="return confirm('En êtes-vous certain ?');" />
					</div>
				</div>
				<fieldset class="buttons">


				</fieldset>
			</g:form>
		</div>
	</body>
</html>
