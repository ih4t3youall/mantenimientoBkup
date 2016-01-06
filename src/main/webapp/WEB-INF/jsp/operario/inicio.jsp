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



<!-- owl -->
<link rel="stylesheet"
	href="<c:url value='/static/owl-carousel/owl-carousel/owl.carousel.css' />">
<link rel="stylesheet"
	href="<c:url value='/static/owl-carousel/owl-carousel/owl.theme.css'/>">


<script
	src="<c:url value='/static/owl-carousel/owl-carousel/owl.carousel.js'/>"></script>
<!-- end owl -->


<script type="text/javascript">
	var pila = "";
	$(document).ready(function() {

		$('#contenedorSecundario').hide();
		cambiarTituloProyecto();

	});
	
	

	function volver() {
		cambiarTituloProyecto();
		$('#contenedorSecundario').hide();
		$('#contenedorPrimario').show();

	}

	function cambiarTituloProyecto() {
		$('#titulo').html("Proyectos");
		$('#copete').html("Seleccione un proyecto para continuar");

	}

	function cambiarTituloMaquinas() {

		$('#titulo').html("Maquinas");
		$('#copete').html("Seleccione maquina a editar");

	}

	function maquinas(nombreProyecto) {
		$.ajax({
			url : "proyectos.htm",
			type : 'GET',
			data : "nombreProyecto=" + nombreProyecto,
			success : function(response) {

				$('#contenedorPrimario').hide();
				$('#contenedorSecundario').show();
				$('#contenedorSecundario').empty();
				$('#contenedorSecundario').append(response);
				cambiarTituloMaquinas();

			},
			error : function() {
				alert("Ha ocurrido un error");
			}
		});

	}
</script>

</head>
<body>
	<div tabindex="-1" id="content" class="bs-docs-header">
		<div class="container">
			<h1 id="titulo"></h1>
			<p id="copete"></p>
			<div id="carbonads-container">
				<div class="carbonad">
					<div id="azcarbon"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">

		<div class="col-md-1"></div>
		<div class="col-md-2">

			<ul class="nav nav-pills nav-stacked navegador">
				<li role="presentation" class="active "><a class="desplegable" href="#">Usuario</a></li>
				<ul class="nav nav-pills nav-stacked subnavegador">
					<li>Deslogearse</li>
				</ul>
				<li role="presentation"><a href="#">Profile</a></li>
				<li role="presentation"><a href="#">Messages</a></li>
			</ul>




		</div>
		<div class="col-md-5" id="contenedor">
			<div id="contenedorPrimario">
				<c:forEach items="${proyectos}" var="proyecto">
					<div class="panel panel-default"
						onclick="maquinas('${proyecto.nombre}')">
						<div class="panel-heading">
							<h3 class="panel-title">${proyecto.nombre}</h3>
						</div>
						<div class="panel-body">${proyecto.descripcion}</div>
					</div>


				</c:forEach>
			</div>
			<div id="contenedorSecundario"></div>


		</div>
		<div class="col-md-4"></div>
	</div>






</body>
</html>