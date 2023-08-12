<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 마이페이지 위시리스트-->

<jsp:include page="../include/a_header.jsp" />


	<div class="container w-75 mt-5">
		<h3>주문 상세보기</h3>  
		<table class="table">
			<thead>
				<tr>
				
					<th>이미지</th>
					<th>상품명</th>
					<th>수량</th>
					<th>가격</th>
					<th>적립금</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
					<c:set var="totPrice" value="0" />
					<c:set var="cartTotPrice" value="0" />

					<c:forEach var="dto" items="${list}">
						<tr>
					<td><a href=""> <img
									src="<c:url value="/resources/upload/${dto.main_img}"/>"
									style="width: 60px; height: 60px" />
							</a></td> 

						<td>${dto.prod_nm}</td> 
							<td>${dto.qty}</td>
			
							<td><fmt:formatNumber value="${dto.price}" /> 원 </br>
							</td>
							<td><fmt:formatNumber value="${dto.point}" /> 원 </br>
							</td>
							<c:set var="totPrice" value="${dto.price * dto.qty}" />
							<td><fmt:formatNumber value="${totPrice}" /> 원</br> <c:set
									var="cartTotPrice" value="${cartTotPrice + totPrice }" />
						</tr>


					</c:forEach>
			</tbody>
		</table>

		<div class="text-end">
			주문 총액 :
			<fmt:formatNumber value="${cartTotPrice }" />
			원</br>

		</div>
			<a href="javaScript:history.back()"
				class="btn btn-outline-primary me-2">이전페이지로 이동</a>
		</div>





<jsp:include page="../include/a_footer.jsp" />

