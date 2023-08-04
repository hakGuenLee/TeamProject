<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!-- 과일 상품 -->
<link rel="stylesheet" href="<c:url value="/resources/css/ProductInfo.css"/>">   
<jsp:include page="../include/header.jsp"/>

	
	<section>
		<div class="d-flex">
			<div>
				<img id="mainImg" src="resources/upload/${dto.main_img}">
				<div class="d-flex mt-3">
				<img id="subimg" src="resources/upload/${dto.main_img}" style="width:70px;height:70px">
				<img id="subimg2" src="resources/upload/${dto.sub_img1}" style="width:70px;height:70px">
				</div>
			</div>
			<div>
				<p><b>${dto.prod_nm }</b></p>
				<p><b><fmt:formatNumber value="${dto.price }"/></b></p>
				<p><b>${dto.prod_nm }</b></p>
				<p><b>${dto.prod_nm }</b></p>
				<p><b>${dto.prod_nm }</b></p>
				<p><b>${dto.prod_nm }</b></p>
			</div>
		</div>
		
		<div>
			<img src="resources/upload/${dto.detail_img}">
		
		</div>
	</section>				
<jsp:include page="../include/footer.jsp"/>
<script>


/* $("#subimg2").click(function(){
	$("#mainImg").atter('src','resources/upload/${dto.sub_img1}');
	
}) */


</script>	
