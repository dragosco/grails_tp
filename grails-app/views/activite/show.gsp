
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

				<div class="col-md-3">
						${activiteInstance?.description}
						<div id="nomActiviteDiv">
							${activiteInstance?.nom}
						</div>
						<input id="latActivite" type="hidden" value="${activiteInstance?.lat}" />
						<input id="lngActivite" type="hidden" value="${activiteInstance?.lng}" />

						${activiteInstance?.auteur.username}

						<g:each in="${activiteInstance.groupes}" var="g">
							<ul class="list-inline">
								<li>
									<g:link controller="groupe" action="show" id="${g.id}">${g?.nom}</g:link>
								</li>
							</ul>

						</g:each>
				</div>
				<div class="col-md-9">

				</div>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div id="myCarousel" class="carousel slide" data-ride="carousel" style="height: 400px;">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<g:set var="i" value="0"/>
							<g:each in="${activiteInstance.photos}" var="p">
								<g:if test="${i == "0"}">
									<li data-target="#myCarousel" data-slide-to="${i}" class="active"> </li>
								</g:if>
								<g:if test="${i != "0"}">
									<li data-target="#myCarousel" data-slide-to="${i}"> </li>
								</g:if>

								<g:set var="i" value="${i+1}"/>
							</g:each>
						</ol>

						<!-- Wrapper for slides -->

						<div class="carousel-inner" role="listbox">
							<g:set var="i" value="0"/>
							<g:each in="${activiteInstance.photos}" var="p">
								<g:if test="${i == "0"}">
									<div class="item active">
								</g:if>
								<g:if test="${i != "0"}">
									<div class="item">
								</g:if>
								<img style="max-height: 400px; max-width: 80%; margin: auto;" src=${grailsApplication.config.images.activites.url}${p.nom} alt="${p.nom}">
								</div>
								<g:set var="i" value="${i+1}"/>
							</g:each>
						</div>

							<!-- Left and right controls -->
							<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
								<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
								<span class="sr-only">Previous</span>
							</a>
							<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
								<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
								<span class="sr-only">Next</span>
							</a>
						</div>
				</div>
				<div class="col-md-6">
					<div id="map_activite_unique" style="width:100%; height:400px;"></div>
					<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBL7CpoZYB65LA0bjOghxwIN98SaqXFwQA&callback=mapActivite"></script>
				</div>
			</div>

			<sec:ifAnyGranted roles='ROLE_ADMIN, ROLE_MOD'>
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
			</sec:ifAnyGranted>
		</div>
	</body>
</html>
