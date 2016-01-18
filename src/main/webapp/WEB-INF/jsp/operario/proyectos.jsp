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
	
	
	function getCheckList(maquinaId,proyectoId){
		
		console.log(maquinaId);
		console.log(proyectoId);
		
		
		$("body").empty();	
		$.ajax({
			
			url : "getCheckListById.htm",
			type : "GET",
			data : "maquinaId="+maquinaId+"&proyectoId="+proyectoId,
			success:function(response){
				
				$("body").empty();
				$("body").append(response);
				
			}
			
		});
		
		
	}
</script>

</head>
<body>
	<div id="owl-demo">


		<c:forEach items="${maquinas}" var="maquina">


			<div class="item">


				<div onclick="getCheckList('${maquina.id}','${idProyecto}')" class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">${maquina.nombre}</h3>
					</div>
					<div class="panel-body">${maquina.descripcion}</div>
				</div>

			</div>




		</c:forEach>



	</div>
	<button type="submit" onclick="volver()" class="btn btn-default">Volver</button>




</body>
</html>