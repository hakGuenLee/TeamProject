<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!-- 관리자 등록 페이지 -->
<style>
    input[type='date']::before{
        content: attr(data-placeholder);
        width: 100%;
        color: #666;
    }
    input[type='date']:valid::before{
        display: none;
    }
</style>

<jsp:include page="../include/a_header.jsp"/>


		<form action="adminRegister" method="post" class="mt-5 w-100">
			
		<div class="container w-50 border shadow-sm p-5 my-5">
			<h4><b>관리자 등록</b></h4>	
			<div class="mt-5">
			<div class="form-floating mb-3 mt-3">
			  <input onkeyup="idCheck()" type="text" class="form-control w-100" id="adm_id" placeholder="관리자 아이디" name="adm_id">
			  <label for="id">관리자 아이디</label>
			  <p id="chkMsg" class="mb-2"></p>
			</div>

			<div class="form-floating mt-3 mb-3">
			  <input onkeyup="nickNameCheck()" type="text" class="form-control" id="adm_vnm" placeholder="관리자 이름(사용자뷰용 닉네임)" name="adm_vnm">
			  <label for="name">관리자 별칭(쇼핑몰에서 사용될 닉네임)</label>
			  <p id="chkMsg2" class="mb-2"></p>
			</div>
			
			<div class="form-floating mt-3 mb-3">
			  <input type="text" class="form-control" id="adm_nm" placeholder="관리자 이름(사용자명))" name="adm_nm">
			  <label for="name">관리자 성명</label>
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
			 <div class="mt-5">
			 <div class="d-flex">
					<div class="form-floating mt-3 mb-3">
        		<input class="form-control" type="date" id="proc_dt" name="proc_dt" min="now()" max="9999-12-31"
              required/>
				</div>
			<div class="form-floating mt-3 mb-3">
			  <input type="text" class="form-control" id="proc_id" placeholder="등록처리자" name="proc_id" value="<sec:authentication property="principal"/>">
			  <label for="regDate">등록처리자</label>
			</div>
			</div>
			
			<div class="d-flex">
				<div class="form-floating mb-3">
        		<input class="form-control" type="date" id="mod_dt" name="mod_dt" min="now()" max="9999-12-31"
               data-placeholder="수정일" required/>
				</div>
			<div class="form-floating mb-3">
			  <input type="text" class="form-control" id="mod_id" placeholder="수정처리자" name="mod_id">
			  <label for="mod_id">수정처리자</label>
			</div>
			</div>
			
			<div class="d-flex">
			 <div class="form-floating mb-3">
			  <input class="form-control" type="date" id="exp_dt" name="exp_dt" min="now()" max="9999-12-31"
			  data-placeholder="종료일" required/>
			</div>
			
			<div class="form-floating mb-3">
			  <input type="text" class="form-control" id="exp_id" placeholder="종료처리자" name="exp_id">
			  <label for="exp_id">종료처리자</label>
			</div>
			</div>
			 
			 
			 <label for="sel1" class="form-label">관리자 권한 지정</label>
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

	// 날짜설장
	document.getElementById('proc_dt').value = new Date().toISOString().substring(0, 10);; // 게시판 설정일 기본값을 오늘날짜로
	  document.getElementById('proc_dt').min = new Date().toISOString().substring(0, 10);; // 게시판 설정일 min 값을 오늘 날짜로
	  document.getElementById('mod_dt').min = new Date().toISOString().substring(0, 10);; // 게시판 설정일 min 값을 오늘 날짜로
	  document.getElementById('exp_dt').min = new Date().toISOString().substring(0, 10);; // 게시판 설정일 min 값을 오늘 날짜로
		
	
	//공통코드 가져오기
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
	//관리자명 검색 시 사번 가져온 후, 사번 입력폼에 대입하는 함수
	function empSearch(){
		let empName = $("#adm_nm").val();
 				
		
	 	$.ajax({
			url:"/admin/empSearch", 
			type : "post", //서버에 전송하기 위한 전송방식
			data : {"name" : empName},
			success: 
			function(data){
				console.log(data)
				
				if(data != "NotFound"){
					$("#emp_id").attr("value", data)
				}else{
					alert("등록할 관리자의 성명을 다시 확인하세요!")
				}				
			},
			error : function(){alert("error!!")} //서버에서 요청 처리가 실패 됬을 경우
			
		}); 
	}
	
    function idCheck() {

        var adm_id = $('#adm_id').val();

        if(adm_id.length<2){
            $('#chkMsg').html("아이디 길이는 2자리 이상이어야 합니다.")
            $('#chkMsg').css({"color":"red","font-size":"13px"});
            return;
        }

        $.ajax({
            url: "<c:url value='/admin/adminIdChk'/>",
            type: "post",
            data: {"adm_id": adm_id}, // 서버에 전송 할 데이터
            success: function (responseData) {
					
            	console.log("아이디 중복체크"+responseData);          	
                //responseData = "Y" or "N", Y: 사용가능 N: 사용불가
                if (responseData == "yes") {
                    $('#chkMsg').html("사용가능한 아이디 입니다.");
                    $('#chkMsg').css({"color":"blue","font-size":"13px"});
                    $('#isIdChk').val("yes");
                } else {
                    $('#isIdChk').val("no");
                    $('#chkMsg').html("사용 불가능한 아이디 입니다.")
                    $('#chkMsg').css({"color":"red","font-size":"13px"});

                }// if문
            },
            //success

            error: function () {
                $('#chkMsg').html("네트웍 에러")
                $('#chkModal').modal("show");
            }

        }); // $.ajax


    }//funtion idCheck
	
	function nickNameCheck(){
		 
      let vnm =	$("#adm_vnm").val();
      
      if(vnm.length == 0){
          $('#chkMsg2').html("닉네임을 입력해주세요!")
          $('#chkMsg2').css({"color":"red","font-size":"13px"});
          return;
      }
      
      $.ajax({
    		url: "/admin/nickNameCheck",
    		type: "post",
    		data: {"vnm" : vnm},
    		success: function (responseData) {				
            	console.log("닉네임 중복체크"+responseData);
                  	
                //responseData = "Y" or "N", Y: 사용가능 N: 사용불가
                if (responseData == "Yes") {
                    $('#chkMsg2').html("사용가능한 닉네임 입니다.");
                    $('#chkMsg2').css({"color":"blue","font-size":"13px"});
                } else {
                    $('#chkMsg2').html("사용 불가능한 아이디 입니다.")
                    $('#chkMsg2').css({"color":"red","font-size":"13px"});

                }// if문
            },
            //success

            error: function () {
                $('#chkMsg').html("네트웍 에러")
            }

      })
    	
  }	

	</script>
	
	
	
</body>
</html>