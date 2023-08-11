<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 카테고리 등록 페이지 -->

<jsp:include page="../include/a_header.jsp"/>

	<div class="container w-50 mt-5">
	<form action="<c:url value="/category/catRegister"/>" method="post">
		<h3><b>카테고리 등록</b></h3>
		<div class="mt-3">
			<p style="color:tomato">모든 내용은 공백 없이 입력 바랍니다.</p>
			<input type="text"  placeholder="카테고리1   ex)A100" class="catInput form-control w-50 mb-3" name="ct_cd1">
			 <p id="chkMsg" class="mb-2"></p>
		
			
			<input type="text"  placeholder="이름1        ex)과일" class="catName form-control w-50 mb-3" name="ct_nm1"/>
			 <p id="chkMsg1" class="mb-2"></p>
		
			
			<input type="text"  placeholder="순번1        ex)1" class="catSeq form-control w-50 mb-3" name="ct_seq1"/>
			 <p id="chkMsg2" class="mb-2"></p>
			
			<input type="text"  placeholder="카테고리2   ex)A100001" class="categoryTwo form-control w-50 mb-3" name="ct_cd2"/>
			 <p id="chkMsg3" class="mb-2"></p>
			
			<input type="text"  placeholder="이름2        ex)복숭아" class="secondName form-control w-50 mb-3" name="ct_nm2"/>
			<p id="chkMsg4" class="mb-2"></p>
			
			<input type="text"  placeholder="순번2        ex)1" class="catSeq2 form-control w-50 mb-3" name="ct_seq2"/>
			<p id="chkMsg5" class="mb-2"></p>
		</div>
		<div class="mt-3">
			<input id="submitBtn" type="submit" class="btn btn-info" value="등록">			
			<a href="<c:url value="/category/catList"/>" class="btn btn-secondary">리스트</a>
			
		</div>
		</form>
	</div>				



<script>

/* function catInputCheck(){
	let catInput = $(".catInput").val();
	console.log(catInput);
	if(catInput == 0){
		$("#chkMsg").html("카테고리를 입력해주세요!");
		$("#chkMsg").css({"color":"red","font-size":"13px"});
		$("#submitBtn").on("click", function(){
			alert("카테고리를 입력해주세요!")
			$("#submitBtn").attr("type", "button");
		})
	}else{
		$("#chkMsg").html(" ");
		$("#submitBtn").on("click", function(){
			alert("카테고리 등록 완료!")
			$("#submitBtn").attr("type", "submit");
		})
	}
} */



</script>


					
<jsp:include page="../include/a_footer.jsp"/>
	