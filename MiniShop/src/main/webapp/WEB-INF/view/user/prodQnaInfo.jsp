<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 1:1문의 등록 페이지-->

<jsp:include page="../include/header.jsp"/>

<!-- <div class="container w-50 border shadow-sm p-5 mt-5"> -->
<div class="container w-50 mt-5 p-5 shadow">

<form action="question" method="post">
<input type="hidden" value="${csDTO.cs_no}" name="cs_no"/>
  
   <h4>문의 내용</h4>
   
   <p>제목</p>
   <input class="form-control mb-3" type="text"value="${qnaDTO.qna_ttl}" readonly>      
   
   <p>내용</p>
   <textarea class="form-control mt-2" rows="5" cols="33" readonly>${qnaDTO.qna_con}</textarea>
   
   
   <div class="text-center mt-3">
      <a href="javaScript:history.back()" class="btn btn-primary">이전</a>
      <a href="<c:url value="/"/>"  class="btn btn-primary">홈</a>
   </div>
</form>
</div>

					
<jsp:include page="../include/footer.jsp"/>
	
	
</body>
</html>