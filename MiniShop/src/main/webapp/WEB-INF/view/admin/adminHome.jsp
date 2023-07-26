<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<jsp:include page="../include/a_header.jsp"/>

					
	<div class="container">
		<div class="container-fluid mt-3" >
		  <br>
		   <h2>관리자 페이지</h2>
<ul>
      <li class="nav-item">
        <a class="nav-link active" href="<c:url value="/admin/adminHome"/>">관리자 홈</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/adminRegister"/>">관리자 등록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/adminList"/>">관리자 리스트</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/requestList"/>">승인요청 처리</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="<c:url value="/admin/logList"/>">시스템 로그</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/category/catRegister"/>">카테고리 등록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/category/catList"/>">카테고리 리스트</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/product/prodRegister"/>">상품 등록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/product/prodList"/>">상품 리스트</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/notice/noticeRegister"/>">공지/팝업 등록</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/notice/noticeRegister"/>">공지/팝업 리스트</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/order/orderList"/>">회원 주문/배송조회</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="<c:url value="/customer/csList"/>">고객(1:1)문의 처리</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="<c:url value="/QnA/qnaList"/>">상품 문의 처리</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<c:url value="/aLogin/adminLogin"/>">로그인</a>
      </li>
    </ul>



		</div>
	</div>			
					
					
					
<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>