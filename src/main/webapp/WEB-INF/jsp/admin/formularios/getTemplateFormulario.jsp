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
		// 		$("#boton").prop('disabled', true);
	});

	function agregarCampo() {

		var campo = '<div class="form-group"> 		<label for="usr">Ingrese Nombre Input checkbox:</label> <input type="text" class="form-control customInput"	id="usr">	</div>';

		$('#campos').append(campo);

	}

	function submit() {

		var enviar = [];

		$(".customInput").each(function(index, item) {
			var aux;
			aux = $(item).val();

			if (aux != "") {
				enviar.push(aux);
			}

		});

		$.ajax({

			url : "submitTemplateFormulario.htm",
			type : "GET",
			data : "camposFormulario=" + enviar + "&idMaquina=" + maquina,
			success : function(response) {

			},
			error : function(error) {
				alert("ocurrio un error");
				console.log(error);

			}

		});

	}
</script>
</head>
<body>


	<h3>Crear nuevo checklist</h3>
	<div id="campos">
		<div class="form-group">
			<label for="usr">Ingrese Nombre Input checkbox:</label> <input
				type="text" class="form-control customInput" id="usr">
		</div>


	</div>
	<button type="button" onclick="agregarCampo()"
		class="btn btn-default btn-sm">
		<span class=" glyphicon glyphicon-pencil" aria-hidden="true"></span> +
	</button>

	<input type="button" id="boton" onclick="submit()"
		value="Crear Template" class="form-control"
		aria-describedby="basic-addon1">






</body>
</html>