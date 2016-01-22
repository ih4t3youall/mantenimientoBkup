<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>


<script type="text/javascript">
	//FIXME
	$(document).ready(function() {
		
		$("#closeModal").click(function(){
			
			$(".select").each(function(index,item){
				
				
				console.log(item);
				
				
			});
			
			
			
			
		});
		
	});

	function agregarCampo() {

		var campo = '<div class="form-group"> 		<label for="usr">Ingrese Nombre Input checkbox:</label> <input type="text" class="form-control customInput"	id="usr">	</div>';

		$('#campos').append(campo);

	}

	function doSubmit() {

		var enviar = [];
		$(".customInput").each(function(index, item) {

			var aux;
			aux = $(item).val();

			if (aux != "") {
				enviar.push(aux);
			}

		});

		if (enviar.length > 0) {

			var maquina = $("#idMaquina").html();

			$.ajax({

				url : "submitTemplateFormulario.htm",
				type : "GET",
				data : "camposFormulario=" + enviar + "&idMaquina=" + maquina,
				success : function(response) {

					getForm('templateFormulario.htm');

				},
				error : function(error) {

					alert("Ocurrio un error");
				}

			});

		}

	}
	
	function asignarEPP(){
		
	}

	function modalEPP() {

		$.ajax({

			url : "eppModal.htm",
			type : "GET",
			success : function(data) {

				$('#modalEPP').modal('show');
				$(".modal-EPP-body").empty();
				$(".modal-EPP-body").append(data);
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
				<br/>
				<hr>
					<button type="button" class="btn btn-default" id="closeModal" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>


	<h3>Crear nuevo checklist</h3>
	<label id="idMaquina">${idMaquina}</label>
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
	
	<button type="button" onclick="modalEPP()"
		class="btn btn-default btn-sm">
		<span class=" glyphicon glyphicon-pencil" aria-hidden="true"></span> agregar EPP
	</button>


	<input type="button" id="boton" onclick="doSubmit()"
		value="Crear Template" class="form-control"
		aria-describedby="basic-addon1">






</body>
</html>