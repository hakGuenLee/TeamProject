<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 카테고리 등록 페이지 -->

<jsp:include page="../include/a_header.jsp"/>

	<div class="container w-50 mt-5">
	<form action="<c:url value="/category/catRegister"/>" method="post">
		<h3><b>카테고리 등록</b></h3>
		<div class="mt-5">

			<input type="text" placeholder="카테고리1   ex)A100" class="form-control w-50 mb-3" name="ct_cd1">
			<input type="text" placeholder="이름1        ex)과일" class="form-control w-50 mb-3" name="ct_nm1"/>
			<input type="text" placeholder="순번1        ex)1" class="form-control w-50 mb-3" name="ct_seq1"/>
			<input type="text" placeholder="카테고리2   ex)A100001" class="form-control w-50 mb-3" name="ct_cd2"/>
			<input type="text" placeholder="이름2        ex)복숭아" class="form-control w-50 mb-3" name="ct_nm2"/>
			<input type="text" placeholder="순번2        ex)1" class="form-control w-50 mb-3" name="ct_seq2"/>
		</div>
		<div class="mt-3">
			<input type="submit" class="btn btn-info" value="등록">			
			<a href="<c:url value="/category/catList"/>" class="btn btn-secondary">리스트</a>
			
		</div>
		</form>
	</div>				
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>