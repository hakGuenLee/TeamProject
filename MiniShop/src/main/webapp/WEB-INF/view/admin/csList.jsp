<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 1:1문의 리스트 -->

<jsp:include page="../include/a_header.jsp"/>
		<div class="container w-75 mt-5">
			<h3><b>카테고리 리스트</b></h3>
			<div class="dropdown mt-3">
			  <button class="btn btn-secondary dropdown-toggle" type="button" id="category" data-bs-toggle="dropdown" aria-expanded="false">
			    문의 내용 선택
			  </button>
			  <ul class="dropdown-menu" aria-labelledby="category">
			    <li><a class="dropdown-item" href="#">회원정보관리</a></li>
			    <li><a class="dropdown-item" href="#">주문/결제</a></li>
			    <li><a class="dropdown-item" href="#">배송</a></li>
			    <li><a class="dropdown-item" href="#">반품/환불/교환/AS</a></li>
			    <li><a class="dropdown-item" href="#">영수증/증빙서류</a></li>
			    <li><a class="dropdown-item" href="#">상품/이벤트</a></li>
			    <li><a class="dropdown-item" href="#">기타</a></li>
			  </ul>
			</div>
			<table class="table mt-3">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>					
						<th>제목</th>
						<th>글쓴이ID</th>
						<th>담당자명</th>
						<th>문의 일자(등록일)</th>
						<th>처리일</th>
					</tr>
				</thead>
				<tbody>				
						<tr>
							<td></td>
							<td><a></a></td>
							<td><a></a></td>
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