<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<!-- 배송지 추가 페이지 -->

<jsp:include page="../include/header.jsp"/>

<div class="container w-50 mt-5 p-5 shadow">
    <form action="/myPage/myAddressInput" method="post" > 
        <h4>${userDto.user_nm }님의 배송지 추가하기</h4>
		
         <input class="form-control mb-2 w-25" type="hidden" name="user_id" id="user_id" value="${userDto.user_id }"/>


        <input class="form-control mb-2 w-100" type="text" name="addr_nm" placeholder="받으시는 분의 성을 입력하세요">
        <input class="form-control mb-2 w-100" type="text" name="addr_tel" placeholder="받으시는 분의 휴대번호를 입력해주세요">
        

        
        <input class="form-control mb-2 w-100" type="text" name="addr_nik" placeholder="배송지 별칭을 입력해주세요">


		<!-- 주소 -->
        <div class="row mb-2">
            <div class="col-md-6">
                <input class="form-control mb-2" type="text" id="sample4_postcode" name="zipcode" placeholder="우편번호"
                       readonly>
            </div>
            <div class="col-md-6 p-0 ps-2">
                <a class="btn btn-sm btn-outline-secondary p-2" onclick="sample4_execDaumPostcode()">우편번호 찾기</a><br>
            </div>
        </div>

        <input class="form-control mb-2 w-50" type="text" name="addr" id="sample4_jibunAddress" placeholder="지번주소"
               readonly>      
        <input class="form-control mb-2 w-50" type="text" name="addr_road" id="sample4_roadAddress" placeholder="도로명주소"
               readonly>
        <!-- <span id="guide" style="color:#999;display:none"></span> -->
        <input class="form-control mb-2" type="text" id="sample4_detailAddress" name="addr_detail" placeholder="상세주소">	

<!-- 		
		<select class="forn-control mb-2 w-50" name="addr_gb">
        	<option selected>기본 배송지 여부를 체크해주세요</option>
        	<option>기본 배송지</option>
        	<option></option>
        </select> -->
        
        
        <button id="submitBtn" type="submit" class="btn btn-success">등록하기</button>
        <button type="reset" class="btn btn-dark">되돌리기</button>

    </form>
</div>





<jsp:include page="../include/footer.jsp"/>
