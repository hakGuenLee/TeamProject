<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

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
				<th>상품명</th>
				<th>옵션</th>
				<th>상품금액</th>
				<th>적립금</th>
				<th>삭제</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>chkbox 넣기</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><a href="<c:url value=""/>" class="btn btn-sm btn-danger">삭제</a></td>
			</tr>
		</tbody>
	</table>
				<td><a href="<c:url value=""/>" class="btn btn-sm btn-danger">선택 삭제</a></td>
</div>
	
					
	<jsp:include page="../include/footer.jsp"/>
	
