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
						<th>카테고리ID</th>
						<th>상품명</th>
						<th>이미지</th>
						<th>가격</th>
						<th>적립금</th>
						<th>수량</th>
						<th>할인가</th>
						<th>사용유무</th>
						<th>관리자</th>
						<th>등록일</th>
						<th>수정일</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach items="${pList}" var="pdto">				
					<tr>
						<th>${pdto.prod_no}</th>					
						<th>${pdto.ctgry_no}</th>
						<th>${pdto.prod_nm}</th>
						<th> <img src="<c:url value="/resources/upload/${pdto.main_img}"/>" style="width:60px"/></th>
						<th>${pdto.price}</th>
						<th>${pdto.point}</th>
						<th>${pdto.qty}</th>
						<th>${pdto.dc_price}</th>
						<th>${pdto.use_yn}</th>
						<th>${pdto.proc_id}</th>
						<th>${pdto.proc_dt}</th>
						<th>${pdto.mod_dt}</th>
						<td><a href="" class="btn btn-info">수정</a></td>
						<td><a href="" class="btn btn-dark">삭제</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>