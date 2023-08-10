<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!-- 상품 상세 정보-->
<link rel="stylesheet" href="<c:url value="/resources/css/ProductInfo.css"/>">   
<jsp:include page="../include/header.jsp"/>


<form action="" method="post" id="prodForm">
   <section>
   	<input type="hidden" value="${dto.prod_no }" id="prod_no" name="prod_no">
   	<input type="hidden" value="${dto.point }" name="point">
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
      			<input type="hidden" id="opCode" value="">
      		</c:if>
      		<c:if test="${dto.ctgry_no == 13 ||dto.ctgry_no == 14 || dto.ctgry_no == 15 || dto.ctgry_no == 15 }">
      			<p style="color:gray">OPTION</p>
      			<select id="opCode" name="opCode" class="w-100 border border-secondary rounded-1">
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
      			<select id="opCode" name="op_code" class="w-100 border border-secondary rounded-1">
      				<option>화이트</option>
      				<option>블랙</option>
      			</select>
      		</c:if>
      		
      		<p class="mt-3" style="color:gray">수량</p>
<!--       		<select class="w-100 border border-secondary rounded-1"  id="pqty" name="pqty">
      			<option selected>1</option>
      			<option>2</option>
      			<option>3</option>
      			<option>4</option>
      			<option>5</option>
      			<option>10</option>
      			<option>==직접 입력==</option>
      		</select> -->
      		<input type="text" class="w-100 border border-secondary rounded-1" size="3" id="pqty" name="qty" placeholder="수량을 입력해주세요"/> 
      
            

            <div class="mt-5">
      			<a id="buy"class="btn btn-dark rounded-0 btn-outline-secondary w-25">BUY</a>
      			<button id="cartBtn" onclick="InputCart()"  class="btn rounded-0 btn-outline-secondary w-25">CART</button>
      			<a id="wish" href="<c:url value="/cart/wish?no=${dto.prod_no}" />"class="btn rounded-0 btn-outline-secondary w-25" >WISH</a>
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
</form>






<jsp:include page="../include/footer.jsp"/>
<script>


function InputCart(){
	console.log("하이!");
	$("#prodForm").attr("action", "/cart/inputCart");
	$("#prodForm").attr("method", "post");
	$("#cartBtn").attr("type", "submit");
	
}



</script>	
