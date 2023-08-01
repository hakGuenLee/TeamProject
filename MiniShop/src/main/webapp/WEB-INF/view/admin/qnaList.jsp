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
						<th>카테고리</th>
						<th>상품명</th>
						<th>글쓴이ID(회원)</th>
						<th>문의일자(등록일)</th>
						<th>담당자명</th>
						<th>처리상태</th>
						<th>처리일</th>
						<th>답변</th>
					</tr>
				</thead>
				<tbody>
 				<c:forEach items="${QList}" var="qdto">		
						<tr>
							<td>${qdto.qna_no}</td>
							<td>${qdto.qna_ttl}</td>
							<td>${qdto.qna_code}</td>
							<td>${qdto.prod_no}</td>
							<td>${qdto.user_id}</td>
							<td>${qdto.qna_dt}</td>
							<td>${qdto.proc_id}</td>
							<td>${qdto.proc_sts}</td>
							<td>${qdto.proc_dt}</td>
							<td><a href="<c:url value=""/>" class="btn btn-sm btn-primary" >답변달기</a></td>
						</tr>
						</c:forEach>	
				</tbody>
			</table>
		</div>
		<div>
						<ul class="pagination justify-content-center my-5">
        <li class="page-item ${pageDTO.prevPage <= 0 ? 'disabled' : ''}">
            <a class="page-link" href="<c:url value="/QnA/qnaList?viewPage=${pageDTO.prevPage}&cntPerPage=${pageDTO.cntPerPage}"/>">이전</a>
        </li>

        <c:forEach var="i" begin="${pageDTO.blockStart}" end="${pageDTO.blockEnd}">
            <li class="page-item ${pageDTO.viewPage == i ? 'active' : ''}">
                <a class="page-link"
                   href="<c:url value="/QnA/qnaList?viewPage=${i}&cntPerPage=${pageDTO.cntPerPage}"/>">${i}</a>
            </li>
        </c:forEach>

        <li class="page-item ${pageDTO.blockEnd >= pageDTO.totalPage ? 'disabled' : ''}">
            <a class="page-link" href="<c:url value="/QnA/qnaList?viewPage?viewPage=${pageDTO.nextPage}&cntPerPage=${pageDTO.cntPerPage}"/>">다음</a>
        </li>
    </ul>
		</div>
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>