<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 상품 리스트 페이지 -->

<jsp:include page="../include/a_header.jsp"/>
	
	
		<div class="container w-75 mt-5">
			<h3><b>상품 리스트</b></h3>
			<table class="table mt-3">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>					
						<th>상품코드</th>
						<th>카테고리</th>
						<th>가격</th>
						<th>이미지</th>
						<th>기타</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>				
					<tr>
						<td></td>
						<td><a></a></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><a href="" class="btn btn-info">수정</a></td>
						<td><a href="" class="btn btn-dark">삭제</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>