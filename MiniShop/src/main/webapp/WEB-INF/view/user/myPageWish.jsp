<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!-- 마이페이지 위시리스트-->

<jsp:include page="../include/header.jsp"/>


<div class="container w-50 mt-5">
	<h3>
		<b>위시리스트 내역</b>
	</h3>

	<table class="table mt-5">
		<thead class="table-secondary">
			<tr>
				<th>선택</th>
				<th>상품이미지</th>
				<th>상품명</th>
				<th>상품금액</th>
				<th>적립금</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
		<c:if test="${list == null }">
			<p>위시리스트에 담긴 상품이 없습니다!</p>
		</c:if>
		<c:forEach var="dto" items="${list }">
			<tr>
				<input type="hidden" value="${dto.wish_no }">
				<td><input type="checkBox"></td>
				<td><img src="/resources/upload/${dto.main_img }" style="width:70px; height:70px"></td>
				<td>${dto.prod_nm }</td>
				<td><fmt:formatNumber value="${dto.price}"/>원</td>
				<td><fmt:formatNumber value="${dto.point}"/>원</td>
				<td><a href="<c:url value="deleteWish?no=${dto.wish_no }"/>" class="btn btn-sm btn-danger">삭제</a></td>
				
			</tr>
			</c:forEach>
		</tbody>
	</table>
				<td><a href="<c:url value=""/>" class="btn btn-sm btn-danger">선택 삭제</a></td>
</div>
	
					
	<jsp:include page="../include/footer.jsp"/>
	
