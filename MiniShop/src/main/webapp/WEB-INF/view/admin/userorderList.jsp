<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 회원 주문/배송/교환/환불 조회 -->

<jsp:include page="../include/a_header.jsp"/>
		<div class="container w-75 mt-5">
			<h3><b>회원 주문/배송/교환/환불 조회</b></h3>
			  <div class="input-group mb-3">
				 <a><span class="input-group-text"><i class="xi-search"></i></span></a>
				 <input type="password"  name="pw" class="form-control" placeholder="회원 ID or휴대폰 번호 검색">
			  </div>
	
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
						<tr>
							<td></td>
							<td><a></a></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
				</tbody>
			</table>
		</div>
	
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>