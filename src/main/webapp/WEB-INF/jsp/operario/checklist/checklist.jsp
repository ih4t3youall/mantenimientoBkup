<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Menu Operario</title>

<%-- <link href="<c:url value='/static/css/bootstrap.css' />" --%>
<!-- 	rel="stylesheet"></link> -->
<%-- <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link> --%>



<script src="<c:url value='/static/jquery/jquery-1.11.3.min.js' />"></script>




<script
	src="<c:url value='/static/bootstrap-3.3.6-dist/js/bootstrap-datepicker.js'/>"></script>


<link rel="stylesheet"
	href="<c:url value='/static/bootstrap-3.3.6-dist/css/bootstrap-datepicker.css' />">

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
<!-- tabla -->
<script src="<c:url value='/static/jquery/jquery.dataTables.min.js'/>"></script>

<link rel="stylesheet"
	href="<c:url value='/static/css/jquery.dataTables.min.css' />">




<script type="text/javascript">
	$(document).ready(function() {
		$('#example').DataTable();
	});

	$(document).ready(
			function() {

				$(document).ready(
						function() { // Script del Navegador
							//porque como hay integers me pisa el placeholder con un cero y en el placeholder esta el valor de cada campo
							$('.form-control').each(function(index, item) {

								//para evitar que le saque el label al ultimo boton
								if (index != 7) {
									$(item).val("");
								}
							});

							$.fn.datepicker.dates['es'] = {
								days : [ "Domingo", "Lunes", "Martes",
										"Miercoles", "Jueves", "Viernes",
										"Sabado" ],
								daysShort : [ "Dom", "Lun", "Mar", "Mier",
										"Jue", "Vier", "sab" ],
								daysMin : [ "Do", "Lu", "Ma", "Mi", "Ju", "Vi",
										"Sa" ],
								months : [ "Enero", "Febrero", "Marzo",
										"Abril", "Mayo", "Junio", "Julio",
										"Agosto", "Septiembre", "Octubre",
										"Noviembre", "Diciembre" ],
								monthsShort : [ "En", "Feb", "Mar", "Abr",
										"May", "Jun", "Jul", "Aug", "Sep",
										"Oct", "Nov", "Dic" ],
								today : "Hoy",
								clear : "Clear",
								format : "dd/mm/yyyy",
								titleFormat : "MM yyyy", /* Leverages same syntax as 'format' */
								weekStart : 0,
								onClose : function() {
									console.log("asdasda");
									alert('asdasd');
								}
							};

							$('.fecha').datepicker({
								language : 'es',

							});

							$('.fecha').change(function() {

								$('.datepicker').hide();

							});

						});

			});
</script>

<style type="text/css">

.borde {
  border-top-style: solid;
  border-right-style: solid;
  border-bottom-style: solid;
  border-left-style: solid;
}
</style>

</head>
<body>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-3">
			<img width="150px" src="${empresa.urlImagen}" />
		</div>
		<div class="col-md-3">
			<p>CHECK LIST DE MANTENIMIENTO PREVENTIVO ${maquina.nombre}</p>

		</div>
		<div class="col-md-2">
			<img width="150px"
				src="<c:url value='/static/imagenes/logo/imasd.png' />" />

		</div>
		<div class="col-md-2">
			<p>aca va una fecha no se de que</p>
			<p>R:24.00 -- este numero tampoco se que es</p>
			
		</div>
		<div class="col-md-1"></div>
	</div>

	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<p>Equipo: ${maquina.nombre}</p>
			<hr>
		</div>
		<div class="col-md-1"></div>

	</div>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-2">
			<label>Fecha realizacion:</label>
		</div>
		<div class="col-md-2">
			<input type="text" aria-describedby="basic-addon1"
				placeholder="Fecha Programada" class="form-control fecha" />
		</div>
		<div class="col-md-2">
			<label>Fecha Programada: </label>
		</div>
		<div class="col-md-2">
			<!-- FIXME -->
			<label>Aca va una fecha que no se bien como se carga</label>
		</div>
		<div class="col-md-1"></div>
	</div>
	
<!-- 	separador -->
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		<hr>
		</div>
		<div class="col-md-1"></div>
	</div>
	
<!-- 	fin separador -->


	<div class="row">
		<div class="col-md-1"></div>


		<div class="col-md-3">
			<label>Numero de interno</label>

		</div>
		<div class="col-md-2">aca se escribe nro interno</div>

		<div class="col-md-3">
			<label>Numero de Orden</label>
		</div>
		<div class="col-md-2">
			<label>aca se escribe el nuemro de orden</label>
		</div>





		<div class="col-md-1"></div>



	</div>
	<!-- 	separador -->
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		<hr>
		</div>
		<div class="col-md-1"></div>
	</div>
	
