<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <style>  연도 월일을 생년월일로 바꿔줄수 있지만 작성할때 불편
    input[type='date']::before{
        content: attr(data-placeholder);
        width: 100%;
        color: #666;
    }
    input[type='date']:valid::before{
        display: none;
    }
</style>
 -->

<!-- 회원가입 페이지 -->

<jsp:include page="../include/header.jsp" />

<div class="container w-50 mt-5 p-5 shadow">
	<form action="/user/userRegister" method="post"
		onsubmit="return submitChk()">
		<h4>
			<b>회원가입</b>
		</h4>

		<input type="hidden" id="isIdChk" value="no" />
		<!-- -->
		<input class="form-control mb-2 w-50" onkeyup="idCheck()" type="text"
			name="user_id" id="user_id" placeholder="아이디" />
		<p id="chkMsg" class="mb-2"></p>

		<input type="hidden" id="isPwChk" value="no" /> 
		<input
			class="form-control mb-2 w-50" type="password" id="user_pw"
			name="user_pw" placeholder="비밀번호" onkeyup="pwCheck()">
		<p id="chkMsg2" class="mb-2"></p>
		<input type="hidden" id="isPwChk2" value="no" /> <input
			class="form-control mb-2 w-50" type="password" id="user_pw2"
			name="user_pw2" placeholder="비밀번호 확인" onkeyup="pwCheck2()">
		<p id="chkMsg3" class="mb-2"></p>


		<input class="form-control mb-2 w-50" type="text" name="user_nm"
			placeholder="이름" required> 
			
			<input class="form-control mb-2 w-50"
			type="text" name="user_home" id="user_home" placeholder="집 번호" oninput="regexPhoneNumber(this)"> 
			<input
			class="form-control mb-2 w-50" type="text" id="user_phone" name="user_phone" onkeyup="telCheck()" oninput="regexPhoneNumber(this)"
			placeholder="휴대폰 번호">
		<p id="chkMsg4" class="mb-2"></p>
		<p id="chkMsg5" class="mb-2"></p>
		<input type="hidden" id="isTelChk" value="no" /> 
			
		<div class="row">
			<div class="col-md-8">
				<input class="form-control mb-2" type="text" id="user_email"
					name="user_email" placeholder="이메일" />
			</div>
			<div class="col-md-4">
				<span class="btn btn-outline-secondary" onclick="emailCheck()">인증번호받기</span>

			</div>
		</div>

		<%-- 이메일 인증코드 확인하기 --%>
		<div class="row" id="confirmEmail"></div>
		<!-- 생년월일 -->
		<div class="form-floating mt-3 mb-3 me-3 w-50">
			<input class="form-control mb-2" type="date" id="birth_ymd"
				name="birth_ymd" min="1900-01-01" max="now()"
				data-placeholder="생년월일" required />
		</div>

		<!-- 주소 -->
		<div class="row mb-2">
			<div class="col-md-6">
				<input class="form-control mb-2" type="text" id="sample4_postcode"
					name="zipcode" placeholder="우편번호" readonly>
			</div>
			<div class="col-md-6 p-0 ps-2">
				<a class="btn btn-sm btn-outline-secondary p-2"
					onclick="sample4_execDaumPostcode()">우편번호 찾기</a><br>
			</div>
		</div>

		<input class="form-control mb-2 w-50" type="text" name="addr_road"
			id="sample4_roadAddress" placeholder="도로명주소" readonly> <input
			class="form-control mb-2 w-50" type="text" name="addr"
			id="sample4_jibunAddress" placeholder="지번주소" readonly>
		<!-- <span id="guide" style="color:#999;display:none"></span> -->
		<input class="form-control mb-2" type="text"
			id="sample4_detailAddress" name="addr_detail" placeholder="상세주소">
		<div class="text-center mt-3">
			<input type="submit" class="btn btn-primary" value="가입"> <input
				type="reset" class="btn btn-info" value="취소">
		</div>
	</form>
</div>

<!-- The Modal -->
<div class="modal fade" id="chkModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<div class="modal-header">
				<h4 class="modal-title">중복 체크 확인</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
			</div>

			<div class="modal-body text-center" id="chkMsg">다시 입력해주세요</div>

		</div>
	</div>
</div>

