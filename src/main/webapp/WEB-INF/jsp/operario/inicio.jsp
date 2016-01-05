<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu Operario</title>

<%-- <link href="<c:url value='/static/css/bootstrap.css' />" --%>
<!-- 	rel="stylesheet"></link> -->
<%-- <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link> --%>



<script src="<c:url value='/static/jquery/jquery-1.11.3.min.js' />"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="<c:url value='/static/bootstrap-3.3.6-dist/css/bootstrap.min.css' />">


<!-- Optional theme -->
<link rel="stylesheet"
	href="<c:url value='/static/bootstrap-3.3.6-dist/css/bootstrap-theme.min.css' />">

<!-- Latest compiled and minified JavaScript -->
<script
	src="<c:url value='/static/bootstrap-3.3.6-dist/js/bootstrap.min.js' />"></script>



</head>
<body>
	<div tabindex="-1" id="content" class="bs-docs-header">
		<div class="container">
			<h1>Components</h1>
			<p>Over a dozen reusable components built to provide iconography,
				dropdowns, input groups, navigation, alerts, and much more.</p>
			<div id="carbonads-container">
				<div class="carbonad">
					<div id="azcarbon"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">

		<div class="col-md-4"></div>
		<div class="col-md-4">

			<c:forEach items="${proyectos}" var="proyecto">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">${proyecto.nombre}</h3>
					</div>
					<div class="panel-body">${proyecto.descripcion}</div>
				</div>


			</c:forEach>
		</div>
		<div class="col-md-4"></div>
	</div>






</body>
</html>