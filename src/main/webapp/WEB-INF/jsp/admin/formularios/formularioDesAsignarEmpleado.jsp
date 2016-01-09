<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<script type="text/javascript">
	$(document).ready(function() {
	
		cambio();

	});
</script>
</head>
<body>

	<form:form method="post" modelAttribute="asociacionEmpleadoProyecto"
		action="asignarEmpleado.htm" data-example-id="simple-input-groups"
		class="bs-example bs-example-form" id="formAsignarEmpleado">

		<label>Desasignar a: </label>
		<form:select onchange="cambio()" class="form-control"
			path="nombreEmpleado">

			<c:forEach items="${empleados}" var="empleado">
				<form:option value="${empleado.id}">${empleado.nombre}</form:option>
			</c:forEach>
		</form:select>

		<br />
		<br />
		<br />

		<label id="labelProyectosA">Proyectos a los cuales esta asignado:</label>
		<div id="contenedorAsignacion">
		
		
		</div>

		<br />
		<br />
		<br />

		<input type="button" onclick="submitForm('formAsignarEmpleado','')"
			value="DesAsociar" class="form-control" placeholder="Username"
			aria-describedby="basic-addon1">

	</form:form>









</body>
</html>