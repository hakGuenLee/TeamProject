<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

 <jsp:include page="include/header.jsp"/> 


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
      <img src="resources/imgs/home1.jpg" alt="Los Angeles" class="d-block" style="width:100%">
    </div>
    <div class="carousel-item">
      <img src="resources/imgs/home2.png" alt="Chicago" class="d-block" style="width:100%">
    </div>
    <div class="carousel-item">
      <img src="resources/imgs/home3.png" alt="New York" class="d-block" style="width:100%">
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

  
 	 <!-- 제품 일부 카테고리별 출력 -->
  	<section id="prodBoxSection">
  	<div id="prodBox" class="d-flex">
  		<div>
  			<button id="prodChoice" class="btn btn-outline-info">과일</button>
  			<button id="prodChoice" onclick="getVegeBox()" class="btn btn-outline-info">채소</button>
  			<button id="prodChoice" class="btn btn-outline-info">축산</button>
  			<button id="prodChoice" class="btn btn-outline-info">의류</button>
  			<button id="prodChoice" class="btn btn-outline-info">가전</button>
	
  		</div>
  		<div id="prodCard">
  		 <!-- 카드 시작 -->
				<div id="prodImg" class="card rounded-0 border-0" style="width:400px; margin:20px">
					
				   <a  href="#"><img class="card-img-top rounded-0" src="" style="width:100%; height:300px"></a>
				    <div class="card-body" id="cardBox">
				      <p id="prodName" class="card-title"><b></b></p>
				      <p class="card-text" style="color:dodgerblue"><b><fmt:formatNumber value=""/>원</b></p>
					
				      	<a id="menuBtn" href="#" class="btn btn-dark rounded-0">장바구니 담기</a>
				      	<a href="<c:url value='/cart/wish?no='/>" class="btn btn-dark rounded-0">찜하기</a>
				      	<a href="#" class="btn btn-dark rounded-0">바로 구매하기</a>
			    	</div>
			  	</div>
			  	<!-- 카드 끝 -->
	
  		</div>	
  	</div>	 	
  	</section>

<jsp:include page="include/footer.jsp"/>

<script>
$(document).ready(function(){

	var firstProd = 1

	let CardArea = $("#prodImg")
	
	let str = "";
	
	homeProdBox(firstProd, function(data){
		console.log(data);
	 	let list = data;
		
		for(let i=0; i<list.length; i++){
			str +='<div class="d-flex">';
			str +='<div>';
			str += ' <a  href="#"><img class="card-img-top rounded-0" src="'+'/resources/upload/'+list[i].main_img+'"style="width:300px; height:300px"></a>';
			str +='</div>';
			str +='<div>';
			str += ' <div class="card-body" id="cardBox">';
			str += ' <p id="prodName" class="card-title"><b>'+list[i].prod_nm+'</b></p>';
            str += '<p id="prodName" class="card-title"><b></b></p>';
			str +='<p class="card-text" style="color:dodgerblue"><b>'+list[i].price+'원</b></p>';
			str +='</div>';
			str +='</div>';
/* 			str +='<a id="menuBtn" href="#" class="btn btn-dark rounded-0">장바구니 담기</a>';
			str +='<a href="<c:url value='/cart/wish?no='/>" class="btn btn-dark rounded-0">찜하기</a>'; */
		}
		
		CardArea.html(str);	
		
	})
})	
</script>



