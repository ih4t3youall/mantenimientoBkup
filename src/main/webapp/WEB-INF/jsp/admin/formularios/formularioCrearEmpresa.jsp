<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>


<script type="text/javascript">
	function doSubmitEmpresa() {
		
		
		var empresaDTO = new Object();
		empresaDTO.nombre = $("#nombre").val();
		empresaDTO.descripcion = $("#descripcion").val();
		
		
		$.ajax({
			
			url : "crearEmpresa.htm",
			type : "POST",
			data : "empresa="+empresaDTO,
			success : function(id){
				
				subirImagen(id);
				
			}
			
		});

	}

	function subirImagen(id) {


		var oMyForm = new FormData($("#upload-file-form")[0]);
		oMyForm.append("idEmpresa", id);

		$.ajax({
			url : "uploadFileEmpresa",
			type : "POST",
			data : oMyForm,
			enctype : 'multipart/form-data',
			processData : false,
			contentType : false,
			cache : false,
			success : function() {
				// Handle upload success
				// ...
			},
			error : function() {
				// Handle upload error
				// ...
			}
		});

	}
</script>

</head>
<body>




	<form:form method="post" modelAttribute="empresaDTO"
		action="crearEmpresa.htm" data-example-id="simple-input-groups"
		class="bs-example bs-example-form" id="formCrearEmpresa">

</form:form>
		<div class="input-group">
			<span id="basic-addon1" class="input-group-addon">Nom</span>
			<form:input path="nombre" type="text" id="nombre" aria-describedby="basic-addon1"
				placeholder="Nombre" class="form-control" />

		</div>
		<br>
		<div class="input-group">
			<span id="basic-addon1" class="input-group-addon">Desc</span>
			<form:input path="descripcion" type="text" id="descripcion"
				aria-describedby="basic-addon1" placeholder="Descripcion"
				class="form-control" />

		</div>
		<br>

<form id="upload-file-form">
  <label for="upload-file-input">Subir pdf:</label>
  <input id="upload-file-input" type="file" name="uploadfile" accept="*" />
</form>



		<input type="button" onclick="doSubmitEmpresa('formCrearEmpresa')"
			value="Crear" class="form-control" placeholder="Username"
			aria-describedby="basic-addon1">








</body>
</html>