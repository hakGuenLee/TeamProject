<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 냉동과일 상품 -->

<jsp:include page="../include/header.jsp"/>

	
	<section  style="height:auto; margin-top:180px">
		 <h3 style="text-align : center; font-size:30px">한우</h3>
		 	<div  class="container d-flex" style="margin-top:50px"  >
					<c:forEach var="dto" items="${list}">  	
	
							<%@include file="../include/prodCard.jsp"%>	
					</c:forEach>
				</div>
	</section>
					
<jsp:include page="../include/footer.jsp"/>
	
