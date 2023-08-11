<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  

<!-- 카테고리 리스트 -->

<jsp:include page="../include/a_header.jsp"/>
		<div class="container w-75 mt-5">
			<h3><b>카테고리 리스트</b></h3>
			<table class="table mt-5">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>					
						<th>카테고리1</th>
						<th>이름1</th>
						<th>순번1</th>
						<th>카테고리2</th>
						<th>이름2</th>
						<th>순번2</th>
						<th>사용유무</th>
						<th>관리자ID</th>
						<th>등록일</th>
						<th>수정</th>
						<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
						<th>삭제</th>
						</sec:authorize>
					</tr>
				</thead>
				<tbody>				
				<c:forEach items="${cList}" var="cdto">
						<tr>
							<td>${cdto.ctgry_no}</td>
							<td>${cdto.ct_cd1}</td>
							<td>${cdto.ct_nm1}</td>
							<td>${cdto.ct_seq1}</td>
							<td>${cdto.ct_cd2}</td>
							<td>${cdto.ct_nm2}</td>
							<td>${cdto.ct_seq2}</td>
							<td>${cdto.use_yn}</td>
							<td>${cdto.proc_id}</td>
							<td>${cdto.proc_dt}</td>
							<td><a href="<c:url value="/category/catUpdate?no=${cdto.ctgry_no}"/>" class="btn btn-outline-primary btn-sm">수정</a></td>
							<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
							<td><a href="<c:url value="/category/catDelete?no=${cdto.ctgry_no}"/>" class="btn btn-outline-danger btn-sm">삭제</a></td>
							</sec:authorize>
						</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
		
				<ul class="pagination justify-content-center my-5">
        <li class="page-item ${pageDTO.prevPage <= 0 ? 'disabled' : ''}">
            <a class="page-link" href="<c:url value="/category/catList?viewPage=${pageDTO.prevPage}&cntPerPage=${pageDTO.cntPerPage}"/>">이전</a>
        </li>

        <c:forEach var="i" begin="${pageDTO.blockStart}" end="${pageDTO.blockEnd}">
            <li class="page-item ${pageDTO.viewPage == i ? 'active' : ''}">
                <a class="page-link"
                   href="<c:url value="/category/catList?viewPage=${i}&cntPerPage=${pageDTO.cntPerPage}"/>">${i}</a>
            </li>
        </c:forEach>

        <li class="page-item ${pageDTO.blockEnd >= pageDTO.totalPage ? 'disabled' : ''}">
            <a class="page-link" href="<c:url value="/category/catList?viewPage=${pageDTO.nextPage}&cntPerPage=${pageDTO.cntPerPage}"/>">다음</a>
        </li>
    </ul>
		
	
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>