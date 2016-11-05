
<%@ page import="grails_tp.Groupe" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="mainWithNav">
		<g:set var="entityName" value="${message(code: 'groupe.label', default: 'Groupe')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-groupe" class="content scaffold-show" role="main">
			<div class="row">
				<div class="page-header col-md-12">
					${groupeInstance?.nom.toUpperCase()}
				</div>
			</div>

			<div class="row">
				<div class="col-md-9">
					<div id="map_activites" style="width:100%; height:400px;"></div>
					<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBL7CpoZYB65LA0bjOghxwIN98SaqXFwQA&callback=mapGroupe"></script>
				</div>
				<div class="col-md-3">



					<g:if test="${groupeInstance?.groupes}">
						<ul class="listeSuperGroupes" id="${groupeInstance.id}">
							<g:set var="niveauAvant" value="0" />
							<g:each in="${listSubGroupes}" var="mapPair">
								<g:set var="groupe" value="${mapPair.getKey()}" />
								<g:set var="niveauCurrent" value="${mapPair.getValue()}" />

								<g:if test="${niveauAvant.toInteger() < niveauCurrent}">
									<g:each in="${(1..(niveauCurrent - niveauAvant.toInteger()))}" var="i">
										<li><ul class="listeGroupes">
									</g:each>
								</g:if>
								<li>
									<g:link controller="groupe" action="show" id="${groupe.id}">${groupe.nom}</g:link>
									<ul class="listeActivites" id="groupe_${groupe.id}">
										<g:each in="${groupe.activites}" var="a">
											<li class="activiteListItem" id="activite_${a.id}">
												<g:link  style="text-decoration: none;color: #3e8f3e; font-size: 15px; font-family: 'Josefin Sans', sans-serif;" controller="activite" action="show" id="${a.id}">${a.nom}</g:link>
												<input class="latInput" type="hidden" value="${a.lat}"/>
												<input class="lngInput" type="hidden" value="${a.lng}"/>
											</li>

										</g:each>
									</ul>
								</li>
								<g:if test="${niveauAvant.toInteger() < niveauCurrent}">
									<g:each in="${(1..(niveauCurrent - niveauAvant.toInteger()))}" var="i">
										</ul></li>
									</g:each>
								</g:if>
							</g:each>
						</ul>
					</g:if>
				</div>

			</div>
			<sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MOD'>
				<g:form url="[resource:groupeInstance, action:'delete']" method="DELETE">
					<fieldset class="buttons">
						<div class="row">
							<div class="col-md-2 col-md-offset-4">
							<g:link class="edit-btn" action="edit" resource="${groupeInstance}">Editer</g:link>
							</div>
							<div class="col-md-2">
							<g:actionSubmit class="delete-btn" action="delete" value="Supprimer" onclick="return confirm('En êtes-vous certain ?');" />
						</div>
							</div>

					</fieldset>
				</g:form>
			</sec:ifAnyGranted>
		</div>
	</body>
</html>
