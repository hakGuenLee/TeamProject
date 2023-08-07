<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!-- 상품 상세 정보-->
<link rel="stylesheet" href="<c:url value="/resources/css/ProductInfo.css"/>">   
<jsp:include page="../include/header.jsp"/>

   <section>
      <div class="d-flex">
         <div id="imgArea">
            <img id="mainImg" src="/resources/upload/${dto.main_img}">
            <div class="d-flex mt-3">
            <img id="subimg" src="/resources/upload/${dto.main_img}" style="width:70px;height:70px">
            <img id="subimg2" src="/resources/upload/${dto.sub_img1}" style="width:70px;height:70px">
            </div>
         </div>
         <div id="prodInfoArea">
            <p id="prodName"><b>${dto.prod_nm }</b></p>
            <p style="font-size:25px"><b><fmt:formatNumber value="${dto.price }"/></b></p>
            <hr>
      
      		<c:if test="${dto.ctgry_no == 1 || dto.ctgry_no == 2 || dto.ctgry_no == 3}">
      			<p style="color:gray">해당 상품은 추가 옵션이 없습니다.</p>
      		</c:if>
      		<c:if test="${dto.ctgry_no == 4}">
      			<select>
      				<option>화이트/S</option>
      				<option>화이트/M</option>
      				<option>화이트/L</option>
      				<option>화이트/XL</option>
      				<option>블랙/S</option>
      				<option>블랙/M</option>
      				<option>블랙/L</option>
      				<option>블랙/XL</option>
      			</select>
      		</c:if>
      			<c:if test="${dto.ctgry_no == 5}">
      			<select>
      				<option>화이트</option>
      				<option>블랙</option>
      			</select>
      		</c:if>
      
            

            <div>
      			<a id="buy" class="btn btn-dark rounded-0 btn-outline-secondary w-50">BUY NOW</a>
      			<a id="cart" class="btn rounded-0 btn-outline-secondary w-25">CART</a>
      			<a class="btn rounded-0 btn-outline-secondary w-25">WISH</a>
      		</div>
         </div>
      </div>
    
      
      <div id="detailImg">
      	<c:if test="${dto.detail_img == null }">
      		<p>해당 상품은 상세 이미지가 없습니다!</p>
      	</c:if>
      	<c:if test="${dto.detail_img != null }">
         <img src="/resources/upload/${dto.detail_img}">
      	</c:if>
      </div>
   </section>  
   
   
   
   
   		
<jsp:include page="../include/footer.jsp"/>
<script>


/* $("#subimg2").click(function(){
	$("#mainImg").atter('src','resources/upload/${dto.sub_img1}');
	
}) */


</script>	
