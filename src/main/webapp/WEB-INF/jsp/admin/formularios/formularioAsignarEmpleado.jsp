<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>

</head>
<body>

	<form:form method="post" modelAttribute="asociacionEmpleadoProyecto"
		action="asignarEmpleado.htm" data-example-id="simple-input-groups"
		class="bs-example bs-example-form" id="formAsignarEmpleado">

		<label>Asignar a: </label>
		<form:select class="form-control" path="nombreEmpleado">

			<c:forEach items="${empleados}" var="empleado">

				<form:option value="${empleado.nombre} " />

			</c:forEach>



		</form:select>

		<label> al proyecto:</label>
		<form:select class="form-control" path="idProyecto">
			<c:forEach items="${proyectos}" var="proyecto">

				<form:option value="${proyecto.id}" >${proyecto.nombre}</form:option>

			</c:forEach>

		</form:select>

		<br />
		<br />
		<br />

		<input type="button" onclick="submitForm('formAsignarEmpleado','')"
			value="Asociar" class="form-control" placeholder="Username"
			aria-describedby="basic-addon1">

	</form:form>







</body>
</html>