<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 카테고리 등록 페이지 -->

<jsp:include page="../include/a_header.jsp"/>

	<div class="container w-75 mt-5">
		<h3><b>카테고리 등록</b></h3>
		<div class="mt-5">
			<input type="text" placeholder="코드1" class="form-control w-50">
			<input type="text" placeholder="코드명1" class="form-control w-50">
			<input type="text" placeholder="코드2" class="form-control w-50">
			<input type="text" placeholder="코드명2" class="form-control w-50">
			<input type="text" placeholder="순번" class="form-control w-50">
			<input type="text" placeholder="사용유무" class="form-control w-50">
			<input type="text" placeholder="등록일" class="form-control w-50">
			<input type="text" placeholder="처리자" class="form-control w-50">
		</div>
		<div class="mt-3">
			<a href="" class="btn btn-info">저장</a>				
			<a href="" class="btn btn-secondary">리스트</a>				
		</div>
	</div>				
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>