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
   <input class="form-control mb-3" type="text"value="${csDTO.cs_ttl}" readonly>      
   
   <p>내용</p>
   <textarea class="form-control mt-2"rows="5" cols="33" readonly>${csDTO.cs_con}</textarea>
	
	<p>답변 내용</p>
   <textarea class="form-control mt-2"rows="5" cols="33" readonly>${csDTO.csre_con}</textarea>
	<c:if test="${csDTO.csre_con == null }">
	 <textarea class="form-control mt-2"rows="5" cols="33" readonly>현재 담당자가 처리 중입니다. 빠른 시일 내에 안내드리겠습니다.</textarea>
	</c:if>


   <p>담당자명</p>
   <input class="form-control mb-3" type="text" value="${csDTO.proc_id}" readonly>      
   
   <p>처리일자</p>
   <input class="form-control mb-3" type="text" value="${csDTO.proc_dt}" readonly>  
   <c:if test="${csDTO.csre_con == null }">
	  <input class="form-control mb-3" type="text" value="처리 중" readonly>  
	</c:if>

   
   <div class="text-center mt-3">
      <a href="javaScript:history.back()" class="btn btn-primary">이전</a>
      <a href="<c:url value="/"/>"  class="btn btn-primary">홈</a>
   </div>
</form>
</div>

					
<jsp:include page="../include/footer.jsp"/>
	
	
</body>
</html>