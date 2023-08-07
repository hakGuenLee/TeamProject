<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 나의 배송지 관리 -->

<jsp:include page="../include/header.jsp" />

		<div class="container w-75 mt-5">
			<h3><b>배송지 리스트</b></h3>
			<table class="table mt-3">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>					
						<th>기본배송지 여부</th>
						<th>기본주소</th>
						<th>상세주소</th>
						<th>우편번호</th>
						<th>받는사람</th>
						<th>연락처</th>
						<th>별칭</th>
						<th>등록일자</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach items="${list}" var="dto">				
					<tr>
						<th>${dto.addr_no}</th>					
						<th>${dto.addr_gb}</th>
						<th>${dto.addr}</th>
						<th>${dto.addr_detail}</th>
						<th>${dto.zipcode}</th>
						<th>${dto.addr_nm}</th>
						<th>${dto.addr_tel}</th>
						<th>${dto.addr_nik}</th>
						<th>${dto.addr_dt}</th>
						<td><a href="<c:url value="/myPage/addressUpdate?no=${dto.addr_no}"/>" class="btn btn-info">수정</a></td>
						<td><a href="<c:url value="/myPage/addressDelete?no=${dto.addr_no}"/>" class="btn btn-dark">삭제</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<a href="/myPage/myAddressInput" class="btn btn-secondary" style="margin-left:88%">배송지 추가하기</a>
		</div>












<jsp:include page="../include/footer.jsp" />
