<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 등록 페이지 -->


<jsp:include page="../include/a_header.jsp"/>

	
		
		<form action="#" method="post" class="mt-5">
			<h4>관리자 등록</h4>	
		<div class="d-flex container w-50 border shadow-sm p-5 my-5">
			
			<div>
			<div class="form-floating mb-3 mt-3">
			  <input type="text" class="form-control w-50" id="id" placeholder="관리자 아이디" name="id">
			  <label for="id">관리자 아이디</label>
			</div>

			<div class="form-floating mt-3 mb-3">
			  <input type="text" class="form-control w-50" id="name" placeholder="관리자 이름(실명)" name="name">
			  <label for="name">관리자 이름(실명)</label>
			</div>
			
			<div class="form-floating mt-3 mb-3">
			  <input type="text" class="form-control w-50" id="pw" placeholder="관리자 패스워드" name="pw">
			  <label for="pw">관리자 패스워드</label>
			</div>
			
			<div class="container mt-3">
			  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
			    관리자 사원번호 (담당자) 검색
			  </button>
			</div>
			
			<!-- The Modal -->
			<div class="modal fade" id="myModal">
			  <div class="modal-dialog">
			    <div class="modal-content">
			
			      <!-- Modal Header -->
			      <div class="modal-header">
			        <h4 class="modal-title">관리자 사원번호 검색</h4>
			        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			      </div>
			
			      <!-- Modal body -->
			      <div class="modal-body">
			        Modal body..
			      </div>
			
			      <!-- Modal footer -->
			      <div class="modal-footer">
			        <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
			      </div>
			
			    </div>
			  </div>
			</div>
			
			
	
			 <label for="sel1" class="form-label">사용 구분</label>
			 <select class="form-select w-50" id="sel1" name="sellist1">
			      <option>사용</option>
			      <option>미사용</option>
			 </select>
			 </div>
			 <div>
			 <div class="d-flex">
			 <div class="form-floating mt-3 mb-3">
			  <input type="text" class="form-control" id="proc_dt" placeholder="등록일" name="proc_dt">
			  <label for="regDate">등록일</label>
			</div>
			<div class="form-floating mt-3 mb-3">
			  <input type="text" class="form-control" id="proc_id" placeholder="등록처리자" name="proc_id">
			  <label for="regDate">등록처리자</label>
			</div>
			</div>
			
			<div class="d-flex">
			 <div class="form-floating mt-3 mb-3">
			  <input type="text" class="form-control" id="mod_dt" placeholder="수정일" name="mod_dt">
			  <label for="mod_dt">수정일</label>
			</div>
			<div class="form-floating mt-3 mb-3">
			  <input type="text" class="form-control" id="mod_id" placeholder="수정처리자" name="mod_id">
			  <label for="mod_id">수정처리자</label>
			</div>
			</div>
			
			<div class="d-flex">
			 <div class="form-floating mt-3 mb-3">
			  <input type="text" class="form-control" id="exp_dt" placeholder="종료일" name="exp_dt">
			  <label for="exp_dt">종료일</label>
			</div>
			<div class="form-floating mt-3 mb-3">
			  <input type="text" class="form-control" id="exp_id" placeholder="종료처리자" name="exp_id">
			  <label for="exp_id">종료처리자</label>
			</div>
			</div>
			 
			 
			 <label for="sel1" class="form-label">권한 부여 </label>
			 <select class="form-select" id="role" name="role">
			      <option>없음</option>
			      <option>최고관리자</option>
			      <option>상품매니저</option>
			      <option>cs매니저</option>
			      <option>중간매니저</option>
			      <option>매니저</option>
			 </select>
		
		<button class="btn btn-primary">등록</button>
		<button class="btn btn-secondary">수정</button>
		<button class="btn btn-dark">리스트</button>
		</div>
		</div>
		</form>
		
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>