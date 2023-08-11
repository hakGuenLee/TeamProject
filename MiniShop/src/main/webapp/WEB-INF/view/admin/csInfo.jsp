<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- 1:1문의 상세보기 -->

<jsp:include page="../include/a_header.jsp"/>

		<div class="container w-75 mt-5">
			<form action="csReply" method="post">
				<input type="hidden" value="${csDto.cs_no}" name="cs_no"/>
				<input type="hidden" value="${csDto.proc_sts}" name="prev_sts"/>
				<input type="hidden" value="2" name="proc_sts"/>
			
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
				         <label for="cs_ttl">제목</label>
				         <input type="text" class="form-control" id="cs_ttl" 
				            name="cs_ttl" disabled value="${csDto.cs_ttl}"/>
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
				
				  	<div class="form-group">
				         <label for="csre_con">답글쓰기</label>
				         <textarea class="form-control" id="csre_con" 
		           		 	name="csre_con" rows="5" cols="33">
			           		 <c:if test="${param.proc_sts == 2 }">
			           		 	<c:out value="${csDto.csre_con}"/>
			           		 </c:if>
		           		 </textarea>
		      		</div>
				       
					
						<div class="form-group">
				         <label for="proc_id">처리자</label>
				         <input type="text" class="form-control" id="proc_id" 
				            name="proc_id" readonly value="<sec:authentication property="principal"/>"/>
				    	</div>
				    <c:if test="${param.proc_sts != 1}">	
				        <div class="form-group">
				         <label for="sts_dt">처리일시</label>
				         <input type="text" class="form-control" id="sts_dt" 
				            name="sts_dt" readonly value="${csDto.sts_dt}"/>
				    	</div>
					</c:if>
					
		  		    <div class="form-group mt-4">
		  		    <c:if test="${param.proc_sts == 1}">
			         <button type="submit" id="btn-register" class="btn btn-primary me-2">답글등록</button>
			        </c:if> 
			        <c:if test="${param.proc_sts != 1}">
			         <button type="submit" id="btn-modify" class="btn btn-danger me-2">답글수정</button>
			         </c:if>
			         <button type="button" id="btn-list" class="btn btn-primary">리스트</button>
			        </div>
			        
			  	</div>
			</div>
		</form>
	</div>

<script>
	$("#btn-list").click(()=>{
/*       location.href="<c:url value='/board/list.do?viewPage=${pDto.viewPage}&cntPerPage=${pDto.cntPerPage}&searchType=${pDto.searchType}&keyWord=${pDto.keyWord}'/>"; */
	     location.href="<c:url value='/customer/csList'/>";
   });
   $("#btn-remove").click(()=>{
      location.href="<c:url value='/board/remove.do?bid=${dto.bid}&cntPerPage=${pDto.cntPerPage}&searchType=${pDto.searchType}&keyWord=${pDto.keyWord}'/>";
   });
</script>

					
<jsp:include page="../include/a_footer.jsp"/>
	
	

</body>
</html>