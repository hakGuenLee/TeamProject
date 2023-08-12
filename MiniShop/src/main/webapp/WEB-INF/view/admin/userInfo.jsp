<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- 1:1문의 상세보기 -->

<jsp:include page="../include/a_header.jsp"/>

		<div class="container w-75 mt-5">
			<form action="/admin/userInfoUpdate" method="post">
				<input type="hidden" value="${csDto.cs_no}" name="cs_no"/>
				<input type="hidden" value="${csDto.proc_sts}" name="prev_sts"/>
				<input type="hidden" value="2" name="proc_sts"/>
			
			<div class="d-flex justify-content-around">
				<div>
					<h3>${userInfo.user_nm}님의 정보 상세보기</h3>
					 
				 
					<div class="form-group">
				         <label for="user_no">회원 번호</label>
				         <input type="text" class="form-control" id="user_no" 
				            name="user_no" readonly value="${userInfo.user_no}"/>
				    </div>
				    <div class="form-group">
				         <label for="user_nm">회원명</label>
				         <input type="text" class="form-control" id="user_nm" 
				            name="user_nm" readonly value="${userInfo.user_nm}"/>
				    </div>
				    <div class="form-group">
				         <label for="user_id">회원아이디</label>
				         <input type="text" class="form-control" id="user_id" 
				            name="user_id" readonly value="${userInfo.user_id}"/>				            
				    </div>
				    <div class="form-group">
				         <label for="user_email">이메일</label>
				         <input type="text" class="form-control" id="user_email" 
				            name="user_email" value="${userInfo.user_email}"/>
				    </div>
				    
				    
				    <div class="row mb-2 mt-3">
						<div class="col-md-6">
							<input class="form-control mb-2" type="text" id="sample4_postcode"
								name="zipcode" value="${userInfo.zipcode }" placeholder="우편번호" readonly>
						</div>
						<div class="col-md-6 p-0 ps-2">
							<a class="btn btn-sm btn-outline-secondary p-2" onclick="sample4_execDaumPostcode()">우편번호 찾기</a><br>
						</div>
					</div>
				<input class="form-control mb-2 w-100" type="text" value="${userInfo.addr_road}" name="addr_road" id="sample4_roadAddress" placeholder="도로명주소" readonly> 
				<input class="form-control mb-2 w-100" type="text" value="${userInfo.addr}" name="addr" id="sample4_jibunAddress" placeholder="지번주소" readonly>

				<input class="form-control mb-2 w-100" type="text" value="${userInfo.addr_detail}" id="sample4_detailAddress" name="addr_detail" placeholder="상세주소">				  
					
		  		    <div class="form-group mt-4">

			         <button type="submit" id="btn-modify" class="btn btn-danger me-2">정보 수정하기</button>
			         <button type="button" id="btn-list" class="btn btn-primary">회원 리스트</button>
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