<!-- 	fin separador -->

	<div class="row">

		<div class="col-md-1"></div>

		<div class="col-md-2">
			<label>EPP Obligatorio durante el mantenimiento</label>

		</div>


		<div class="col-md-8">

			<label>Aca van las imagenes de los casquitos</label>
		</div>

		<div class="col-md-1"></div>



	</div>
<!-- 	separador -->
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		<hr>
		</div>
		<div class="col-md-1"></div>
	</div>
	
<!-- 	fin separador -->

	<div class="row">

		<div class="col-md-1"></div>

		<div class="col-md-2">
			<label>EPP adicionales durante el mantenimiento</label>

		</div>


		<div class="col-md-8">

			<label>Aca van las imagenes de los casquitos</label>
		</div>

		<div class="col-md-1"></div>



	</div>

<!-- 	separador -->
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		<hr>
		</div>
		<div class="col-md-1"></div>
	</div>
	
<!-- 	fin separador -->
	<!-- aca arranca la tabla -->
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">

			<table width="100%" cellspacing="0" class="display dataTable"
				id="example" role="grid" aria-describedby="example_info"
				style="width: 100%;">
				<thead>
					<tr role="row">
						<th class="sorting_asc" tabindex="0" aria-controls="example"
							rowspan="1" colspan="1" style="width: 136px;"
							aria-sort="ascending"
							aria-label="Name: activate to sort column descending">Condiciones
							Generales</th>
						<th class="sorting" tabindex="0" aria-controls="example"
							rowspan="1" colspan="1" style="width: 218px;"
							aria-label="Position: activate to sort column ascending">Posee</th>
						<th class="sorting" tabindex="0" aria-controls="example"
							rowspan="1" colspan="1" style="width: 102px;"
							aria-label="Office: activate to sort column ascending">Estado</th>
						<th class="sorting" tabindex="0" aria-controls="example"
							rowspan="1" colspan="1" style="width: 43px;"
							aria-label="Age: activate to sort column ascending">Observaciones</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th rowspan="1" colspan="1">Condiciones Generales</th>
						<th rowspan="1" colspan="1">Posee</th>
						<th rowspan="1" colspan="1">Estado</th>
						<th rowspan="1" colspan="1">Observaciones</th>
					</tr>
				</tfoot>
				<tbody>


					<c:forEach items="${form.formItems}" var="item">
					
						<tr role="row" class="odd">
						<td class="sorting_1">${item.label}</td>
						<td>
						<select>
						<option>si</option>
						<option>no</option>
						<option>N/C</option>
						
						</select>
						
						</td>
						<td>
						<select>
						<option>B</option>
						<option>M</option>
						<option>N/C</option>
						
						</select>
						
						</td>
						<td>texto</td>
					</tr>


					</c:forEach>




				</tbody>
			</table>
		</div>



		<div class="col-md-1"></div>

	</div>
	<!-- 	separador -->
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		<hr>
		</div>
		<div class="col-md-1"></div>
	</div>
	
<!-- 	fin separador -->
	<div class="row">
	
	<div class="col-md-1"></div>
	<div class="col-md-10">
	<label>Observaciones: text input</label>
	
	</div>
	
	
	<div class="col-md-1"></div>
	
	</div>
	
	<!-- 	separador -->
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		<hr>
		</div>
		<div class="col-md-1"></div>
	</div>
	
<!-- 	fin separador -->
	<div class="row">
	
	<div class="col-md-1"></div>
	
	<div class="col-md-10">
	
	<label>NOTA : Cada vez que en la lista de verificacion se genere un NO, esto debe ser acompañado de su correspondiente NO CONFORMIDAD.</label>
	</div>
	
	<div class="col-md-1"></div>
	
	</div>
	<!-- 	separador -->
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		<hr>
		</div>
		<div class="col-md-1"></div>
	</div>
	
<!-- 	fin separador -->
	
	<div class="row">
	<div class="col-md-1"></div>
	
	
	<div class="col-md-4">
	<label>CONCLUCION:</label>
	
	
	</div>
	<div class="col-md-4">
	<label>APTO PARA SERVICIO </label>
	
	
	</div>
	
	<div class="col-md-2">
	
	<select>
	<option>
	si
	</option>
	<option>
	no
	</option>
	
	</select>
	
	</div>
	
	
	<div class="col-md-1"></div>
	
	
	
	</div>
	<!-- 	separador -->
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
		<hr>
		</div>
		<div class="col-md-1"></div>
	</div>
	
<!-- 	fin separador -->
	
	


</body>
</html>