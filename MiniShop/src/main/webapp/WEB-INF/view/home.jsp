<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

 <jsp:include page="include/header.jsp"/> 


<div class="container w-75">






	<!-- Carousel -->
<div id="demo" class="carousel slide" data-bs-ride="carousel">

  <!-- Indicators/dots -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
  </div>
  
  <!-- The slideshow/carousel -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="resources/imgs/1.jpg" alt="Los Angeles" class="d-block" style="width:100%">
    </div>
    <div class="carousel-item">
      <img src="resources/imgs/2.jpg" alt="Chicago" class="d-block" style="width:100%">
    </div>
    <div class="carousel-item">
      <img src="resources/imgs/3.jpg" alt="New York" class="d-block" style="width:100%">
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

	
<div id="popArea">
	<img>
</div>
	  

</div>
<jsp:include page="include/footer.jsp"/>

<script>
$(document).ready(function(){
	
	let popNum = '001';
	
	let popArea = $("#popArea");
	
	let str = "";
	
	PopImageGetter(popNum, function(data){
		console.log(data)
		
		let list = data;
		
		for(let i=0; i<list.length; i++){	
			str += '<div class="d-flex">'
			str += '<div id="popBox" style="margin-left:15px">'
			str += '<div>'
			str += '<img src="/resources/upload/'+list[i].pst_img+'" style="weight:500px; height:500px"/>'
			str += '<div style="background-color:black">'
			str += '<button id="popCloseBtn" style="margin-left:81%; border:none; color:white; background-color:transparent;" onclick="closePop()">창닫기</button>'
			str += '</div>'
			str += '</div>'
			str += '</div>'
		}
		popArea.html(str);
		
	})

	
})

</script>

<script>

function closePop(){
	console.log("hi!!!")
	$("#popBox").css("display", "none");

	
}

</script>




