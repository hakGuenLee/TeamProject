<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 아이디 찾기 -->

<jsp:include page="../include/header.jsp" />


<div class="container w-50 shadow rounded border p-5 mt-5">
	<!-- Nav tabs -->
	<ul class="nav nav-tabs" role="tablist">
		<li class="nav-item"><a
			class="nav-link <c:if test="${find=='id'}">active</c:if>"
			data-bs-toggle="tab" href="#menu1">아이디 찾기</a></li>
		<li class="nav-item"><a
			class="nav-link <c:if test="${find=='pw'}">active</c:if>"
			data-bs-toggle="tab" href="#menu2">비밀번호 찾기</a></li>
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<%--아이디 pannel--%>
		<div id="menu1"
			class="container tab-pane fade <c:if test="${find=='id'}">active show</c:if>">
			<br>
			<!-- 평상시엔 isplay none 으로 가리고 script idFind 성공 시 diplay block  -->
			<div id="findIdSuccess" style="display: none" class="px-4">
				<p class="text-center mt-4">
					가입시 아이디는 <b><span id="resultId"></span></b>입니다.
				</p>
				<a class="btn btn-primary mt-3 w-100" type="button"
					href="<c:url value="/member/login.do"/>">로그인</a>
			</div>

			<div id="findIdBefore" class="px-4">
				<p>이름과 휴대폰 번호를 입력하세요.</p>
				<input class="form-control mb-2" type="text" id="name" name="name"
					placeholder="이름" /> <input class="form-control mb-2" type="text"
					id="tel" name="tel" placeholder="전화번호" /> <input
					class="btn btn-primary mt-3 w-100" type="button" value="아이디 찾기"
					onclick="idFind()" />
			</div>
		</div>
		<%-- 비밀번호 pannel--%>
		<div id="menu2"
			class="container tab-pane fade <c:if test="${find=='pw'}">active show</c:if>">
			<br>

			<div id="findPwSuccess" style="display: none" class="px-4">
				<p>변경하실 비밀번호를 입력해주세요.</p>
				<input class="form-control mb-2" type="text" id="newPw" name="newPw"
					placeholder="새로운 비밀번호" />
				<p id="chkMsg" class="mb-2"></p>
				<input class="form-control mb-2" onkeyup="findPwChk()" type="text"
					id="newPwChk" name="newPwChk" placeholder="비밀번호 확인" /> <span
					class="btn btn-outline-secondary" onclick="pwChange()">수정하기</span>
			</div>

			<div id="findPwBefore" class="px-4">
				<p>가입시 아이디와 이메일을 입력하세요.</p>
				<input class="form-control mb-2" type="text" id="id" name="id"
					placeholder="아이디" />
				<div class="row">
					<div class="col-md-8">
						<input class="form-control mb-2" type="text" id="email"
							name="email" placeholder="이메일" />
					</div>
					<div class="col-md-4">
						<span class="btn btn-outline-secondary" onclick="pwFind()">인증번호받기</span>
					</div>
				</div>
				<%-- 이메일 인증코드 확인하기 --%>
				<div class="row" id="confirmEmail"></div>
			</div>
		</div>
	</div>


</div>
<jsp:include page="../include/footer.jsp" />


</body>

<script>

function pwChange(){

	let id = $("#id").val();
	let newPw = $("#newPw").val();
	let newPwChk = $("#newPwChk").val();

	
    $.ajax({
        url:"<c:url value= '/member/findPwChange.do?id='/>"+id+"&pw="+newPw+"&newPwChk="+newPwChk,
        type:"post",
        success(data){
            if(data =="fail"){
        	console.log(data)
                alert("비밀번호가 일치하지 않습니다.");
            }else{
            	 alert("비밀번호가 수정완료.");
                 location.href="<c:url value="/member/login.do"/>"
            }
        },
        error:function(){alert("비밀번호 수정 요청 실패!!")}
    });
}


        function idFind(){
        	let name = $("#name").val();
             let tel = $("#tel").val(); 

            $.ajax({
               url:"<c:url value='/member/findId.do?name='/>"+name+"&tel="+tel,
               type:"post",	// data 는 findId.do 실행시 결과값 resultId를 리턴받아서 가져옴
               success: function(data){ // data는 찾기 실패시 0, 찾으면 해당 아이디값
                   if(data == 0){
                       alert("이름 및 휴대폰 번호를 다시 확인하기 바랍니다..")
                   }else{ // 아이디 찾기 성공
                        $("#findIdBefore").css("display", "none");
                        $("#findIdSuccess").css("display", "block");
                        $("#resultId").text(data);
                   }
               },
                error:function(){alert("아이디 찾기 요청 실패!!")}
            });
        }//idFind

        
		let serverUUID = "";
        
        function pwFind(){

        	let id = $("#id").val();
    		let email = $("#email").val();
        	
            $.ajax({
                url:"<c:url value='/member/findPw.do?id='/>"+id+"&email="+email,
                type:"post",
                success(data){
                    if(data =="fail"){
                	console.log(data)
                        alert("아이디와 이메일을 다시 확인하세요");
                    }else{
                    	console.log(data)
    					serverUUID = data;
    					console.log("이메일 인증코드 : " + data);
        
            			$("#confirmEmail").html('<div class="col-md-8">'
    							+'<input class="form-control mb-2" type="text" id="confirmUUID"/></div>'
    							+'<div class="col-md-4">'
    							+'<span class="btn btn-outline-secondary w-100" onclick="emailConfirm()"> 인증코드확인</span></div>'
    						);
                    }
                },
                error:function(){alert("비밀번호 찾기 요청 실패!!")}
            });
        }

        function emailConfirm(){
        	

            let confrimUUID = $("#confirmUUID").val();

            if(confrimUUID == null || confrimUUID ==""){
                alert("인증코드를 확인하세여");
                $("#confrimUUID").select();
            }else if(serverUUID == confrimUUID){
                alert("인증성공")
                
                console.log(id);
                $("#findPwBefore").css("display", "none");
                $("#findPwSuccess").css("display", "block");
                
            }else {
                alert("인증번호를 확ㅇ니하세요")
                $("#confirmUUID").select();
                return;
            }    	 
        }
    		
        function findPwChk(){
        	let newPw = $("#newPw").val();
        	let newPwChk = $("#newPwChk").val();
        	
        	if(newPw != newPwChk ){
        		 $('#chkMsg').html("비밀번호가 일치하지 않습니다..");
                $('#chkMsg').css({"color":"red","font-size":"13px"});
        	}
        	if(newPw == newPwChk){
                $('#chkMsg').html("비밀번호가 일치합니다입  니다.")
             $('#chkMsg').css({"color":"blue","font-size":"13px"});
        	}
        	
        }
        
        
        
    </script>
</html>