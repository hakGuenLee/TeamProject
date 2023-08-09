<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 나의 배송지 관리 -->

<jsp:include page="../include/header.jsp" />

<c:if test="${warning !=null }">
	<a href="javascript:alert(${warning})"></a>
</c:if>

		<div class="container w-75 mt-5">
			<div class="d-flex">
			<h3><b>배송지 리스트</b></h3>
			</div>
			<table class="table mt-3">
				<thead class="table-secondary">
					<tr>
						<th>선택</th>	
						<th>No.</th>															
						<th>기본배송지 여부</th>
						<th>기본주소</th>
						<th>상세주소</th>
						<th>우편번호</th>
						<th>받는사람</th>
						<th>연락처</th>
						<th>별칭</th>
						<th>등록일자</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach items="${list}" var="dto">				
					<tr>
						<td><input type="checkbox" name="checkBox" onclick="checkOne(this)" value="${dto.addr_no}"></td>
						<td>${dto.addr_no}</td>										
						<td>${dto.addr_gb}</td>
						<td>${dto.addr}</td>
						<td>${dto.addr_detail}</td>
						<td>${dto.zipcode}</td>
						<td>${dto.addr_nm}</td>
						<td>${dto.addr_tel}</td>
						<td>${dto.addr_nik}</td>
						<td>${dto.addr_dt}</td>
						<td><a href="<c:url value="/myPage/addressUpdate?no=${dto.addr_no}"/>" class="btn btn-info">수정</a></td>
						<td><a href="<c:url value="/myPage/addressDelete?no=${dto.addr_no}"/>" class="btn btn-dark">삭제</a></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="d-flex">
				<div>			
				<button class="btn btn-primary" onclick="addressUpdate()">기본 배송지로 설정</button>
				</div>
				<div>
				<a href="/myPage/myAddressInput" class="btn btn-warning" style="margin-left:20px">배송지 추가하기</a>
				</div>
				<div>
				<p style="color:gray; font-size:15px; margin-left:10px">배송지는 3개 이상 등록할 수 없습니다.</p>
				</div>
			</div>
		</div>

<script>

function checkOne(element){
	
	const checkboxes = document.getElementsByName('checkBox');
	let checkedCount = 0;
	
	for(let i=0; 0<checkboxes.length; i++){
		if(checkboxes[i].checked){
			checkedCount++;
			if(checkboxes[i] !== element){
				checkboxes[i].checked = false;
			}
		}
	}
	
	if(checkedCount == 0){
		element.checked = true;
	}
}

function addressUpdate(){
	
	$("input:checkbox[name=checkBox]:checked").each(function(){
		var checkVal = $(this).val();
		console.log("주소지 번호 값 " + checkVal);
		
		defaultAddressSetup(checkVal);

	})
	
	
	
}




</script>


<jsp:include page="../include/footer.jsp" />
