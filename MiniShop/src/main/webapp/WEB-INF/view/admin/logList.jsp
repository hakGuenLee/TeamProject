<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 로그 확인 페이지 -->

<jsp:include page="../include/a_header.jsp"/>

		<div class="container w-75 mt-5">
			<h3><b>시스템 로그 리스트</b></h3>
			<table class="table mt-3">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>					
						<th>관리자 아이디</th>
						<th>서비스 수행시간</th>
						<th>수행서비스명</th>
					</tr>
				</thead>
				<tbody>				
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
				</tbody>
			</table>
		</div>
		
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>