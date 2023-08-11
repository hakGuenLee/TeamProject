<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 회원 주문/배송/교환/환불 조회 -->

<jsp:include page="../include/a_header.jsp"/>
		<div class="container w-75 mt-5">
			<h3><b>회원 주문/배송 관리</b></h3>
			
			<form action="orderSearch" method="post">
			  <div class="input-group mb-3 w-25">
				 <input type="text"<%--  value="${id}"  --%> name="search" class="form-control" placeholder="회원 ID or휴대폰 번호 검색">
			  	<button type="submit" class="btn btn-info">검색</button>	
			  </div>
			</form>
			
			<table class="table mt-3">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>					
						<th>주문번호</th>
						<th>주문자ID</th>
						<th>주문일자</th>
						<th>상태</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody>		
				<c:set var="i" value="1"/>
					<c:forEach var="list" items="${list}">				
						<tr>
							<td>${i}</td>
							<td><a href="<c:url value="/order/orderInfo?order_no=${list.order_no}"/>">${list.order_no}</a></td>
							<td>${list.user_id} </td>
							<td>${list.order_dt}</td>
							<td>${list.order_sts}</td>
							<c:set var="i" value="${i+1}"/>
							<td><a type="button" class="btn btn-secondary" href="">수정</a></td>
						</tr>
						</c:forEach>	
				</tbody>
			</table>
		</div>
	
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>