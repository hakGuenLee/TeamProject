<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
 <link rel="stylesheet" href="<c:url value="/resources/css/prodCard.css"/>">   
 
 <!-- 카드 시작 -->
 			<c:set var="cnt" value="${cnt+1 }"/> 
				<div id="prodImg" class="card rounded-0 border-0" style="width:400px; margin:20px">
					
				   <a  href="#"><img class="card-img-top rounded-0" src="<c:url value='/resources/upload/${dto.main_img}'/>"style="width:100%; height:300px"></a>
				    <div class="card-body" id="cardBox">
				      <p id="prodName" class="card-title"><b>${dto.prod_nm }</b></p>
				      <p class="card-text" style="color:dodgerblue"><b><fmt:formatNumber value="${dto.price}"/>원</b></p>
					
				      	<a id="menuBtn" href="#" class="btn btn-dark rounded-0">장바구니 담기</a>
				      	<a href="<c:url value='/cart/wish?no=${dto.prod_no }'/>" class="btn btn-dark rounded-0">찜하기</a>
				      	<a href="#" class="btn btn-dark rounded-0">바로 구매하기</a>
			    	</div>
			  	</div>
			  	<!-- 카드 끝 -->
			  <c:if test="${cnt%3 == 0 }">
			  		</div><div class=" container d-flex" style="margin-top:50px">
			 </c:if>			
    
    
    