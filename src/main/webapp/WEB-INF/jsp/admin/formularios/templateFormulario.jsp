<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>



<script
	src="<c:url value='/static/bootstrap-3.3.6-dist/js/bootstrap-datepicker.js'/>"></script>


<link rel="stylesheet"
	href="<c:url value='/static/bootstrap-3.3.6-dist/css/bootstrap-datepicker.css' />">

<script type="text/javascript">
	var empresas;
	$(document).ready(
			function() {
				$("#boton").prop('disabled', true);

				$.ajax({
					url : "getEmpresas.htm",
					type : "GET",
					success : function(response) {

						data = $.parseJSON(response);
						empresas = data;
						$(data).each(
								function(index, empresa) {

									$('#comboEmpresas').append(
											'<option value='+empresa.id+'>'
													+ empresa.nombre
													+ '</option>');

								});

					}

				})

			});

	function buscarProyectoPorId(id) {

		var emp = null;
		$(empresas).each(function(index, empresa) {

			if (empresa.id == id) {

				emp = empresa;
			}

		});

		return emp;

	}

	function buscarMaquinaPorId(proyectos, proyectoId) {

		var maquinas;
		$(proyectos).each(function(index, proyecto) {

			if (proyecto.id == proyectoId) {
				maqunias = proyecto.maquinas;

			}

		});

		return maquinas;

	}

	function traerProyectos() {

		var idEmpresa = $('#comboEmpresas').val();
		var empresa = buscarProyectoPorId(idEmpresa);

		if (empresa.proyectos.length != 0) {

			if (empresa != null) {

				var nose = $(empresa.proyectos);
				if (nose.nombre == null) {
					console.log(nose.nombre);
				}
				$(empresa.proyectos).each(
						function(index, proyecto) {

							$('#comboProyectos').empty();
							$('#divComboProyectos').show();
							$('#comboProyectos').append(
									'<option value=""></option>');
							$('#comboProyectos').append(
									'<option value='+proyecto.id+'>'
											+ proyecto.nombre + '</option>');

						});

			} else {

				ocultarDosCombos();

			}

		} else {
			ocultarDosCombos();
		}
	}

	function ocultarDosCombos() {

		$('#comboProyectos').empty();
		$('#divComboProyectos').hide();
		$('#comboMaquinas').empty();
		$('#divComboMaquina').hide();
		$("#boton").prop('disabled', true);
	}

	function traerMaquinas() {

		if ($("#comboProyectos").val() == "") {
			$("#comboMaquinas").empty();
			$("#divComboMaquina").hide();
			$("#boton").prop('disabled', true);
		} else {

			var idEmpresa = $('#comboEmpresas').val();
			var idProyecto = $('#comboProyectos').val();

			var emp = buscarProyectoPorId(idEmpresa);

			$(emp.proyectos).each(
					function(index, proyecto) {

						var maquinas = proyecto.maquinas;
						$(maquinas).each(
								function(index, maquina) {
									$('#comboMaquinas').empty();
									$('#comboMaquinas').append(
											'<option value=""></option>');
									$('#comboMaquinas').append(
											'<option value='+maquina.id+'>'
													+ maquina.nombre
													+ '</option>');
									$('#divComboMaquina').show();

								});

					});
		}
	}

	function seleccionoMaquina() {

		if ($("#comboMaquinas").val() != "") {
			$("#boton").prop('disabled', false);
		} else {
			$("#boton").prop('disabled', true);
		}

	}
</script>
</head>
<body>


	<h3>Crear nuevo checklist</h3>






	<div class="form-group">
		<label for="sel1">Seleccione empresa:</label> <select
			onchange="traerProyectos()" class="form-control check"
			id="comboEmpresas">
			<option value=""></option>




		</select>
	</div>


	<div class="form-group" id="divComboProyectos" style="display: none;">
		<label for="sel1">Select list:</label> <select
			onchange="traerMaquinas()" class="form-control check"
			id="comboProyectos">



		</select>
	</div>



	<div class="form-group" id="divComboMaquina" style="display: none;">
		<label for="sel1">Select list:</label> <select
			onchange="seleccionoMaquina()" class="form-control check"
			id="comboMaquinas">


		</select>
		<label>Agregar Maquina</label>
			<button type="button" onclick="agregarCampo()"
		class="btn btn-default btn-sm">
		<span class=" glyphicon glyphicon-pencil" aria-hidden="true"></span> +
	</button>
		
	</div>


	<input type="button" id="boton" onclick="formCrearCheckList()"
		value="Crear Template" class="form-control"
		aria-describedby="basic-addon1">






</body>
</html>