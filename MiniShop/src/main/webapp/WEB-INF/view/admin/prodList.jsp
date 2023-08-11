<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
						<td>${pdto.prod_no}</td>					
						<td>${pdto.ctgry_no}</td>
						<td>${pdto.prod_nm}</td>
						<td> <img src="<c:url value="/resources/upload/${pdto.main_img}"/>" style="width:60px"/></td>
						<td>${pdto.price}</td>
						<td>${pdto.point}</td>
						<td>${pdto.qty}</td>
						<td>${pdto.dc_price}</td>
						<td>${pdto.use_yn}</td>
						<td>${pdto.proc_id}</td>
						<td>${pdto.proc_dt}</td>
						<td>${pdto.mod_dt}</td>
						<td><a href="<c:url value="/product/prodUpdate?prod_no=${pdto.prod_no}"/>" class="btn btn-info">수정</a></td>
						<td><a href="<c:url value="/product/prodDelete?prod_no=${pdto.prod_no}"/>" class="btn btn-dark">삭제</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	
		<ul class="pagination justify-content-center my-5">
        <li class="page-item ${pageDTO.prevPage <= 0 ? 'disabled' : ''}">
            <a class="page-link" href="<c:url value="/product/prodList?viewPage=${pageDTO.prevPage}&cntPerPage=${pageDTO.cntPerPage}"/>">이전</a>
        </li>

        <c:forEach var="i" begin="${pageDTO.blockStart}" end="${pageDTO.blockEnd}">
            <li class="page-item ${pageDTO.viewPage == i ? 'active' : ''}">
                <a class="page-link"
                   href="<c:url value="/product/prodList?viewPage=${i}&cntPerPage=${pageDTO.cntPerPage}"/>">${i}</a>
            </li>
        </c:forEach>

        <li class="page-item ${pageDTO.blockEnd >= pageDTO.totalPage ? 'disabled' : ''}">
            <a class="page-link" href="<c:url value="/product/prodList?viewPage=${pageDTO.nextPage}&cntPerPage=${pageDTO.cntPerPage}"/>">다음</a>
        </li>
    </ul>
	
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>