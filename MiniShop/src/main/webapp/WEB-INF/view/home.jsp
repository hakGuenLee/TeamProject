<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <jsp:include page="include/header.jsp"/> 



	<div id="popupImg" class="popupImg">
		<img >
	
		
	</div>
	
		<button id="btn-chk" type="button"
					class="btn-close border bg-danger"
							style="display: block; position: relative; left: -24px; top: -30px;"
							onclick="delInput(this)">
		</button>

	<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel">
	
	  <!-- Indicators/dots -->
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
	    <button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
	  </div>
	
	  <!-- The slideshow/carousel -->
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="resources/imgs/slick1.jpg" alt=".." class="d-block w-100">
	    </div>
	    <div class="carousel-item">
	      <img src="resources/imgs/slick2.jpg" alt=".." class="d-block w-100">
	    </div>
	    <div class="carousel-item">
	      <img src="resources/imgs/slick3.jpg" alt=".." class="d-block w-100">
	    </div>
	    <div class="carousel-item">
	      <img src="resources/imgs/slick4.jpg" alt=".." class="d-block w-100">
	    </div>    
	  </div>
	
	  <!-- Left and right controls/icons -->
	  <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon"></span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
	    <span class="carousel-control-next-icon"></span>
	  </button>
	</div>
  



<jsp:include page="include/footer.jsp"/>

<script>
$(document).ready(function(){

	var postno = 1;
	let str = "";
	let popArea = $("#popupImg");

	$.ajax({
		
		url: "/popWindow",
		type: "post",
		data: {"postno" : postno},
		success: function(data){
			console.log(data)
			
			str += '<img src="resources/upload/'+data+'"/>'
			
			popArea.html(str);	
			
		},
		error: function(){alert("error!")}
	
	
	})
	
		function delInput() {
		var imgTag = document.getElementById("img-tag");
		var btnTag = document.getElementById("btn-chk");


		imgTag.style.display = "none";
		btnTag.style.display = "none";
	}
	
	
	
})





</script>


