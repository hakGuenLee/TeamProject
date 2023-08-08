<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 마이페이지 위시리스트-->

<jsp:include page="../include/header.jsp" />


	<div class="container w-75 mt-5">
		<h3>장바구니</h3>
		<table class="table">
			<thead>
				<tr>
					<th><input type="checkbox" id="checkAll" onclick="checkAll()" />선택</th>
					<th>이미지</th>
					<th>상품명</th>
					<th>수량</th>
					<th>가격</th>
					<th>적립금</th>
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
							<td><input type="checkbox" id="cart_no" name="cart_no"
								value="${dto.cart_no}" /></td>
							<td><a href=""> <img
									src="<c:url value="/resources/upload/${dto.main_img}"/>"
									style="width: 60px; height: 60px" />
							</a></td>

							<td>${dto.prod_nm}</td>
							<td>
								<form action="/cart/updateQty?no=${dto.cart_no}" method="post">
									<input type="text" size="3" name="pqty" value="${dto.qty }" />
									<input type="submit" class="btn btn-sm btn-outline-secondary"
										value="수정" />
								</form>
							</td>
							<td><fmt:formatNumber value="${dto.price}" /> 원 </br>
							</td>
							<td><fmt:formatNumber value="${dto.point}" /> 원 </br>
							</td>
							<c:set var="totPrice" value="${dto.price * dto.qty}" />
							<td><fmt:formatNumber value="${totPrice}" /> 원</br> <c:set
									var="cartTotPrice" value="${cartTotPrice + totPrice }" />
							<td><a href="<c:url value="cartDelete?no=${dto.cart_no}"/>"
								class="btn btn-sm btn-danger">삭제</a></td>
						</tr>


					</c:forEach>
				</c:if>
			</tbody>
		</table>

		<div class="text-end">
			장바구니 총액 :
			<fmt:formatNumber value="${cartTotPrice }" />
			원</br>

		</div>
		<div class="text-center">
	<form action="<c:url value="/order/inputOrder"/>" name="cartForm"
	method="post">
			<input type="hidden" name="choiceBuy" /> <a
				href="javascript:choiceBuy()" class="btn btn-outline-secondary">구매하기</a>
			<a href="${pageContext.request.contextPath}"
				class="btn btn-outline-primary me-2">계속 쇼핑하기</a>
				<a href="<c:url value="/order/buyPage"/>"
				class="btn btn-outline-primary me-2">(임시) 구매페이지 이동)</a>
			</form>

		</div>

	</div>


<script>
	function checkAll() {
		let isChecked = document.getElementById("checkAll").checked;

		let chks = document.getElementsByName('cart_no');
		//let chks = $('prod_no');

		console.log(chks);

		for (let i = 0; i < chks.length; i++) {
			chks[i].checked = isChecked;
		}
	}

	function choiceBuy() {
		let chks = document.getElementsByName('cart_no');

		let prodNumStr = "";
		let separator = false;
		for (let i = 0; i < chks.length; i++) {
			if (chks[i].checked) {
				if (separator) {
					prodNumStr += '/';
				}
				prodNumStr += chks[i].value;

				separator = true;
			}
		}

		if (!prodNumStr) { //js null : 거짓
			alert("구매 할 상품을 체크하세요");
			return;
		}
		//구매할 상품번호(예: 7/9/..) 문자열로 묶어서 input에 저장
		document.cartForm.choiceBuy.value = prodNumStr;

		console.log(prodNumStr);

		let res = confirm("구매 하시겠습니까?");
		if (res) {
			document.cartForm.submit();
		}
	}
</script>


<jsp:include page="../include/footer.jsp" />

