<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 1:1문의 등록 페이지-->

<jsp:include page="../include/header.jsp"/>

<!-- <div class="container w-50 border shadow-sm p-5 mt-5"> -->
<div class="container w-50 mt-5 p-5 shadow">

<form action="question" method="post">
<input type="hidden" value="${csDto.cs_no}" name="cs_no"/>
  
   <h4>1:1문의하기</h4>
   
   <input class="form-control" type="text" id="cs_title" name="cs_title" value="{csDto.cs_title}" placeholder="제목을 입력하세요" autofocus>      
   
   <textarea class="form-control mt-2" name="cs_con" id="cs_con" value="{csDto.cs_title}" rows="5" cols="33" placeholder="내용을 입력하세요"></textarea>
   
   <input class="form-control mt-2" type="text" id="user_id" name="user_id" value="${}" placeholder="이름을 입력하세요">
   
   <div class="text-center mt-3">
      <button class="btn btn-primary">등록</button>   
   </div>
</form>
</div>

					
<jsp:include page="../include/footer.jsp"/>
	
	
</body>
</html>