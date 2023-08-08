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
				<table class="table mt-3">
					<thead class="table-secondary">
						<tr>
							<th>No.</th>					
							<th>제목</th>
							<th>작성자</th>
							<th>등록일자</th>
						</tr>
					</thead>					
					<tbody>
					<c:forEach items="${list}" var="dto">				
						<tr>
							<th>${dto.pst_no}</th>					
							<th><a href="<c:url value="/board/noticeView?no=${dto.pst_no }"/>">${dto.pst_ttl}</a></th>
							<th>${dto.wrt_id}</th>
							<th>${dto.req_dt}</th>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
	
				
<jsp:include page="../include/footer.jsp"/>
	
