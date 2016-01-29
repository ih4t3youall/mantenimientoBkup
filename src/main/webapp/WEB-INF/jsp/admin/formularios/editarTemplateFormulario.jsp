<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script
	src="<c:url value='/static/bootstrap-3.3.6-dist/js/bootstrap-datepicker.js'/>"></script>


<link rel="stylesheet"
	href="<c:url value='/static/bootstrap-3.3.6-dist/css/bootstrap-datepicker.css' />">

<html>
<head>


<script type="text/javascript">
	//FIXME

	$(document).ready(
			function() { // Script del Navegador
				//porque como hay integers me pisa el placeholder con un cero y en el placeholder esta el valor de cada campo

				$.fn.datepicker.dates['es'] = {
					days : [ "Domingo", "Lunes", "Martes", "Miercoles",
							"Jueves", "Viernes", "Sabado" ],
					daysShort : [ "Dom", "Lun", "Mar", "Mier", "Jue", "Vier",
							"sab" ],
					daysMin : [ "Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa" ],
					months : [ "Enero", "Febrero", "Marzo", "Abril", "Mayo",
							"Junio", "Julio", "Agosto", "Septiembre",
							"Octubre", "Noviembre", "Diciembre" ],
					monthsShort : [ "En", "Feb", "Mar", "Abr", "May", "Jun",
							"Jul", "Aug", "Sep", "Oct", "Nov", "Dic" ],
					today : "Hoy",
					clear : "Clear",
					format : "dd/mm/yyyy",
					titleFormat : "dd MM yyyy", /* Leverages same syntax as 'format' */
					weekStart : 0,
					onClose : function() {

					}
				};

				$('.fecha').datepicker({
					language : 'es',

				});

				$('.fecha').change(function() {

					$('.datepicker').hide();

				});

			});

	$(document)
			.ready(
					function() {

						var item = $("#eppObligatorio");

						$(item)
								.find("img")
								.each(
										function(index, item2) {

											var item = $(item2).attr("id");

											$("#contenedor")
													.append(
															"<input style='display: none;' class='eppObligatorio' value='"+item+"'>");

										});

						var item = $("#eppOpcional");

						$(item)
								.find("img")
								.each(
										function(index, item2) {

											var item = $(item2).attr("id");

											$("#contenedor")
													.append(
															"<input style='display: none;' class='eppOpcional' value='"+item+"'>");

										});

					});

	$(document)
			.ready(
					function() {

						$("#closeModal")
								.click(
										function() {

											var seleccion = [];

											$('#multiple :selected')
													.each(
															function(i,
																	selected) {
																var item = new Object();
																item.valor = $(
																		selected)
																		.val();
																item.url = $(
																		selected)
																		.attr(
																				"data-img-src");

																seleccion
																		.push(item);

															});

											$(seleccion)
													.each(
															function(index,
																	item) {

																console
																		.log(item.valor);

															});

											$(seleccion)
													.each(
															function(index,
																	item) {

																if ($("#check")
																		.is(
																				':checked')) {
																	if (!existe(item.valor)) {
																		$(
																				"#contenedor")
																				.append(
																						"<input style='display: none;' class='eppOpcional' value='"+item.valor+"'>");
																		$(
																				"#eppOpcional")
																				.append(
																						"<img id='"+item.valor+"' src='"+item.url+"'/>");
																	} else {

																		console
																				.log("no agrego");
																	}

																} else {
																	if (!existe(item.valor)) {
																		$(
																				"#contenedor")
																				.append(
																						"<input style='display: none;' class='eppObligatorio' value='"+item.valor+"'>");
																		$(
																				"#eppObligatorio")
																				.append(
																						"<img id='"+item.valor+"' src='"+item.url+"'/>");
																	} else {

																		console
																				.log("no agrego");
																	}

																}

															});

										});

					});

	// 	para cuando agrego un nuevo epp ver si ya esta cargado o no y no cargarlo 2 veces
	function existe(id) {

		var flag = false;

		$(".eppOpcional").each(function(index, item) {

			if (id == $(item).val()) {

				flag = true;

			}

		});

		$(".eppObligatorio").each(function(index, item) {

			if (id == $(item).val()) {

				flag = true;

			}

		});

		return flag;

	}

	function agregarCampo() {

		var campo = '<div class="form-group"> 		<label for="usr">Ingrese Nombre Input checkbox:</label> <input type="text" class="form-control customInput textos"	id="0">	</div>';

		$('#campos').append(campo);

	}

	function doSubmit() {

		var enviar = [];
		$(".textos").each(function(index, item) {
			var aux = new Object();
			aux.label = $(item).val();

			aux.idformItem = $(item).attr("id");

			if (aux != "") {
				enviar.push(aux);
			}
		});

		if (enviar.length > 0) {

			var maquina = $("#idMaquina").html();

			var eppOpcional = [];
			var eppObligatorio = [];

			$(".eppOpcional").each(function(index, item) {

				eppOpcional.push($(item).val());

			});
			$(".eppObligatorio").each(function(index, item) {

				eppObligatorio.push($(item).val());

			});

			var fechaProgramada = $("#fechaProgramada").val();

			var send = JSON.stringify(enviar);

			$.ajax({

				url : "submitTemplateFormulario.htm",
				type : "GET",
				data : "camposFormulario=" + send + "&idMaquina=" + maquina
						+ "&eppOpcional=" + eppOpcional + "&eppObligatorio="
						+ eppObligatorio + "&fechaProgramada="
						+ fechaProgramada,
				success : function(response) {

					getForm('templateFormulario.htm');

				},
				error : function(error) {

					alert("Ocurrio un error");
				}

			});

		}
	}

	function asignarEPP() {

	}

	function marcarObligatorio() {

		
		
	}

	function marcarOpcional() {

	}

	function modalEPP() {
		
		$.ajax({

			url : "eppModal.htm",
			type : "GET",
			success : function(data) {

				$('#modalEPP').modal('show');
				$(".modal-EPP-body").empty();
				$(".modal-EPP-body").append(data);
// 				marcarObligatorio();
				
			}

		});
		
		

	}
