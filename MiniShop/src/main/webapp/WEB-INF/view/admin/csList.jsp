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
						<th>제목</th>
						<th>글쓴이ID</th>
						<th>문의 일자(등록일)</th>
						<th>담당자명</th>
						<th>처리일</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${csList==null || csList.size() ==0}">
						<tr>
							<td colspan="8">문의건이 존재하지 않습니다!!</td>
						</tr>
					</c:if>
					<c:if test="${csList!=null || csList.size() !=0}">
						<c:forEach var="dto" items="${csList}">
						<tr>
							<td>${dto.cs_no}</td>
							<td>${dto.cs_title}</td>
							<td>${dto.user_id}</td>
							<td>${dto.cs_dt}</td>
							<td>관리자</td>
							<td>${dto.proc_dt}</td>
						
						</tr>
						</c:forEach>				
					</c:if>
				</tbody>
			</table>
</div>
	
					
	<jsp:include page="../include/a_footer.jsp"/>
	

	<script>
	
	//관리자명 검색 시 사번 가져온 후, 사번 입력폼에 대입하는 함수
	
	
	
 $(document).ready(function(){
		var codeNum = '500';
		let str = "";
		
		let roleArea = $("#cs_code"); //권한부여 영역

 		getCommonCode(codeNum, function(data){
 		console.log(data);
 		
 		let list = data;
 		
 		str += ' <option value=ALL>전체</option>'
 		
 		for(let i=0; i<list.length; i++){
 			str += ' <option value=' + list[i].item_cd+ '>'+list[i].item_nm+'</option>'
 		}
 		roleArea.html(str);
 			
 	});
	
	});
	
</script>

</body>
</html>