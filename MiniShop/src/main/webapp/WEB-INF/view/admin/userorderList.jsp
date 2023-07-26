<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 회원 주문/배송/교환/환불 조회 -->

<jsp:include page="../include/a_header.jsp"/>
		<div class="container w-75 mt-5">
			<h3><b>회원 주문/배송/교환/환불 조회</b></h3>
			
			<form action="orderSearch" method="post">
			  <div class="input-group mb-3">
				 <input type="text" value="${id}"  name="search" class="form-control" placeholder="회원 ID or휴대폰 번호 검색">
			  	<button type="submit" class="btn btn-info">검색</button>	
			  </div>
			</form>
			
			<table class="table mt-3">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>					
						<th>주문번호</th>
						<th>주문자ID(성명)</th>
						<th>주문자 휴대폰번호</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>		
				<c:set var="i" value="1"/>
					<c:forEach var="list" items="${orderList}">				
						<tr>
							<td>${i}</td>
							<td><a href="#">${list.order_id}</a></td>
							<td>${list.user_id}</td>
							<td>${list.user_phone}</td>
							<td></td>
							<c:set var="i" value="${i+1}"/>
						</tr>
						</c:forEach>	
				</tbody>
			</table>
		</div>
	
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>