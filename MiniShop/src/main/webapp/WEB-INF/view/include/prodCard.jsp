<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
 
 <!-- 카드 시작 -->
 			<c:set var="cnt" value="${cnt+1 }"/> 
				<div class="card rounded-0 border-0" style="width:400px; margin:20px">
					
				   <a href="#"><img class="card-img-top rounded-0" src="<c:url value='/resources/upload/${dto.main_img}'/>"style="width:100%; height:300px"></a>
				    <div class="card-body">
				      <p class="card-title"><b>${dto.prod_nm }</b></p>
				      <p class="card-text" style="color:dodgerblue"><b><fmt:formatNumber value="${dto.price}"/>원</b></p>
			
				      	<a href="#"   class="btn btn-dark rounded-0">장바구니 담기</a>
			    	</div>
			  	</div>
			  	<!-- 카드 끝 -->
			  <c:if test="${cnt%3 == 0 }">
			  		</div><div class=" container d-flex" style="margin-top:50px">
			 </c:if>			
    
    
    