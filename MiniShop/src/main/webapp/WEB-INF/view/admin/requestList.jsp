<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 승인 요청 목록 확인 페이지 -->

<jsp:include page="../include/a_header.jsp"/>

		<div class="container w-75 mt-5">
			<h3><b>관리자 승인</b></h3>
			<div class="d-flex justify-content-between mt-3">
				<div class="d-flex">
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="aprv">
						<label class="form-check-lebel" for="aprv">승인</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="noaprv">
						<label class="form-check-lebel" for="noaprv">미승인</label>
					</div>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" value="" id="all">
						<label class="form-check-lebel" for="noaprv">전체</label>
					</div>				
				</div>
				<div>
				<a href="" class="btn btn-info">승인</a>
				</div>
			</div>
			<table class="table mt-3">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>					
						<th>공지구분(공지/팝업)</th>
						<th>제목</th>
						<th>담당자명(사원번호)</th>
						<th>게시기간</th>
						<th>요청일</th>
						<th>승인일</th>
					</tr>
				</thead>
				<tbody>				
					<tr>
						<td></td>
						<td></td>
						<td><a href=""></a></td>
						<td></td>
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