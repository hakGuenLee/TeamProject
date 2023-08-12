<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 회원 주문/배송/교환/환불 조회 -->


<jsp:include page="../include/a_header.jsp"/>
		<div class="container w-75 mt-5">
			<h3><b>회원 주문/배송 관리</b></h3>
			
			<form action="/orderManager/orderListSearch" method="post">
			  <div class="input-group mb-3 w-25">
				 <input type="text" name="search" class="form-control" placeholder="주문번호 또는 회원 ID로 검색">
			  	<button type="submit" class="btn btn-info">검색</button>	
			  </div>
			</form>

			<p>${Msg}</p>


			<table class="table mt-3">
				<thead class="table-secondary">
					<tr>
						<th>No.</th>					
						<th>주문번호</th>
						<th>주문자ID</th>
						<th>주문일자</th>
						<th style="width:150px">상태</th>	
						<th>주문상태 수정하기</th>
					</tr>
				</thead>
				<tbody>		
				<c:set var="i" value="1"/>
					<c:forEach var="list" items="${list}">				
						<tr>
							<td>${i}</td>
							<td>
							<a href="<c:url value="/orderManager/orderInfo?order_no=${list.order_no}"/>">${list.order_no}</a>
							</td>
							<td>${list.user_id} </td>
							<td>${list.order_dt}</td>
							<td>${list.order_sts}</td>
							<c:set var="i" value="${i+1}"/>
							<td>
 							<button type="button" onclick="statusUpdate(this.value)"  value="${list.order_no}" id="updateBtn"  class="btn btn-secondary" >상태 수정하기</button> 
								
							</td>
							
						</tr>
						</c:forEach>	
				</tbody>
			</table>
<!-- The Modal -->
<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header" id="modalHeader">
        <h4 class="modal-title"><b>주문 상태 변경하기</b></h4>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="modalBody">
      
        변경 항목을 선택하세요 : 
        <select  id="modalArea">
        	<option></option>
        </select>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <a type="button" id="statusUpdate" class="btn btn-danger" data-bs-dismiss="modal">변경하기</a>
      </div>

    </div>
  </div>
</div>

</div>	

<script>


function statusUpdate(a){
	
	$("#myModal").modal("show");
	
	console.log(a);
	
	var codeNum = '300';
	
	var BtnValue = a;

	console.log(codeNum)
	console.log(BtnValue);
	
	
	let str = "";
	let str2 = "";
	let ModalArea = $("#modalArea");
	let modalHeader = $("#modalHeader");
	
	getCommonCode(codeNum, function(data){
	console.log(data);
	let list = data;
	
	for(let i=0; i<list.length; i++){
			str += ' <option id="status" value="' + list[i].item_nm+ '">'+list[i].item_nm+'</option>'		
	}
	
	str2 = '<h4><b>'+BtnValue+'번의 상태 변경</b></h4>'
	
	ModalArea.html(str);
	modalHeader.html(str2);
	
	})
	
	
	
	$("#statusUpdate").on("click", function(){
	
	let status = $("#modalArea").val();
	console.log(status);
	
	$.ajax({
		url: "/orderManager/statusUpdate",
		type: "post",
		data: {"status" : status, "BtnValue" : BtnValue},
		success:function(data) {
			console.log(data)
			let url = "/orderManager/AllOrder";
			location.replace(url);
			
		},
		error: function(request, status, error){
			alert("error code : " + request.status + "\n" + "message:" + request.responseText+"\n"+"error:"+error);
			console.log("실패!")
			
		}
	
	
	
	
	})

})
	
}
	








</script>







			
	<jsp:include page="../include/a_footer.jsp"/>
	