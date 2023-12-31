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
						<th>담당자명(닉네임)</th>
						<th>등록일</th>
						<th>종료일</th>
						<th>정보수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>	
				<c:set var="i" value="1"/>
				<c:forEach var="list" items="${adminList}">			
						<tr>
							<td>${i}</td>
							<td>${list.adm_id}</td>
							<td>${list.emp_id }</td>
							<td>${list.adm_vnm }</td>
							<td>${list.proc_dt}</td>
							<td>${list.exp_dt}</td>
							<td><a href="<c:url value='adminUpdate?id=${list.adm_id}'/>" class="btn btn-sm btn-info">수정</a></td>
							<td><a href="<c:url value='adminDelete?id=${list.adm_id}'/>" class="btn btn-sm btn-dark">삭제</a></td>
						<c:set var="i" value="${i+1}"/>
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