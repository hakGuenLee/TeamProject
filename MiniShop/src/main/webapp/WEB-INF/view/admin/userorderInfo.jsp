<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 상품 QnA 상세보기 -->

<jsp:include page="../include/a_header.jsp" />

<div class="container w-75 mt-5">
	<form action="<c:url value="/order/orderUpdate"/>" method="post">
		<div class="d-flex justify-content-around">
			<div>
				<h3>
					<b>회원 주문/배송 상세 조회</b>
				</h3>
				<input type="text" name="search" value="${search}"/>
				<input type="text" name="order_no"  value="${order_no}" class="form-control"
					readonly> 

				<table class="table mt-3">
					<thead class="table-secondary">

						<tr>
							<th>No.</th>
							<th>상품명</th>
							<th>금액</th>
							<th>적립금</th>
							<th>상태</th>
							<th>처리일</th>
						</tr>

					</thead>

					<tbody>
						<c:set var="i" value="1" />
						<c:forEach items="${uoList}" var="list">
							<tr>
								<td>${i}</td>
								<td><a>${list.prod_nm}</a></td>
								<td><a>${list.price}</a></td>
								<td>${list.point}</td>
								<td>${list.order_sts}</td>
								<td>${list.order_dt}</td>
							</tr>
							<c:set var="i" value="${i+1}" />
						</c:forEach>
					</tbody>
				</table>

				<table>
					<tr class="mt-3">
						<td>회원명</td>
						<td>${UOdto.user_nm}</td>
					</tr>
					<tr class="mt-3">
						<td>배송지 전화번호</td>
						<td>${UOdto.addr_tel}</td>
					</tr>
					<tr class="mt-3">
						<td>우편번호</td>
						<td>${UOdto.zipcode}</td>
					</tr>
					<tr class="mt-3">
						<td>배송지주소</td>
						<td>${UOdto.addr}</td>
					</tr>
					<tr class="mt-3">
						<td>상세주소</td>
						<td>${UOdto.addr_detail}</td>
					</tr>
					<tr class="mt-3">
						<td>주문일자</td>
						<td>${UOdto.order_dt}</td>
					</tr>

					<tr class="mt-3">
						<td>처리상태</td>
						<td><select class="form-select form-select-sm" id="order_sts"
							name="order_sts">
								<option ${UOdto.order_sts=='결제완료'?'selected':''} value="결제완료">결제완료</option>
								<option ${UOdto.order_sts=='배송준비중'?'selected':''} value="배송준비중">배송준비중</option>
								<option ${UOdto.order_sts=='배송중'?'selected':''} value="배송중">배송중</option>
								<option ${UOdto.order_sts=='배송완료'?'selected':''} value="배송완료">배송완료</option>
						</select></td>
					</tr>

				</table>
				<input type="text" class="form-control" placeholder="담당자 메모(처리내역)">
				<button class="btn btn-primary mt-3">수정</button>
			</div>
		</div>
	</form>
</div>

<jsp:include page="../include/a_footer.jsp" />


</body>
</html>