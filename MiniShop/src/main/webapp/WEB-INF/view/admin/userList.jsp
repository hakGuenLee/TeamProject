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
						<th style="width:10%">회원명</th>
						<th style="width:10%">자택번호</th>
						<th style="width:10%">휴대번호</th>
						<th style="width:10%">이메일</th>
						<th style="width:10%">생년월일</th>
						<th style="width:10%">우편번호</th>
						<th style="width:20%">지번주소</th>
						<th style="width:20%">도로명주소</th>
						<th>상세주소</th>
						<th style="width:12%">활성화여부</th>
						<th>가입일자</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach items="${list}" var="dto">				
					<tr>
						<td>${dto.user_no}</td>					
						<td>${dto.user_id}</td>
						<td>****</td>
						<td>${dto.user_nm}</td>
						<td>${dto.user_home}</td>
						<td>${dto.user_phone}</td>
						<td>${dto.user_email}</td>
						<td>${dto.birth_ymd}</td>
						<td>${dto.zipcode}</td>
						<td>${dto.addr}</td>
						<td>${dto.addr_road}</td>
						<td>${dto.addr_detail}</td>
						<td>${dto.use_yn}</td>
						<td>${dto.user_dt}</td>
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