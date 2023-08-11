<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 카테고리 등록 페이지 -->

<jsp:include page="../include/a_header.jsp"/>

	<div class="container w-50 mt-5">
	<form action="<c:url value="/category/catUpdate"/>" method="post">
		<h3><b>카테고리 수정</b></h3>
		<div class="mt-5">
			<!-- 어떤 카테고리를 수정할지 알아야 하기에 카테고리 번호를 히든으로 넘김 -->
			<input type="hidden" name="ctgry_no" value="${cdto.ctgry_no}" >
			
			카테고리 1<input type="text" placeholder="ex)A100" class="form-control w-50 mb-3" name="ct_cd1" value="${cdto.ct_cd1}" >
			이름1<input type="text" placeholder="ex)과일" class="form-control w-50 mb-3" name="ct_nm1"  value="${cdto.ct_nm1}"/>
			순번1<input type="text" placeholder="ex)1" class="form-control w-50 mb-3" name="ct_seq1" value="${cdto.ct_seq1}"/>
			카테고리2<input type="text" placeholder="ex)A100001" class="form-control w-50 mb-3" name="ct_cd2" value="${cdto.ct_cd2}"/>
			이름2<input type="text" placeholder="ex)복숭아" class="form-control w-50 mb-3" name="ct_nm2" value="${cdto.ct_nm2}"/>
			순번2<input type="text" placeholder="ex)1" class="form-control w-50 mb-3" name="ct_seq2" value="${cdto.ct_seq2}"/>
			사용유무<select class="form-select form-select-sm w-50" name="use_yn">
							<option value="Y" selected>Y</option>
							<option value="N" >N</option>
			</select>
		</div>
		<div class="mt-3">
			<input type="submit" class="btn btn-info" value="수정">			
			<a href="<c:url value="/category/catList"/>" class="btn btn-secondary">리스트</a>
			
		</div>
		</form>
	</div>				
					
	<jsp:include page="../include/a_footer.jsp"/>