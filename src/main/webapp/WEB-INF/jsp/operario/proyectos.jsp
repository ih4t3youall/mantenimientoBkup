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


<!-- Important Owl stylesheet -->



<link rel="stylesheet" href="<c:url value='/static/owl-carousel/owl-carousel/owl.carousel.css' />">
 
<!-- Default Theme -->
<link rel="stylesheet" href="<c:url value='/static/owl-carousel/owl-carousel/owl.theme.css'/>">
 
 
<!-- Include js plugin -->
<script src="<c:url value='/static/owl-carousel/owl-carousel/owl.carousel.js'/>"></script>
<!-- end owl -->


<style type="text/css">

#owl-demo .item{
  margin: 3px;
}
#owl-demo .item img{
  display: block;
  width: 100%;
  height: auto;
}


</style>

<script type="text/javascript">
$(document).ready(function() {
	 
	  $("#owl-demo").owlCarousel({
	 
	      autoPlay: 3000, //Set AutoPlay to 3 seconds
	 
	      items : 4,
	      itemsDesktop : [1199,3],
	      itemsDesktopSmall : [979,3]
	 
	  });
	 
	});
	</script>

</head>
<body>
	<div id="owl-demo">
          
  <div class="item"><img src="http://www.oldiesrising.com/images_dossiersV2/Crisis%20Core%20-%20Final%20Fantasy%20VII/Crisis%20Core%20-%20Final%20Fantasy%20VII1m.jpg" alt="Owl Image"></div>
  <div class="item"><img src="http://static.wixstatic.com/media/d1c8d7_4e456ce264f24006be87c0d3cab7d601.jpg/v1/fill/w_214,h_265,al_c,q_75,usm_0.50_1.20_0.00/d1c8d7_4e456ce264f24006be87c0d3cab7d601.jpg" alt="Owl Image"></div>
  <div class="item"><img src="http://static.wixstatic.com/media/d1c8d7_c4266bf3527941c6afc910ffa1007eb4.jpg/v1/fill/w_214,h_265,al_c,q_75,usm_0.50_1.20_0.00/d1c8d7_c4266bf3527941c6afc910ffa1007eb4.jpg" alt="Owl Image"></div>
  <div class="item"><img src="https://sketchbookdandy.files.wordpress.com/2015/04/pop-prince_elika1.jpg?w=214&h=265&crop=1" alt="Owl Image"></div>
  <div class="item"><img src="https://edwalkerauthor.files.wordpress.com/2014/05/cfe02-hiller.jpg" alt="Owl Image"></div>
 
</div>





</body>
</html>