<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      
    
<!-- <div  class="container d-flex" style="margin-top:50px"  > -->
	
		<%-- 	<c:forEach var="dto" items="${list }">	 --%>
				 <c:set var="cnt" value="${cnt+1 }"/> 
				<!-- 카드 시작 -->
				<div class="card rounded-0 border-0" style="width:400px; margin:20px">
					
				   <a href="<c:url value='/page/view.do?pNum=${dto.pnum}'/>"><img class="card-img-top rounded-0" src="<c:url value='../uploadedFile/${dto.pimage}'/>"style="width:100%"></a>
				    <div class="card-body">
				      <p class="card-title"><b>${dto.pname }</b></p>
				      <p class="card-text" style="color:dodgerblue"><b><fmt:formatNumber value="${dto.price}"/>원</b></p>
			
						<c:if test="${sessionScope.userDTO.id != null }" >
				      	<a href="<c:url value='/user/cartAdd.do?pNum=${dto.pnum}&pQty=1' />"  onclick="cartMsg()" class="btn btn-dark rounded-0">장바구니 담기</a>
						</c:if>
						<c:if test="${sessionScope.userDTO.id == null }" >
				      	<a href="javascript:alert('로그인이 필요합니다')" class="btn btn-dark rounded-0">장바구니 담기</a>
						</c:if>
			    	</div>
			  	</div>
			  	<!-- 카드 끝 -->
			  	<c:if test="${cnt%3 == 0 }">
			  		</div><div class=" container d-flex" style="margin-top:50px">
			  	</c:if>			
			<%--   </c:forEach> --%>
<!-- 	</div> -->
	
	<script>
		function cartMsg(){
			if(confirm("장바구니에 담겼습니다. 확인해보시겠습니까?")==true){
			location.href="<c:url value='/user/cartPage.do'/>";

			}else{
				confirm("장바구니에 담겼습니다. 확인해보시겠습니까?")==false;
				location.href="#";
			}		
		}
		
	
	
	
	</script>	