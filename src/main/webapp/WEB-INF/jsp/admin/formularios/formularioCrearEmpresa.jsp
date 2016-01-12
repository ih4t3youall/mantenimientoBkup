<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>

</head>
<body>

	<form:form method="post" modelAttribute="empresaDTO"
		action="crearEmpresa.htm" data-example-id="simple-input-groups"
		class="bs-example bs-example-form" id="formCrearEmpresa">


		<div class="input-group">
			<span id="basic-addon1" class="input-group-addon">Nom</span>
			<form:input path="nombre" type="text" aria-describedby="basic-addon1"
				placeholder="Nombre" class="form-control" />

		</div>
		<br>
		<div class="input-group">
			<span id="basic-addon1" class="input-group-addon">Desc</span>
			<form:input path="descripcion" type="text" aria-describedby="basic-addon1"
				placeholder="Descripcion" class="form-control" />

		</div>
		<br>
		<div class="input-group">
			<span id="basic-addon1" class="input-group-addon">Url-Img</span>
			<form:input path="urlImagen" type="text" aria-describedby="basic-addon1"
				placeholder="url Imagen" class="form-control" />

		</div>
		

	


		<input type="button" onclick="submitForm('formCrearEmpresa')"
			value="Crear" class="form-control" placeholder="Username"
			aria-describedby="basic-addon1">

	</form:form>







</body>
</html>