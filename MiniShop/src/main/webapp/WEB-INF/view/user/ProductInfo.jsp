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
            <c:if test="${dto.sub_img1 != null}">
            <img id="subimg2" src="/resources/upload/${dto.sub_img1}" style="width:70px;height:70px">
            </c:if>
             <c:if test="${dto.sub_img2 != null}">
            <img id="subimg2" src="/resources/upload/${dto.sub_img2}" style="width:70px;height:70px">
            </c:if>
            </div>
         </div>
         <div id="prodInfoArea">
            <p id="prodName"><b>${dto.prod_nm }</b></p>
            <p style="font-size:25px"><b><fmt:formatNumber value="${dto.price }"/></b></p>
            <hr>
      
      		<c:if test="${dto.ctgry_no == 1 || dto.ctgry_no == 2 || dto.ctgry_no == 3 || dto.ctgry_no == 4 || dto.ctgry_no == 5
      		 || dto.ctgry_no == 6 || dto.ctgry_no == 7 || dto.ctgry_no == 8 || dto.ctgry_no == 9 || dto.ctgry_no == 10 || dto.ctgry_no == 11 || dto.ctgry_no == 12}">
      			<p style="color:gray">해당 상품은 추가 옵션이 없습니다.</p>
      		</c:if>
      		<c:if test="${dto.ctgry_no == 13 ||dto.ctgry_no == 14 || dto.ctgry_no == 15 || dto.ctgry_no == 15 }">
      			<select class="w-100 border border-secondary rounded-1">
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
      			<c:if test="${dto.ctgry_no == 17 || dto.ctgry_no == 18 || dto.ctgry_no == 19}">
      			<select class="w-100 border border-secondary rounded-1">
      				<option>화이트</option>
      				<option>블랙</option>
      			</select>
      		</c:if>
      
            

            <div class="mt-5">
      			<a id="buy" class="btn btn-dark rounded-0 btn-outline-secondary w-25">BUY</a>
      			<a id="cart" class="btn rounded-0 btn-outline-secondary w-25">CART</a>
      			<a class="btn rounded-0 btn-outline-secondary w-25">WISH</a>
      		</div>
         </div>
      </div>
    
    <hr>
      
      <div id="detailImg">
      	<c:if test="${dto.detail_img == null }">
      		<p style="color:gray">해당 상품은 상세 이미지가 없습니다.</p>
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
