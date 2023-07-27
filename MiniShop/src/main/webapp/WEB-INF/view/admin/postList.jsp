<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- <script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/css/summernote/summernote-lite.css"> -->
<!-- 공지사항/팝업 등록 리스트 페이지 -->

<jsp:include page="../include/a_header.jsp"/>
		<div class="container w-75 mt-5">
		<h2>공지/팝업 리스트</h2>
			<table class="table mt-3">
						<thead class="table-secondary">
							<tr>
								<th>No.</th>					
								<th>공지구분(공지/팝업)</th>
								<th>제목</th>
								<th>담당자명(사원번호)</th>
								<th>게시기간</th>
								<th>등록일</th>
								<th>수정일</th>
								<th>승인자</th>
								<th>승인요청일</th>
								<th>승인상태</th>
								<th>승인처리일</th>
								<th>수정</th>
								<th>삭제</th>
								
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${pList}" var="pdto">				
							<tr>
								<td>${pdto.pst_no}</td>
								<td>${pdto.pst_gb=='001' ? '팝업' : '공지'}</td>
								<td>${pdto.pst_ttl}</td>
								<td>${pdto.wrt_id}</td>
								<td>${pdto.strt_ymd}<br>~ ${pdto.end_ymd}</td>
								<td>${pdto.proc_dt}</td>
								<td>${pdto.mod_dt}</td>
								<td>${pdto.req_id}</td>
								<td>${pdto.req_dt}</td>
								<td>${pdto.pst_sts}</td>
								<td>${pdto.aprv_dt}</td>
								<td><a href="<c:url value="/post/postUpdate"/>" class="btn btn-info">수정</a></td>
								<td><a href="<c:url value="/post/postDelete"/>" class="btn btn-dark">삭제</a></td>
								
							</tr>
							</c:forEach>
						</tbody>
			</table>
		</div>
	<jsp:include page="../include/a_footer.jsp"/>
	
