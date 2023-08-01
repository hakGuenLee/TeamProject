<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 마이페이지 첫 화면 -->

<jsp:include page="../include/header.jsp" />

<div class="container w-50 border shodow p-5 mt-5">
	
			<p>id(회원명 : 이학근) 회원 님의 등급은 짱 등급입니다.</p>
			
			<br><hr>
			
			<p>적립금  : ( user.point )</p>

			<br><hr>


</div>


<div class="container w-50 border shadow-sm p-5 mt-5">
	<h4>적립금 조회</h4>


	<div class="d-flex">
		<div class="d-flex">
			<div class="form-floating mb-3 mt-3">
				<p class="me-3">조회기간</p>
			</div>
			<div class="form-floating mb-3 mt-3">
				<button class="form-control" style="width: 60px;">오늘</button>
			</div>

			<div class="form-floating mt-3 mb-3">
				<button class="form-control" style="width: 60px;">1주</button>

			</div>
			<div class="form-floating mt-3 mb-3">
				<button class="form-control" style="width: 60px;">1달</button>

			</div>
			<div class="form-floating mt-3 mb-3 me-5">
				<button class="form-control" style="width: 60px;">3달</button>
			</div>
		</div>

		<div class="d-flex">
			<div class="form-floating mt-3 mb-3 me-3">
				<input class="form-control mb-2" type="date" id="strt_ymd"
					name="strt_ymd" min="now()" max="9999-12-31"
					data-placeholder="검색기간(시작일)" required />
				<!-- 수정할것  -->
			</div>
			~
			<div class="form-floating mt-3 mb-3">
				<input class="form-control mb-2" type="date" id="end_ymd"
					name="end_ymd" min="now()" max="9999-12-31"
					data-placeholder="검색기간(종료일)" required />
				<!-- 수정할것  -->
			</div>
			<div class="form-floating mt-3 mb-3">
				<button class="btn btn-success btn-sm btn-outline">검색</button>
			</div>
		</div>
	</div>
</div>


<div class="container w-50 mt-5">
	<h3>
		<b>적립금 조회내역</b> <span>N 건</span>
	</h3>

	<table class="table mt-5">
		<thead class="table-secondary">
			<tr>
				<th>주문번호</th>
				<th>적립일</th>
				<th>상품명</th>
				<th>옵션</th>
				<th>상품금액/수량</th>
				<th>적립금</th>
				<th>총적립금</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><a href="<c:url value=""/>" class="btn btn-sm btn-primary">상세보기</a></td>
			</tr>
		</tbody>
	</table>
</div>







<jsp:include page="../include/footer.jsp" />
