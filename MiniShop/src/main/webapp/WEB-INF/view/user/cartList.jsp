<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      

<!-- 마이페이지 위시리스트-->

<jsp:include page="../include/header.jsp"/>


<div class="container w-75 mt-5">
		<h3>장바구니</h3>
		<table class="table">
			<thead>
				<tr>
					<th>이미지</th>
					<th>상품명</th>
					<th>수량</th>
					<th>가격</th>
					<th>합계</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>

				<c:if test="${list==null || list.size()== 0}">
					<tr>
						<td colspan="6">장바구니가 비어있습니다.</td>
					</tr>
				</c:if>
				<c:if test="${list!=null || list.size()!= 0}">

					<c:set var="totPrice" value="0" />
					<c:set var="cartTotPrice" value="0" />

					<c:forEach var="dto" items="${list}">
						<tr>

							<td><a href="">
							<img src="<c:url value="/resources/upload/${dto.main_img}"/>" style="width: 60px; height:60px" />
							</a></td>

							<td>${dto.prod_nm}</td>
							<td>
							<form action="/cart/updateQty?no=${dto.cart_no}" method="post">
							<input type="text" size="3" name="pqty" value="${dto.qty }"/>
							<input type="submit" class="btn btn-sm btn-outline-secondary" value="수정"/>
							</form>
							</td>
							<td> 가격 : <fmt:formatNumber value="${dto.price}"/> 원 </br>
							</td>
							<c:set var="totPrice" value="${dto.price * dto.qty}"/>
							<td><fmt:formatNumber value="${totPrice}"/> 원</br>
							<c:set var="cartTotPrice" value="${cartTotPrice + totPrice }"/>

							<td><a
								href="<c:url value="cartDelete?no=${dto.cart_no}"/>" 
								class="btn btn-sm btn-danger">삭제</a></td>
						</tr>
							

					</c:forEach>
				</c:if>
			</tbody>
		</table>
		
		<div class="text-end">
			장바구니 총액 : <fmt:formatNumber value="${cartTotPrice }"/> 원</br>
		
		</div>
		<div class="text-center">
				<a href="checkout.do" class="btn btn-primary me-2">구매하기</a>
				<a href="${pageContext.request.contextPath}" class="btn btn-outline-primary me-2">계속 쇼핑하기</a>
			
		</div>
		
		
		
	</div>
	
					
	<jsp:include page="../include/footer.jsp"/>
	
