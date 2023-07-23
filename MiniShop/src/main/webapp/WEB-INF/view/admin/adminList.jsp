<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 리스트 페이지 -->

	<jsp:include page="../include/a_header.jsp"/>
		
		<div class="container w-75 mt-5">
			<h3><b>관리자 리스트</b></h3>
			<table class="table mt-3">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>					
						<th>관리자 아이디</th>
						<th>담당자(사원번호)</th>
						<th>담당자명</th>
						<th>등록일</th>
						<th>종료일</th>
						<th>정보수정</th>
						<th>삭제</th>
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
							<td><a href="" class="btn btn-sm btn-info">수정</a></td>
							<td><a href="" class="btn btn-sm btn-dark">삭제</a></td>
						</tr>
				</tbody>
			</table>
		</div>
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>