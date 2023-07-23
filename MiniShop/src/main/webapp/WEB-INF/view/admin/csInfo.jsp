<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 1:1문의 상세보기 -->

<jsp:include page="../include/a_header.jsp"/>
		<div class="container w-75 mt-5">
			<form action="" method="post">
			<div class="d-flex justify-content-around">
				<div>
				<h3><b>고객문의(1:1)상세</b></h3>
				<div class="input-group mb-3">
				  <input type="text" class="form-control" aria-label="Text input with dropdown button" value="카테고리">
				  <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">문의내용</button>
				  <ul class="dropdown-menu dropdown-menu-end">
				    <li><a class="dropdown-item" href="#">Action</a></li>
				    <li><a class="dropdown-item" href="#">Another action</a></li>
				    <li><a class="dropdown-item" href="#">Something else here</a></li>
				    <li><hr class="dropdown-divider"></li>
				    <li><a class="dropdown-item" href="#">Separated link</a></li>
				  </ul>
				</div>
			
				  <input type="text" class="form-control" placeholder="제목">
				  <input type="text" class="form-control" placeholder="글쓴이">
				  <input type="text" class="form-control" placeholder="등록일">
				  <input type="text" class="form-control" placeholder="내용">
			  	</div>
			  	<div>
			  		<a href="" class="btn btn-primary">답글쓰기</a>
			  		<input type="text" class="form-control w-50 h-50" placeholder="내용">
			  	</div>
			</div>
			</form>
		</div>
	
					
<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>