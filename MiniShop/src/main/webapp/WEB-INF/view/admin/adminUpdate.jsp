<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 관리자 수정 페이지 -->

<jsp:include page="../include/a_header.jsp"/>

	<form action="adminUpdate" method="post">
		<div class="container w-75 mt-5">
			<h3><b>${adminDTO.adm_id}님의 관리자 정보 수정</b></h3>

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
			
			<div class="d-flex">
			<div class="mt-3">
			<p>관리자 현재 권한</p>
			<input type="text" value="${adminDTO.role}" class="form-control w-50"  readonly>
			</div>
			
			<div class="mt-3">
			<p>권한 수정</p>
			 <select class="form-select" id="role" name="role">
				     <option></option>
			</select>
			</div>
			</div>
			
			
			<div class="d-flex">
			<div class="mt-3">
			<p>현재 사용구분</p>
			<input type="text" value="${adminDTO.use_yn}" class="form-control w-50"  readonly>
			</div>
			
			<div class="mt-3">
			<p>사용구분 수정</p>
			 <select class="form-select" id="use_yn" name="use_yn">
				     <option></option>
			</select>
			</div>
			</div>
			
			<div class="mt-3">
				<button type="submit" class="btn btn-info">저장</button>				
				<a href="adminList" class="btn btn-secondary">리스트</a>				
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
	
	//사번 검색
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