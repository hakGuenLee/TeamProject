<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="../include/header.jsp" />


<div class="container mt-5 d-flex flex-direction-column">
	<section class="w-50 ps-5 m-auto">
		<h2 class="mb-5">주문 / 결제 내역</h2>

		<table class="table">
			<thead>
				<tr>
					<th>구매 정보</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>주문번호</td>
					<td>${orderDTO.order_no}</td>
					<td></td>
				</tr>
				<tr>
					<td>구매일시</td>
					<td>${orderDTO.order_dt}</td>
				</tr>
				<tr>
					<td><b>받는사람 정보</b> </td>
				</tr>
				<tr>
					<td>이름</td>
					<td>이학근</td>
				</tr>
				<tr>
					<td>배송지 주소</td>
					<td>12-1<br>집<br>집도로<br/>집상세</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>123</td>
				</tr>

			</tbody>
		</table>
				<div class="text-center">
			<a href="<c:url value="/" />" class="btn btn-outline-primary">홈으로</a>
		</div>
	</section>
</div>


<jsp:include page="../include/footer.jsp" />

