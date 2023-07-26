<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 수정 페이지 -->

<jsp:include page="../include/a_header.jsp"/>

	<form action="adminUpdate" method="post">
		<div class="container w-75 mt-5">
			<h3><b>관리자 수정</b></h3>

			<div class="mt-3">
				<p>관리자명(실명)</p>		
				<input type="text" value="${adminDTO.adm_nm}" class="form-control w-50" readonly>
			</div>
			<div class="mt-3">
				<p>관리자 사번</p>		
				<input type="text" value="${adminDTO.emp_id}" class="form-control w-50" readonly>
			</div>
			<div class="mt-3">
				<p>관리자 아이디</p>		
				<input type="text" value="${adminDTO.adm_id}" class="form-control w-50" name="adm_id" readonly>
			</div>
			<div class="mt-3">
				<p>담당자명(닉네임)</p>		
				<input type="text" value="${adminDTO.adm_vnm}" class="form-control w-50" name="adm_vnm">
			</div>	
			<div class="mt-3">
				<p>관리자 비밀번호</p>		
				<input type="text" value="${adminDTO.adm_pw}" class="form-control w-50" name="adm_pw">
			</div>
			
			<div class="mt-3">
			<p>권한 설정</p>
			 <select class="form-select" id="role" name="role">
				 <c:forEach var="list" items="${roleList}">
				     <option>${list.item_nm}</option>
				  </c:forEach>
			</select>
			</div>
			
			<div class="mt-3">
			<p>사용구분</p>
			 <select class="form-select" id="use_yn" name="use_yn">
				 <c:forEach var="usecode" items="${useCode}">
				     <option>${usecode.item_nm}</option>
				  </c:forEach>
			</select>
			</div>
			
			
			<div class="mt-3">
				<button type="submit" class="btn btn-info">저장</button>				
				<a href="adminList" class="btn btn-secondary">리스트</a>				
			</div>
		</div>				
	</form>	
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>