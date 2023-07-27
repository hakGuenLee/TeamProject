<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- <script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/css/summernote/summernote-lite.css"> -->
<!-- 공지사항/팝업 등록 페이지 -->

<jsp:include page="../include/a_header.jsp"/>
	
	<h2>관리자 공지사항 등록</h2>
	
	<form action="#" method="post">
		<div class="d-flex container w-50 border shadow-sm p-5 my-5">
			<div>
				<div class="d-flex">
				<p>등록 구분</p>
			   <div class="form-check">
			      <input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked>
			      <label class="form-check-label" for="radio1">공지사항</label>
    			</div>
				<div class="form-check">
				   <input type="radio" class="form-check-input" id="radio2" name="optradio" value="option2">
				   <label class="form-check-label" for="radio2">팝업</label>
				</div>
				</div>
				
				<div class="form-floating mb-3 mt-3">
					  <input type="text" class="form-control w-50" id="pst_ttl" placeholder="제목" name="pst_ttl">
					  <label for="pst_ttl">제목</label>
				</div>

				<div class="form-floating mt-3 mb-3">
					  <input type="text" class="form-control w-50" id="wrt_id" placeholder="담당자(글쓴이)" name="wrt_id">
					  <label for="wrt_id">담당자(글쓴이)</label>
				</div>
				
				<div class="d-flex">
					<div class="form-floating mt-3 mb-3">
						  <input type="text" class="form-control w-50" id="strt_ymd" placeholder="게시기간(시작일)" name="strt_ymd">
						  <label for="strt_ymd">게시기간(시작일)</label>
					</div>
					<p>~</p>
					<div class="form-floating mt-3 mb-3">
						  <input type="text" class="form-control w-50" id="end_ymd" placeholder="게시 종료일" name="end_ymd">
						  <label for="end_ymd">게시기간(종료일)</label>
					</div>
				
				</div>						
				<div class="container mt-3">
					  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#myModal">
					    승인자 지정(검색)
					  </button>
				</div>
			
					<!-- The Modal -->
					<div class="modal fade" id="myModal">
					  <div class="modal-dialog">
					    <div class="modal-content">
					
					      <!-- Modal Header -->
					      <div class="modal-header">
					        <h4 class="modal-title">승인자 검색</h4>
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
					<div class="form-floating mt-3 mb-3">
						  <input type="text" class="form-control w-50" id="proc_dt" placeholder="등록일" name="proc_dt">
						  <label for="proc_dt">등록일</label>
					</div>
					<div class="form-floating mt-3 mb-3">
						  <input type="text" class="form-control w-50" id="mod_dt" placeholder="수정일" name="mod_dt">
						  <label for="mod_dt">수정일</label>
					</div>
			</div>
			<div>
			<p>본문</p>
			<textarea id="summernote" name="editordata"></textarea>
			<a href="#" class="btn btn-secondary">저장</a>
			<a href="#" class="btn btn-primary">승인요청</a>
					
			</div>
	
		</div>
	</form>
	<script>
/*  	$(document).ready(function() {
		//여기 아래 부분
		$('#summernote').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	          
		});
	})  */
 	$(document).ready(function() {		
 	$('#summernote').summernote({
		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			height: 300
	  });
	
	}) 
	</script>
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>