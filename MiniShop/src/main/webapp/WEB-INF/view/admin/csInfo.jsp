<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 1:1문의 상세보기 -->

<jsp:include page="../include/a_header.jsp"/>
		<div class="container w-75 mt-5">
			<form action="csList" method="post">
			<div class="d-flex justify-content-around">
				<div>
				<h3><b>고객문의(1:1)상세</b></h3>
				 
				 <div class="form-group">
			         <label for="cs_code">문의유형</label>
			         <input type="text" class="form-control" id="cs_code" 
			            name="cs_code" disabled value="${csDto.item_nm}"/>
			    </div>
			 
				<div class="form-group">
			         <label for="cs_no">번호</label>
			         <input type="text" class="form-control" id="cs_no" 
			            name="cs_no" disabled value="${csDto.cs_no}"/>
			    </div>
			    <div class="form-group">
			         <label for="cs_title">제목</label>
			         <input type="text" class="form-control" id="cs_title" 
			            name="cs_title" disabled value="${csDto.cs_title}"/>
			    </div>
			    <div class="form-group">
			         <label for="user_id">글쓴이</label>
			         <input type="text" class="form-control" id="user_id" 
			            name="user_id" disabled value="${csDto.user_id}"/>
			    </div>
			    <div class="form-group">
			         <label for="cs_dt">등록일</label>
			         <input type="text" class="form-control" id="cs_dt" 
			            name="cs_dt" disabled value="${csDto.cs_dt}"/>
			    </div>
			    <div class="form-group">
			         <label for="cs_con">내용</label>
			         <input type="text" class="form-control" id="cs_con" 
			            name="cs_con" disabled value="${csDto.cs_con}"/>
			    </div>
			
			  	<div>
			  		 <label for="csre_con">답글쓰기</label>
			         <textarea id="csre_con" name="csre_con" rows="5" cols="33" value="${csDto.csre_con}">
					</textarea>
					
					<div class="form-group">
			         <label for="proc_id">처리자</label>
			         <input type="text" class="form-control" id="proc_id" 
			            name="proc_id" disabled value="${csDto.proc_id}"/>
			    	</div>
			        <div class="form-group">
			         <label for="proc_dt">처리일시</label>
			         <input type="text" class="form-control" id="proc_dt" 
			            name="proc_dt" disabled value="${csDto.proc_dt}"/>
			    	</div>
					
			  		<a input type='submit' href="<c:url value="/customer/csList?csre_con=${csDto.csre_con}"/>" class="btn btn-primary">답글등록</a>
			  		<a href="<c:url value="/customer/csList"/>" class="btn btn-primary">답글수정</a>
			  	</div>
			</div>
			</form>
		</div>

					
<jsp:include page="../include/a_footer.jsp"/>
	
	

</body>
</html>