<script>
	document.getElementById('birth_ymd').max = new Date().toISOString()
			.substring(0, 10);
	; // 게시판 설정일 min 값을 오늘 날짜로

	let isEmailChk = false;
	let severUUID = "";

	function submitChk() {

		let isIdChk = $("#isIdChk").val();
		let isPwChk = $("#isPwChk").val();
		let isTelChk = $("#isTelChk").val();

		if (isIdChk == "no") {
			alert("아이디 중복확인을 해주세요")
			$("#user_id").select();
			return false;
		}
		if (isPwChk == "no") {
			alert("비밀번호 확인을 해주세요.")
			$("#user_pw").select();
			return false;
		}
		if (isTelChk == "no") {
			alert("휴대폰 번호 확인을 해주세요.")
			$("#user_phone").select();
			return false;
		}
		if (!isEmailChk) {
			alert("이메일 인증확인을 해주세요");
			$("#email").select();
			return false;
		}

	}//submitChk

	function idCheck() {

		var user_id = $('#user_id').val();
		var pattern =  /^(?=.*[a-zA-Z])(?=.*[0-9]).{2,10}$/;

		if (!pattern.test(user_id)) {
			$('#isIdChk').val("no");
			$('#chkMsg').html("아이디는 영어 + 숫자 조합이어야 하며 , 2자리 이상 10자리 이하여야 	합니다.")
			$('#chkMsg').css({
				"color" : "red",
				"font-size" : "13px"
			});
			return;
		}

		$.ajax({
			url : "<c:url value='/user/userIdChk'/>",
			type : "get",
			data : {
				"user_id" : user_id
			}, // 서버에 전송 할 데이터
			success : function(responseData) {

				console.log("아이디 중복체크" + responseData);

				//responseData = "Y" or "N", Y: 사용가능 N: 사용불가
				if (responseData == "yes") {
					$('#chkMsg').html("사용가능한 아이디 입니다.");
					$('#chkMsg').css({
						"color" : "blue",
						"font-size" : "13px"
					});
					$('#isIdChk').val("yes");
					console.log(isIdChk)
				} else {
					$('#isIdChk').val("no");
					$('#chkMsg').html("사용불가한 아이디 입  니다.")
					$('#chkMsg').css({
						"color" : "red",
						"font-size" : "13px"
					});

				}// if문

			},
			//success
			error : function() {
				$('#chkMsg').html("네트웍 에러")
				$('#chkModal').modal("show");
			}

		}); // $.ajax

	}//funtion idCheck

	// 이건 비밀번호 ㅇㅍ효성검사야
	function pwCheck() {

		var user_pw = $('#user_pw').val();
		var user_pw2 = $('#user_pw2').val();
		var pattern = /^(?=.*?[a-zA-Z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;

		if (!pattern.test(user_pw)) {
			$('#isPwChk').val("no");
			$('#chkMsg2').html("비밀번호는 영어 + 숫자 + 특수기호 조합 8~16자여야 합니다.")
			$('#chkMsg2').css({
				"color" : "red",
				"font-size" : "13px"
			});
			return;
		} else {
			$('#isPwChk').val("yes");
			$('#chkMsg2').html("사용가능한 비밀번호 입니다.")
			$('#chkMsg2').css({
				"color" : "blue",
				"font-size" : "13px"
			});

		}

	} // pwCheck

	// 패스워드 확인
	function pwCheck2() {

		var isPwChk = $('#isPwChk').val();
		var user_pw = $('#user_pw').val();
		var user_pw2 = $('#user_pw2').val();

		if (isPwChk === 'yes' && user_pw !== user_pw2) {

			$('#isPwChk2').val("no");
			$('#chkMsg3').html("비밀번호가 다릅니다.")
			$('#chkMsg3').css({
				"color" : "red",
				"font-size" : "13px"
			});
			return;
		} else if (isPwChk === 'yes' && user_pw === user_pw2) {
			$('#isPwChk2').val("yes");
			$('#chkMsg3').html("비밀번호가 일치합니다.")
			$('#chkMsg3').css({
				"color" : "blue",
				"font-size" : "13px"
			});
			return;

		}
	}
	
	
	// 전화번호 정규식 자동 하이픈
	const regexPhoneNumber = (target) => {
	      target.value = target.value.replace(/[^0-9]/g, '').replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`)
	}
	
	
	// 전화번호 숫자만 입력가능하게 유효성검사
	function telCheck(){
		
		var user_home = $('#user_home').val();
		var user_phone = $('#user_phone').val();
		var pattern = /^\d{3}-\d{3,4}-\d{4}$/;
		
			if (!pattern.test(user_phone)) {
				$('#isTelChk').val("no");
				$('#chkMsg4').html("휴대폰 번호 형식대로 입력해주세요")
				$('#chkMsg5').html("예) 01012345678 => 010-1234-5678")
				$('#chkMsg4').css({
					"color" : "red",
					"font-size" : "9px"
				});
				$('#chkMsg5').css({
					"color" : "green",
					"font-size" : "9px"
				});
				return;
			}
			else {
				$('#isTelChk').val("yes");
				$('#chkMsg4').html("사용가능한 번호입니다.")
				$('#chkMsg4').css({
					"color" : "blue",
					"font-size" : "13px"
				});

			}
		
		
	}

	function emailCheck() {
		let user_email = $("#user_email").val();
		$
				.ajax({
					url : "<c:url value='/user/userEmailChk'/>",
					type : "get",
					data : {
						"user_email" : user_email
					},
					success : function(uuid) {
						if (uuid != "fail") {

							serverUUID = uuid;
							console.log("이메일 인증코드 : " + uuid);
							$("#confirmEmail")
									.html(
											'<div class="col-md-8">'
													+ '<input class="form-control mb-2" type="text" id="confirmUUID">'
													+ ' </div>'
													+ ' <div class="col-md-4">'
													+ ' <span class="btn btn-outline-secondary" onclick="emailConfirm()">인증코드확인</span>'
													+ '</div>');
						} else {
							alert("이메일을 다시 확인하세요");
							$("#user_email").select();
						}

					},
					error : function() {
						alert("이메일 형식이 올바르지 않습니다.");
					}
				});
	}//emailCheck( );

	function emailConfirm() {
		let confrimUUID = $("#confirmUUID").val();

		if (confrimUUID == null || confrimUUID == "") {
			alert("인증코드를 확인하세여");
			$("#confrimUUID").select();
		} else if (serverUUID == confrimUUID) {
			alert("인증성공")
			isEmailChk = true;
		} else {
			alert("인증번호를 확ㅇ니하세요")
			$("#confirmUUID").select();
			return;
		}
	}
</script>


<jsp:include page="../include/footer.jsp" />
