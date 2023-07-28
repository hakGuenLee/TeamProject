<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- <script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/css/summernote/summernote-lite.css"> -->
<!-- 공지사항/팝업 등록 페이지 -->
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
<jsp:include page="../include/a_header.jsp" />


<form action="<c:url value="/post/postRegister"/>" method="post"
enctype="multipart/form-data">
	<div class="container w-50 border shadow-sm p-5 my-5">
			<h2>관리자 공지/팝업 등록</h2>
				 <label for="sel1" class="form-label mt-3 mb-3 w-50">등록구분 ( 공지 / 팝업 ) </label>
			 <select class="form-select" id="pst_gb" name="pst_gb" onchange="gbView()" >
			      <option></option>
			 </select>
			<div class="d-flex">
			<div class="form-floating mb-3 mt-3">
				<input type="text" class="form-control" id="pst_ttl"
					placeholder="제목" name="pst_ttl"> <label for="pst_ttl">제목</label>
			</div>

			<div class="form-floating mt-3 mb-3">
				<input type="text" class="form-control" id="wrt_id"
					placeholder="담당자(글쓴이)" name="wrt_id"> <label for="wrt_id">담당자(글쓴이)</label>
			</div>


			
				<div class="form-floating mt-3 mb-3">
        		<input class="form-control mb-2" type="date" id="strt_ymd" name="strt_ymd" min="now()" max="9999-12-31"
               data-placeholder="게시기간(시작일)" required/>
				</div>

				<div class="form-floating mt-3 mb-3">
 				<input class="form-control mb-2" type="date" id="end_ymd" name="end_ymd" min="now()" max="9999-12-31"
               data-placeholder="게시기간(종료일)" required/>
				</div>
			</div>

		<div>
		<input type="file" class="form-control form-control-sm w-50" 
               name="pst_img" id="pst_img" onchange="preViewImg(this)"/>
               <div id="div-file"><img id="img-tag" /><button id="btn-chk" type="button" class="btn-close border bg-danger" style="display:none; position:relative; left:-24px; top:-30px;" onclick="delInput(this)"></button>
               
               <textarea id="pst_txt" name="pst_txt" class="mt-3" style="width:100%; Height:500px; display:none"></textarea>
               
               </div>
               
               


		</div>

		
		

			<button type="submit" class="btn btn-primary mt-3">승인요청</button>
	</div>
</form>

<script>
/* 	$(document).ready(function() {
		// 여기 아래 부분
		$('#summernote').summernote({
			height : 500, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다', //placeholder 설정
			callbacks: {	//이미지 첨부하는 부분
	               onImageUpload : function(files) {
	                    uploadSummernoteImageFile(files[0],this);
	                }
	            }//cbs

		}); // summernote
	}) // ready function
	
	
	function uploadSummernoteImageFile(file, editor) {
        data = new FormData();
        data.append("file", file);
        $.ajax({
            data : data,
            type : "POST",
            url : "/notice/noticeRegister1",
            contentType : false,
            processData : false,
            success : function(data) {
                //항상 업로드된 파일의 url이 있어야 한다.
                $(editor).summernote('insertImage', data.url);
            }
        });
    } */
	
	
    function gbView(){
    	
    	var gb = $("#pst_gb").val();
    	
    	if(gb=='001'){
    		$("#pst_img").css("display","block")
    		$("#pst_txt").css("display","none")
    	}
    	if(gb=='002'){
    		$("#pst_img").css("display","none")
    		$("#pst_txt").css("display","block")
    	}
	    	
    	
    }
	
	
	
	// 날짜 설정 
	
	
  document.getElementById('strt_ymd').value = new Date().toISOString().substring(0, 10);; // 게시판 설정일 기본값을 오늘날짜로
  document.getElementById('strt_ymd').min = new Date().toISOString().substring(0, 10);; // 게시판 설정일 min 값을 오늘 날짜로
  document.getElementById('end_ymd').min = new Date().toISOString().substring(0, 10);; // 게시판 설정일 min 값을 오늘 날짜로
	
	

  //공통 코드 함수
	
 $(document).ready(function(){
		var codeNum = '100';
		let str = "";
		
		let roleArea = $("#pst_gb"); //권한부여 영역

 		getCommonCode(codeNum, function(data){
 		console.log(data);
 		
 		let list = data;
 		
 		for(let i=0; i<list.length; i++){
 			str += ' <option value=' + list[i].item_cd+ '>'+list[i].item_nm+'</option>'
 		}
 		
 		roleArea.html(str);
 			
 	});
	
});

 function preViewImg(obj){
	    console.log(obj.files)
	    
	    var imgTag = document.getElementById("img-tag");
	    var btnTag = document.getElementById("btn-chk");
	    
	    console.log(imgTag);
	    console.log(btnTag);
	    
	    if(obj.files && obj.files[0]){
	       var fileReader = new FileReader(); // js의 라이브러리
	       
	       // fileReader.onload는 파일을 성공적으로 읽었을 때 발생하는 이벤트
	       fileReader.onload = function(e){            
	          imgTag.width=100;
	          imgTag.height=100;
	          // e.target(이벤트가 발생한 대상) == fileReader
	          imgTag.src = e.target.result; // 파일을 읽어온 결과값(바이너리)
	          btnTag.style.display="";// button 보이게함.
	          imgTag.style.display="";
	       }
	       // 파일의 종류를 크게 두가지로 분류
	       // i) 바이너리 파일 : 데이터를 있는 그대로 읽고 쓰는 파일
	       // ii) 텍스트 파일 : 데이터를 문자로 변환한 파일
	       
	       // Base64(2^6)는 binary Data를 텍스트로 손실없이 안전하게 인코딩하는 방식
	       // 바이너리 데이터의 훼손없이 정확하게 데이터를 전달할 수 있음.
	       
	       // 바이너리 파일을 base64형식으로 변환해줌
	       fileReader.readAsDataURL(obj.files[0]);
	    }
	 }
	 
	function delInput(){
	    	var imgTag = document.getElementById("img-tag");
		    var inputTag = document.getElementById("input-tag");
		    var btnTag = document.getElementById("btn-chk");
		  
		  console.log(imgTag);
		  console.log(inputTag);
		  
		  inputTag.value="";
		  //inputTag.style.display="none";
		  imgTag.src="";
		  imgTag.style.display="none";
		  btnTag.style.display="none";
	}
	

</script>
<jsp:include page="../include/a_footer.jsp" />


</body>
</html>