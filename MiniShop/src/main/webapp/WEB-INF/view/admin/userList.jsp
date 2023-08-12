<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 회원 리스트 페이지 -->

<jsp:include page="../include/a_header.jsp"/>
	
	

		<div class="container w-75 mt-5">
			<h3><b>회원 리스트</b></h3>
		
		
			 <form action="/admin/userSearch" method="post">
				  <div class="input-group mb-3 w-50 d-flex">
					 <input type="text" name="search" class="form-control" 
					 placeholder="회원명, ID 또는 회원 휴대번호 뒷자리로 회원 검색 가능합니다">
				  	<button type="submit" class="btn btn-primary">검색</button>	
				  </div>
				</form>
		
			
			
			<table class="table w-100 mt-3">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>					
						<th>회원ID</th>
						<th >회원명</th>
						<th >휴대번호</th>
						<th >이메일</th>
						<th style="width:100px">생년월일</th>
						<th style="width:100px">활성화여부</th>
						<th>가입일자</th>
						<th>수정</th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach items="${list}" var="dto">				
					<tr>
						<td>${dto.user_no}</td>					
						<td id="userId">${dto.user_id}</td>
						<td>${dto.user_nm}</td>
						<td>${dto.user_phone}</td>
						<td>${dto.user_email}</td>
						<td>${dto.birth_ymd}</td>
						<td>${dto.use_yn}</td>
						<td>${dto.user_dt}</td>
						<td><a href="/admin/userInfoUpdate?no=${dto.user_no}" class="btn btn-info">수정</a></td>
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
	
