<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu Operario</title>



<style type="text/css">
#owl-demo .item {
	margin: 3px;
}

#owl-demo .item img {
	display: block;
	width: 100%;
	height: auto;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {

		$("#owl-demo").owlCarousel({

			autoPlay : 3000, //Set AutoPlay to 3 seconds

			items : 4,
			itemsDesktop : [ 1199, 3 ],
			itemsDesktopSmall : [ 979, 3 ]

		});

	});
</script>

</head>
<body>
	<div id="owl-demo">

		<div class="item">
			<img
				src="http://i.argentino.com.ar/images/2012/0716/736664-alquiler-de-maquinas-pala-retro-excavadora-y-minipala-20120716061409637.jpg"
				alt="Owl Image">
		</div>
		<div class="item">
			<img
				src="http://www.gruponovaenergia.com/fotos/maquina-absorcion-vapor.jpg"
				alt="Owl Image">
		</div>
		<div class="item">
			<img
				src="http://www.juntadeandalucia.es/averroes/iesalfonso_romero_barcojo/departamentos/tecnologia/unidades_didacticas/maquinas/imagenesmaquinas/maquina_portada.jpg"
				alt="Owl Image">
		</div>
		<div class="item">
			<img
				src="http://www.egamaster.com/modelos/2017/n/M%C3%A1quinas_Para_Tubo-Maquinas_De_Prensado_Radial-PRESSMATIC_PORTABLE_CCA-PRESSMATIC_PORTABLE_CCA.png"
				alt="Owl Image">
		</div>
		<div class="item">
			<img
				src="http://www.redusers.com/noticias/wp-content/uploads/2011/04/maquina_escribir.jpg"
				alt="Owl Image">
		</div>

	</div>
	 <button type="submit" onclick="volver()" class="btn btn-default">Volver</button>




</body>
</html>