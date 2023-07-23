<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 상품 등록 페이지 -->

<jsp:include page="../include/a_header.jsp"/>
	
	<div class="d-flex">
		<aside class="mt-5">
			<a href="" class="d-block mt-3">상품등록</a>
			<a href="" class="d-block mt-3">이미지 추가 등록</a>
			<a href="" class="d-block mt-3">이벤트 상품 등록</a>		
		</aside>
		<div class="vr m-5"></div>
	
		<div class="container w-75 mt-5">
			<h3><b>상품 등록</b></h3>
			<div class="mt-5 d-flex">
				<div>
				<input type="text" placeholder="카테고리 선택" class="form-control">
				<input type="text" placeholder="상품번호" class="form-control">
				<input type="text" placeholder="상품명" class="form-control ">
				<input type="file" placeholder="대표이미지" class="form-control ">
				<input type="text" placeholder="가격" class="form-control ">
				<input type="text" placeholder="적립금(포인트)" class="form-control ">
				</div>
				<div>
				<input type="text" placeholder="기타 구분" class="form-control ">
				<input type="text" placeholder="기타1" class="form-control ">
				<input type="text" placeholder="기타2" class="form-control ">
				<input type="text" placeholder="사용유무" class="form-control ">
				<input type="text" placeholder="등록일" class="form-control ">
				<input type="text" placeholder="처리자" class="form-control ">
				<a href="" class="btn btn-info">저장</a>				
				<a href="" class="btn btn-secondary">리스트</a>		
				</div>
			</div>
			<!-- <div class="mt-3">
				<a href="" class="btn btn-info">저장</a>				
				<a href="" class="btn btn-secondary">리스트</a>				
			</div> -->
		</div>	
	</div>



	
					
<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>