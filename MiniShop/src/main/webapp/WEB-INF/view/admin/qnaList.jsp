<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 상품 QnA 리스트 페이지 -->

<jsp:include page="../include/a_header.jsp"/>

		<div class="container w-75 mt-5">
			<h3><b>상품Q&A처리</b></h3>
			<div class="dropdown mt-3">
			  <button class="btn btn-secondary dropdown-toggle" type="button" id="category" data-bs-toggle="dropdown" aria-expanded="false">
			    상품 카테고리
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="category">
			    <li><a class="dropdown-item" href="#">Action</a></li>
			    <li><a class="dropdown-item" href="#">Another action</a></li>
			    <li><a class="dropdown-item" href="#">Something else here</a></li>
			  </ul>
			</div>
			<table class="table mt-5">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>					
						<th>제목</th>
						<th>카테고리/상품명</th>
						<th>글쓴이ID(회원)</th>
						<th>담당자명</th>
						<th>문의일자(등록일)</th>
						<th>처리일</th>
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
							<td></td>
						</tr>
				</tbody>
			</table>
		</div>
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>