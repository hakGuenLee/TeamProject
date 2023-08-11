<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 1:1문의 리스트 -->

<jsp:include page="../include/a_header.jsp"/>


<div class="container w-75 mt-5">
<h3><b>고객(1:1)문의 리스트</b></h3>
<form id="searchForm" method="post" action="csList">

		<div class="d-flex justify-content-center">
					  
			 <label for="sel1" class="form-label  m-3">문의유형 선택</label><%-- ${search_cd} --%>
			 
			 <select class="form-select w-50 m-3" id="cs_code" name="cs_code">
			      <option></option>
			 </select>
	 		 <input type='radio' name='proc_sts' value='proc_all' ${search_sts == "proc_all" ? 'checked':'' } />전체
             <input type='radio' name='proc_sts' value='1'  ${search_sts == "1" ? 'checked':'' } />미처리
             <input type='radio' name='proc_sts' value='2'  ${search_sts == "2" ? 'checked':'' } />처리
	 			
	 		<button class="btn btn-succes" style="background:#138499; color:white"><i class="fa fa-search"></i></button>
		</div>
		
</form>
	
			<table class="table mt-3">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>
						<th>문의유형</th>					
						<th>제목</th>
						<th>글쓴이ID</th>
						<th>문의 일자(등록일)</th>
						<%-- <c:if test="${search_sts == '2'}"> --%>
						<th>담당자명</th>
						<th>처리일</th>
						<%-- </c:if> --%> 
						<th>상세</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${csList==null || csList.size() ==0}">						
						<tr>
							<td colspan="8">문의건이 존재하지 않습니다!!</td>
						</tr>
					</c:if>
					<c:set var="cnt" value="0"/>
					<c:if test="${csList!=null || csList.size() !=0}">
					<c:set var="cnt" value="${cnt + 1}"/>
						<script>
							alert("${csList.size()}");						
						</script>
						<c:forEach var="dto" items="${csList}">
						<tr>
							<td>${dto.cs_no}</td>
							<%-- <td>${item_nm}</td> --%>
							<td>${dto.item_nm}</td>
							<td>${dto.cs_ttl}</td>
							<td>${dto.user_id}</td>
							<td>${dto.cs_dt}</td>
							<%-- <c:if test="${search_sts != '1'}"> --%>
								<td>${dto.proc_id}</td>
								<%-- <td>${dto.proc_dt}</td> --%>
								<td>${(null != dto.sts_dt) ? dto.sts_dt : ''}</td>
							<%-- </c:if> --%> 
							<td><a href="<c:url value="/customer/csInfo?cs_no=${dto.cs_no}&cs_code=${dto.cs_code}&proc_sts=${dto.proc_sts}"/>" class="btn btn-primary">상세</a></td>
						
						</tr>
						</c:forEach>				
					</c:if>
				</tbody>
			</table>
</div>

<!-- <div> -->
 	<ul class="pagination justify-content-center my-5">
		<li class="page-item ${pageDTO.prevPage <= 0 ? 'disabled' : ''}">
			<a class="page-link" href="<c:url value="/customer/csList?viewPage=${pageDTO.prevPage}&cntPerPage=${pageDTO.cntPerPage}"/>">이전</a>
		</li>
	
		<c:forEach var="i" begin="${pageDTO.blockStart}" end="${pageDTO.blockEnd}">
			<li class="page-item ${pageDTO.viewPage == i ? 'active' : ''}">
				<a class="page-link" href="<c:url value="/customer/csList?viewPage=${i}&cntPerPage=${pageDTO.cntPerPage}&cs_no=${dto.cs_no}&cs_code=${dto.cs_code}&proc_sts=${dto.proc_sts}"/>">${i}</a>
			</li>
		</c:forEach>
	
		<li class="page-item ${pageDTO.blockEnd >= pageDTO.totalPage ? 'disabled' : ''}">
			<a class="page-link" href="<c:url value="/customer/csList?viewPage=${pageDTO.nextPage}&cntPerPage=${pageDTO.cntPerPage}"/>">다음</a>
		</li>
	</ul>
</div> 
	
					
	<jsp:include page="../include/a_footer.jsp"/>
	

	<script>
	
	//관리자명 검색 시 사번 가져온 후, 사번 입력폼에 대입하는 함수
	
	
	
  $(document).ready(function(){
  	  let qaType= "";	
      var codeNum = '500';
      let str = "";
      
      let roleArea = $("#cs_code"); //권한부여 영역

       getCommonCode(codeNum, function(data){
       console.log(data);
       
       let list = data;
       let selected = "";
       
       str += ' <option value=ALL>전체</option>'

       for(let i=1; i<list.length; i++){          
         console.log('${search_cd}' +","+list[i].item_cd);
         
          if('${search_cd}' == list[i].item_cd){
               selected = "selected";               
               console.log("문의유형 : " + list[i].item_nm);
               qaType = list[i].item_nm;
               console.log("qaType----- : "+ qaType);
               console.log("타입 : " + typeof(qaType));
               /* document.querySelector(".qaType").innerHtml=; */
               
         }else{
             selected = "";
         } 
           str += " <option value='" + list[i].item_cd+"' "+selected + ">";
          str += list[i].item_nm+"</option>"; 
          
          
          console.log(str);
       
       }
              
       roleArea.html(str);
          
    });
   
   });

	
</script>

</body>
</html>