</script>
</head>
<body>


	<!-- Modal  EPP-->
	<div class="modal fade" id="modalEPP" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-EPP-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-EPP-title"></h4>
				</div>
				<div class="modal-EPP-body"></div>
				<div class="modal-EPP-footer">
					<br />
					<hr>
					<button type="button" class="btn btn-default" id="closeModal"
						data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>


	<h3>Crear nuevo checklist</h3>
	<label id="idMaquina">${idMaquina}</label>

	<div class="form-group">

		<label for="usr">Fecha programada:</label> <input type="text"
			class="form-control customInput fecha"
			value="${form.fechaProgramada}" id="fechaProgramada">


	</div>


	<div id="eppObligatorio">
		<label>Epp obligatorio</label>
		<c:forEach items="${obligatorio}" var="epp">

			<img id="${epp.idEpp}" src="data:image/jpeg;base64,${epp.imagen}" />


		</c:forEach>
	</div>
	<br>
	<div id="eppOpcional">
		<label>EPP Opcional</label>
		<c:forEach items="${opcional}" var="epp">

			<img id="${epp.idEpp}" src="data:image/jpeg;base64,${epp.imagen}" />


		</c:forEach>

	</div>


	<div id="campos">

		<c:forEach items="${form.formItems}" var="item">

			<div class="form-group">
				<label for="usr">Ingrese Nombre Input checkbox:</label> <input
					type="text" class="form-control customInput textos"
					id="${item.idformItem}" value="${item.label}" id="usr">
			</div>

		</c:forEach>


	</div>
	<button type="button" onclick="agregarCampo()"
		class="btn btn-default btn-sm">
		<span class=" glyphicon glyphicon-pencil" aria-hidden="true"></span> +
	</button>

	<button type="button" onclick="modalEPP()"
		class="btn btn-default btn-sm">
		<span class=" glyphicon glyphicon-pencil" aria-hidden="true"></span>
		agregar EPP
	</button>


	<input type="button" id="boton" onclick="doSubmit()"
		value="Crear Template" class="form-control"
		aria-describedby="basic-addon1">






</body>
</html>