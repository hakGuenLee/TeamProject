<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

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

				<c:if test="${cdto==null || cdto.size()== 0}">
					<tr>
						<td colspan="6">장바구니가 비어있습니다.</td>
					</tr>
				</c:if>
				<c:if test="${cdto!=null || cdto.size()!= 0}">

					<c:set var="totPrice" value="0" />
					<c:set var="cartTotPrice" value="0" />

					<c:forEach var="dto" items="">
						<tr>

							<td><a href="prodView.do?pNum=">
							<img src="<c:url value=""/>" style="width: 60px" />
							</a></td>

							<td></td>
							<td>
							<form action="cartModify.do" method="post">
							<input type="hidden" name="cno" value="">
							<input type="text" size="3" name="pqty" value=""/>개
							<input type="submit" calss="btn btn-sm btn-secondary mt-3" value="수정"/>
							</form>
							</td>
							<td> 가격 : <fmt:formatNumber value=""/> 원 </br>
							</td>
							<c:set var="totPrice" value=""/>
							<td><fmt:formatNumber value=""/> 원</br>
							<c:set var="cartTotPrice" value=""/>

							<td><a
								href="<c:url value="/cart/cartDelete.do?cno="/>" 
								class="btn btn-sm btn-danger">삭제</a></td>
						</tr>
							

					</c:forEach>
				</c:if>
			</tbody>
		</table>
		
		<div class="text-end">
			장바구니 총액 : <fmt:formatNumber value=""/> 원</br>
		
		</div>
		<div class="text-center">
				<a href="checkout.do" class="btn btn-primary me-2">구매하기</a>
				<a href="${pageContext.request.contextPath}" class="btn btn-outline-primary me-2">계속 쇼핑하기</a>
			
		</div>
		
		
		
	</div>
	
					
	<jsp:include page="../include/footer.jsp"/>
	
