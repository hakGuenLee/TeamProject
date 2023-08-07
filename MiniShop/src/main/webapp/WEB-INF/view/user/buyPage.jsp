<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<jsp:include page="../include/header.jsp" />

<div class="container mt-5 d-flex flex-direction-column">
	<section class="w-75 ps-5 m-auto">
		<h2 class="mb-5">주문 / 결제</h2>
		<table class="table ms-5">
			<thead>
				<tr>
					<th>이미지</th>
					<th>상품명</th>
					<th>수량</th>
					<th>가격</th>
					<th>합계</th>
				</tr>
			</thead>

			<tbody>
				<c:set var="cartTotPrice" value="0" />
				<c:set var="cartTotPoint" value="0" />

				<c:if test="${list==null || list.size()== 0}">
					<tr>
						<td colspan="6">장바구니가 비어있습니다.</td>
					</tr>
				</c:if>
				<c:if test="${list!=null || list.size()!= 0}">

					<c:set var="totPrice" value="0" />
					<c:set var="cartTotPrice" value="0" />

					<c:forEach var="dto" items="${list}">
						<tr>

							<td><a href=""> <img
									src="<c:url value="/resources/upload/${dto.main_img}"/>"
									style="width: 60px; height: 60px" />
							</a></td>
							<td>${dto.prod_nm}</td>
							<td>
								<form action="/cart/updateQty?no=${dto.cart_no}" method="post">
									<input type="text" size="3" name="pqty" value="${dto.qty }" />
									<input type="submit" class="btn btn-sm btn-outline-secondary"
										value="수정" />
								</form>
							</td>
							<td>가격 : <fmt:formatNumber value="${dto.price}" /> 원 </br>
							</td>
							<c:set var="totPrice" value="${dto.price * dto.qty}" />
							<td><fmt:formatNumber value="${totPrice}" /> 원</br> <c:set
									var="cartTotPrice" value="${cartTotPrice + totPrice }" />
							<td><a href="<c:url value="orderDelete?no=${dto.cart_no}"/>"
								class="btn btn-sm btn-danger">삭제</a></td>
						</tr>


					</c:forEach>
				</c:if>

			</tbody>
		</table>

		<div class="text-center">
			장바구니 총액 :
			<fmt:formatNumber value="${cartTotPrice }" />
			원<br /> 총 포인트 :
			<fmt:formatNumber value="${cartTotPoint }" />
			포인트
		</div>

		<table class="table">
			<thead>
				<tr>
					<th>구매자 정보</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>이름</td>
					<td>${mDto.name }</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${mDto.email }</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${mDto.tel }</td>
				</tr>
				<tr>
					<td><b>받는사람 정보</b></td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${mDto.name }</td>
				</tr>
				<tr>
					<td>배송지 주소</td>
					<td>${mDto.road_addr }</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td>${mDto.tel }</td>
				</tr>
				<tr>
					<td><b>결제정보</b></td>
				</tr>
				<tr>
					<td>총 주문금액</td>
					<td><fmt:formatNumber value="${cartTotPrice }" />원</td>
				</tr>
				<tr>
					<td>포인트</td>
					<td><input type="text" id="point" size="10"
						oninput="removeChar(event)" /> <input type="checkbox" id="use"
						onclick="usePoint(this, ${cartTotPoint}, ${cartTotPrice})" /> <label
						for="use"> 전액사용 [ <fmt:formatNumber
								value="${cartTotPoint }" />원]
					</label></td>
				</tr>

				<tr>
					<td>결제금액</td>
					<td id="cartTotPrice"><fmt:formatNumber
							value="${cartTotPrice }" />원</td>
				</tr>

				<tr>
					<td>결제방법</td>
					<td><label><input type="radio" name="payment"
							value="card" checked onclick="selPayment()" />신용카드</label> <label><input
							type="radio" name="payment" value="rTransfer"
							onclick="selPayment()" />실시간 계좌이체</label> <label><input
							type="radio" name="payment" value="deposit"
							onclick="selPayment()" />무통장 입금</label> <label><input
							type="radio" name="payment" value="hp" onclick="selPayment()" />휴대폰</label>
					</td>
				</tr>
			</tbody>
		</table>

		<div id="card">
			카드선택 : <select>
				<option value="" selected>카드사 선택</option>
				<option value="samsung">삼성카드</option>
				<option value="shinhancard">신한카드</option>
				<option value="lotte">롯데카드</option>
				<option value="bc">비씨카드</option>
				<option value="hyundai">현대카드</option>
			</select><br /> <br /> 할부기간 : <select
				<c:if test="${cartTotPrice<50000 }">disabled</c:if>>
				<option value="1" selected>일시불</option>
				<option value="2">2개월 무이자할부</option>
				<option value="3">3개월 무이자할부</option>
				<option value="4">4개월 무이자할부</option>
				<option value="5">5개월 무이자할부</option>
				<option value="6">6개월 무이자할부</option>
			</select><br /> <br />
		</div>
		<div id="rTransfer" style="display: none">
			은행선택 : <select>
				<option value="" selected>은행선택</option>
				<option value="kakao">카카오뱅크</option>
				<option value="woori">우리은행</option>
				<option value="kookmin">국민은행</option>
				<option value="shinhan">신한은행</option>
			</select>
		</div>
		<div id="deposit" style="display: none">
			입금은행 : <select>
				<option value="" selected>은행선택</option>
				<option value="kakao">카카오뱅크</option>
				<option value="woori">우리은행</option>
				<option value="kookmin">국민은행</option>
				<option value="shinhan">신한은행</option>
			</select>
			<ul style="font-size: 11px">
				<li>무통장 입금시 유의사항</li>
				<li>입금완료 후 상품품절로 인해 자동취소된 상품은 환불 처리해 드립니다.</li>
				<li>무통장입금 결제 시 부분취소가 불가하며 전체취소 후 다시 주문하시기 바랍니다.</li>
				<li>은행 이체 수수료가 발생될 수 있습니다. 입금시 수수료를 확인해주세요.</li>
			</ul>
		</div>
		<div id="hp" style="display: none">
			통신사 : <select>
				<option value="" selected>선택</option>
				<option value="skt">SK</option>
				<option value="lg">LG U+</option>
				<option value="kt">KT</option>
			</select>
		</div>
		<div class="text-center">
			<button class="btn btn-primary">결제하기</button>
			<a href="<c:url value="/" />" class="btn btn-outline-primary">계속
				쇼핑하기</a>
		</div>
	</section>
