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
	$(document).ready(function() {
		$("#boton").prop('disabled', true);
	});

	var empresa = "";
	var proyecto = "";
	var maquina = "";

	function traerProyectos() {
		// 	ajaxProyectosEmpresa.htm
		var idEmpresa = $("#comboEmpresas").val();
		empresa = $("#comboEmpresas").val();

		if ($("#comboEmpresas").val() == "") {

			$("#boton").prop('disabled', true);
			$('#divComboProyectos').hide();
			$('#divComboMaquina').hide();
		} else {

			$.ajax({

				url : "ajaxProyectosEmpresa.htm",
				type : "GET",
				data : "idEmpresa=" + idEmpresa,
				success : function(response) {

					data = $.parseJSON(response);
					var tagProyectos = "";
					$.each(data, function(i, item) {
						tagProyectos += "<option value='"+item.id+"' >"
								+ item.nombre + "</option>";

					});

					$('#comboProyectos').empty();
					$('#comboProyectos').append('<option value=""></option>');
					$('#comboProyectos').append(tagProyectos);
					$('#divComboProyectos').show();

				},

			});
		}
	}
	function traerMaquinas() {
		proyecto=$("#comboProyectos").val();
		var idProyecto = $("#comboProyectos").val();;
		$.ajax({
			url : "ajaxMaquinasProyectos.htm",
			type : "GET",
			data : "idProyecto=" + idProyecto,
			success : function(response) {

				data = $.parseJSON(response);
				var tagProyectos = "";
				$.each(data, function(i, item) {
					tagProyectos += "<option value='"+item.id+"' >"
							+ item.nombre + "</option>";

				});
				$('#comboMaquina').empty();
				$('#comboMaquina').append('<option value=""></option>');
				$('#comboMaquina').append(tagProyectos);
				$('#divComboMaquina').show();
				$("#boton").prop('disabled', false);

			},

		});

	}
	
	
	function seleccionoMaquina(){
		
		maquina = $("#comboMaquina").val();
		
	}
	
	
</script>
</head>
<body>


	<h3>Crear nuevo checklist</h3>






	<div class="form-group">
		<label for="sel1">Select list:</label> <select
			onchange="traerProyectos()" class="form-control check" id="comboEmpresas">
			<option value=""></option>

			<c:forEach items="${empresas}" var="empresa">

				<option value="${empresa.id}">${empresa.nombre}</option>

			</c:forEach>



		</select>
	</div>


	<div class="form-group" id="divComboProyectos" style="display: none;">
		<label for="sel1">Select list:</label> <select
			onchange="traerMaquinas()" class="form-control check" id="comboProyectos">



		</select>
	</div>



	<div class="form-group" id="divComboMaquina" style="display: none;">
		<label for="sel1">Select list:</label> <select
			onchange="seleccionoMaquina()" class="form-control check"
			id="comboMaquina">


		</select>
	</div>


	<input type="button" id="boton" onclick="formCrearCheckList()"
		value="Crear Template" class="form-control"
		aria-describedby="basic-addon1">






</body>
</html>