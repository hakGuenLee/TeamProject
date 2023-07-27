<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 등록 페이지 -->

<jsp:include page="../include/a_header.jsp"/>


		<form action="adminRegister" method="post" class="mt-5">
			
		<div class="d-flex container w-50 border shadow-sm p-5 my-5">
			<h4>관리자 등록</h4>	
			<div>
			<div class="form-floating mb-3 mt-3">
			  <input type="text" class="form-control w-50" id="adm_id" placeholder="관리자 아이디" name="adm_id">
			  <label for="id">관리자 아이디</label>
			</div>

			<div class="form-floating mt-3 mb-3">
			  <input type="text" class="form-control w-50" id="adm_vnm" placeholder="관리자 이름(사용자뷰용 닉네임)" name="adm_vnm">
			  <label for="name">관리자 이름(사용자뷰용 닉네임)</label>
			</div>
			
			<div class="form-floating mt-3 mb-3">
			  <input type="text" class="form-control w-50" id="adm_nm" placeholder="관리자 이름(사용자명))" name="adm_nm">
			  <label for="name">관리자 이름(사용자명)</label>
			</div>
			
<!-- 			<input type="button" value="사번검색" class="btn btn-secondary" onclick="shoEmp()"/>		 -->
			
				<a class="btn btn-secondary" onclick="empSearch()">사번 검색</a>
				
				
			<!-- 사번 값 대입받는 input -->	
			<div class="form-floating mt-3 mb-3">
			  <input type="text" class="form-control w-50" id="emp_id" placeholder="사번" name="emp_id">
			  <label for="emp_id"></label>
			</div>
			
			<div class="form-floating mt-3 mb-3">
			  <input type="text" class="form-control w-50" id="adm_pw" placeholder="관리자 패스워드" name="adm_pw">
			  <label for="pw">관리자 패스워드</label>
			</div>

	
			 <label for="sel1" class="form-label">사용 구분</label>
			 <select class="form-select w-50" id="use_yn" name="use_yn">
			      <option></option>
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
			      <option></option>
			 </select>
		
		<button type="submit" class="btn btn-primary">등록</button>
		<!-- <button class="btn btn-dark">리스트</button> -->
		</div>
		</div>
		</form>
		
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	<script>
	
	//관리자명 검색 시 사번 가져온 후, 사번 입력폼에 대입하는 함수
	
	
	
 $(document).ready(function(){
		var codeNum = '990';
		
		
		let str = "";
		
		let roleArea = $("#role"); //권한부여 영역

 		getCommonCode(codeNum, function(data){
 		console.log(data);
 		
 		let list = data;
 		
 		for(let i=0; i<list.length; i++){
 			str += ' <option value=' + list[i].item_cd+ '>'+list[i].item_nm+'</option>'
 		}
 		
 		roleArea.html(str);
 			
 		});
		
		var codeNum = '200';
		
		
		let str2 = "";
		
		let useArea = $("#use_yn"); //권한부여 영역

 		getCommonCode(codeNum, function(data){
 		console.log(data);
 		
 		let list = data;
 		
 		for(let i=0; i<list.length; i++){
 			str2 += ' <option value=' + list[i].item_cd+ '>'+list[i].item_nm+'</option>'
 		}
 		
 		useArea.html(str2);
 			
 		});
	
	});
	
	
	
	function empSearch(){
		let empName = $("#adm_nm").val();
 				
		
	 	$.ajax({
			url:"<c:url value='empSearch?name="+empName+"'/>", 
			type : "get", //서버에 전송하기 위한 전송방식
			dataType : "json", // 서버에서 응답하는 데이터 형식
			success: 
			function(data){
				console.log(data)
				$("#emp_id").val(data.emp_id)},
			error : function(){alert("error!!")} //서버에서 요청 처리가 실패 됬을 경우
			
		}); 
	}
	

	
	</script>
	
	
	
</body>
</html>