</div>

<script>
   function checkAll(){
	    let isChecked = document.getElementById("checkAll").checked;

	    let chks = document.getElementsByName('cnum');

	    for(let i=0; i<chks.length; i++){
	      chks[i].checked = isChecked;
	    }
	 }
	 
	 function prodDel(){
		 let chks = document.getElementsByName('cnum');
		 
		 let prodNumStr = "";
		 let separator=false;
		 for(let i=0; i<chks.length; i++){
			if(chks[i].checked){
				if(separator){
					prodNumStr += '/';
				}
				prodNumStr += chks[i].value;
				
				separator = true;
			}
		 }
		 
		 if(!prodNumStr){  //js null : 거짓
			 alert("삭제할 상품을 체크하세요!!");
			 return;
		 }
		 //삭제할 상품번호(예: 7/9/..) 문자열로 묶어서 input에 저장
		 document.cartForm.delProdNums.value = prodNumStr;
		 
		 console.log(prodNumStr);
		 
		 let res = confirm("삭제 하시겠습니까?");
		 if(res){
			 document.cartForm.submit();
		 }
	 }
	 
	 function usePoint(obj, point, price){
		  let elem = document.getElementById("point");
		  let tot_amount = document.getElementById("cartTotPrice");
		  
		  if(obj.checked){
			  elem.value = point;
			  // 정규 표현식 : /\B(?=(\d{3})+(?!\d))/g 천단위로 변경
			  tot_amount.innerText = (price-point).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		  }else{
			  elem.value = '';
			  tot_amount.innerText = (price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		  }
	 }
	 
	 function removeChar(e){
		 //정규 표현식-숫자제외하고 공백으로 변경
		 e.target.value = e.target.value.replace(/[^0-9]/g,'');
	 }
	 
	 //지불방법선택
	 function selPayment(){
	 	let pms = document.getElementsByName("payment");
	 	
	 	for(i=0; i<pms.length; i++){
			 if(pms[i].checked){
				 document.getElementById(pms[i].value).style.display="block";
			 }else{
				 document.getElementById(pms[i].value).style.display="none";
			 }
		 }
	 }
	 
	 
   </script>


<jsp:include page="../include/footer.jsp" />

