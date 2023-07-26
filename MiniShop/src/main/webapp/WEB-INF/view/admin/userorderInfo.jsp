<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 상품 QnA 상세보기 -->

<jsp:include page="../include/a_header.jsp"/>

		<div class="container w-75 mt-5">
			<form action="" method="post">
			<div class="d-flex justify-content-around">
				<div>
				<h3><b>회원 주문/배송 상세 조회</b></h3>
				
				  <input type="text" class="form-control" value="주문번호">
				 
				 <table class="table mt-3">
					<thead class="table-secondary">
						<tr>
							<th>No.</th>					
							<th>상품명</th>
							<th>금액</th>
							<th>적립금</th>
							<th>상태</th>
							<th>처리일</th>
						</tr>
					</thead>
					<tbody>				
						<tr>
							<td></td>
							<td><a></a></td>
							<td><a></a></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
					<div class="d-flex"> 
						<div>			
							  <input type="text" class="form-control" placeholder="휴대폰 번호">
							  <input type="text" class="form-control" placeholder="배송지 주소">
							  <input type="text" class="form-control" placeholder="주문일자">
							 <div class="input-group mb-3">
								  <input type="text" class="form-control" aria-label="Text input with dropdown button" value="">
								  <button class="btn btn-outline-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">상태변경</button>
								  <ul class="dropdown-menu dropdown-menu-end">
								    <li><a class="dropdown-item" href="#">결제완료</a></li>
								    <li><a class="dropdown-item" href="#">상품준비중</a></li>
								    <li><a class="dropdown-item" href="#">배송중</a></li>
								    <li><a class="dropdown-item" href="#">배송완료</a></li>
								  </ul>
							 </div>
						 </div>
						 <div class="d-flex">						 
							<div>
							   <input type="text" class="form-control" placeholder="담당자 메모(처리내역)">
							</div>
							<div>
							  <a href="" class="btn btn-primary">저장</a>
							</div>
						</div>	
					</div>
			  	</div>
			  	<div>
			  	</div>
			</div>
			</form>
		</div>
					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>