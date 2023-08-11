<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 공지사항 확인 게시판 -->

<jsp:include page="../include/header.jsp"/>
<style>
	a{ text-decoration : none}
</style>

			<div class="container mt-5">
			<h3><b>공지사항</b></h3>
			
			<form action="/board/NoticeSearch" method="post">
				  <div class="input-group mb-3 w-25 d-flex">
					 <input type="text" name="search" class="form-control" placeholder="제목을 검색하세요">
				  	<button type="submit" class="btn btn-primary">검색</button>	
				  </div>
				</form>
			
			
				<table class="table mt-3" >
					<thead class="table-secondary">
						<tr>
							<th>No.</th>					
							<th>제목</th>
							<th>작성자</th>
							<th>등록일자</th>
							<th>조회수</th>
						</tr>
					</thead>					
					<tbody>
					<c:forEach items="${list}" var="dto">				
						<tr>
							<td>${dto.pst_no}</td>					
							<td><a href="<c:url value="/board/noticeView?no=${dto.pst_no }"/>">${dto.pst_ttl}</a></th>
							<td>${dto.wrt_id}</td>
							<td>${dto.req_dt}</td>
							<td>${dto.hit}</td>
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
	
				
<jsp:include page="../include/footer.jsp"/>
	
