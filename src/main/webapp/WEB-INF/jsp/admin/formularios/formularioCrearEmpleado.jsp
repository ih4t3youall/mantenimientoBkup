<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>

</head>
<body>

	<form:form method="post" modelAttribute="empleadoDTO"
		action="agregarEmpleado.htm" data-example-id="simple-input-groups"
		class="bs-example bs-example-form" id="formCrearEmpleado">


		<div class="input-group">
			<span id="basic-addon1" class="input-group-addon">Nom</span>
			<form:input path="nombre" type="text" aria-describedby="basic-addon1"
				placeholder="Nombre" class="form-control" />

		</div>
		<br>

		<div class="input-group">
			<span id="basic-addon1" class="input-group-addon">Ap</span>
			<form:input path="apellido" type="text"
				aria-describedby="basic-addon1" placeholder="Apellido"
				class="form-control" />

		</div>
		<br>
		<div class="input-group">
			<span id="basic-addon1" class="input-group-addon">DNI</span>
			<form:input path="dni" type="text" aria-describedby="basic-addon1"
				placeholder="DNI" class="form-control" />

		</div>

		<br>
		<div class="input-group">
			<span id="basic-addon1" class="input-group-addon">NE</span>
			<form:input path="numeroEmpleado" type="text"
				aria-describedby="basic-addon1" placeholder="Numero de empleado"
				class="form-control" />

		</div>
		<br>
		<div class="input-group">
			<span id="basic-addon1" class="input-group-addon">Dir</span>
			<form:input path="direccion" type="text"
				aria-describedby="basic-addon1" placeholder="direccion"
				class="form-control" />

		</div>
		<br>
		<div class="input-group">
			<span id="basic-addon1" class="input-group-addon">Tel</span>
			<form:input path="telefono" type="text"
				aria-describedby="basic-addon1" placeholder="Telefono (fijo)"
				class="form-control" />

		</div>
		<br>

		<div class="input-group">
			<span id="basic-addon1" class="input-group-addon">Cel</span>
			<form:input path="celular" type="text"
				aria-describedby="basic-addon1" placeholder="celular"
				class="form-control" />

		</div>

		<br>

		<input type="button" onclick="submitForm('formCrearEmpleado')"
			value="Crear" class="form-control" placeholder="Username"
			aria-describedby="basic-addon1">

	</form:form>







</body>
</html>