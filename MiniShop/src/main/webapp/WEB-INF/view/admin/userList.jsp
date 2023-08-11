<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 회원 리스트 페이지 -->

<jsp:include page="../include/a_header.jsp"/>
	
	
		<div class="container w-75 mt-5">
			<h3><b>회원 리스트</b></h3>
			<table class="table mt-3">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>					
						<th>회원ID</th>
						<th>password</th>
						<th>회원명</th>
						<th>자택번호</th>
						<th>휴대번호</th>
						<th>이메일</th>
						<th>생년월일</th>
						<th>우편번호</th>
						<th>지번주소</th>
						<th>도로명주소</th>
						<th>상세주소</th>
						<th>활성화여부</th>
						<th>가입일자</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach items="${list}" var="dto">				
					<tr>
						<th>${dto.user_no}</th>					
						<th>${dto.user_id}</th>
						<th>****</th>
						<th>${dto.user_nm}</th>
						<th>${dto.user_home}</th>
						<th>${dto.user_phone}</th>
						<th>${dto.user_email}</th>
						<th>${dto.birth_ymd}</th>
						<th>${dto.zipcode}</th>
						<th>${dto.addr}</th>
						<th>${dto.addr_road}</th>
						<th>${dto.addr_detail}</th>
						<th>${dto.use_yn}</th>
						<th>${dto.user_dt}</th>
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