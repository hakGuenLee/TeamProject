<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<%-- 	<meta name="_csrf_header" content="${_csrf.headerName}">
	<meta name="_csrf" content="${_csrf.token}"> --%>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src="<c:url value="/resources/js/commoncode.js"/>"></script>
   <script src="<c:url value="/resources/js/zipcode.js"/>"></script>
  
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">   
<link rel="stylesheet" href="<c:url value="/resources/css/header.css"/>">   
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">   

</head>
<body>


<header class="top-bar con-min-width">
  <div class="container">
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
       <ul class="navbar-nav">
         <li class="nav-item">
          <a class="nav-link active" href="<c:url value="/"/>">쇼핑몰 홈</a>
        </li>
        <li>
          <a class="nav-link active" href="#">모든 제품보기</a>
        </li>
        <li>
          <a class="nav-link active" href="#">과일</a>
          <ul id="fruitArea">
            <li><a class="nav-link" href="#"></a></li>
          </ul>
        </li>
         <li>
          <a class="nav-link active" href="#">채소</a>
          <ul id="vegeArea">
            <li><a class="nav-link" href="#"></a></li>
          </ul>
        </li>
         <li>
          <a class="nav-link active" href="#">축산</a>
          <ul id="meetArea">
            <li><a class="nav-link" href="#"></a></li>
          </ul>
        </li>
         <li>
          <a class="nav-link active" href="#">의류</a>
          <ul id="clothArea">
            <li><a class="nav-link" href="#"></a></li>
          </ul>
        </li>
        <li>
          <a class="nav-link active" href="#">가전</a>
          <ul id="electroArea">
            <li><a class="nav-link" href="#"></a></li>
          </ul>
        </li>
        <li>
          <a class="nav-link active" href="<c:url value="/cart/cartList"/>">Cart</a>       
        </li>
        <li>
          <a class="nav-link active" href="<c:url value="/myPage/myPagehome"/>">My Page</a>
          <ul>
            <li><a class="nav-link" href="<c:url value="/myPage/myInfoUpdate"/>" >내 정보수정</a>
            <li><a class="nav-link" href="<c:url value="/cart/wishList"/>">나의 위시리스트</a></li>
            <li><a class="nav-link" href="<c:url value="/myPage/myPagehome"/>">나의 주문/배송조회</a></li>
            <li><a class="nav-link" href="<c:url value="/myPage/myPagePoint"/>">나의 적립금</a></li>
            <li><a class="nav-link" href="<c:url value="/myPage/myPageQuestion"/>">나의 1:1문의</a></li>
            <li><a class="nav-link" href="<c:url value="/myPage/myPageProdQna"/>">나의 상품문의</a></li>
          </ul>
        </li>
         <li>
          <a class="nav-link active" href="#">Community</a>
          <ul>
            <li><a class="nav-link" href="#">Notice</a></li>
            <li><a class="nav-link" href="#">FAQ</a></li>
            <li><a class="nav-link" href="#">상품문의</a></li>
          </ul>
        </li>
         <c:if test="${sessionScope.userDTO ==null}">
            <li><a class="nav-link active ms-auto"
                     href="<c:url value="/user/userLogin"/>">로그인</a></li>
            <li><a class="nav-link active ms-auto"
                     href="<c:url value="/user/userRegister"/>">회원가입</a></li>
               </c:if>
               <c:if test="${sessionScope.userDTO !=null}">
                  <li><a class="nav-link active ms-auto"
                     href="<c:url value="/user/userLogout"/>">로그아웃</a></li>
               </c:if>
         
      </ul>
    </nav>
  </div>
</header>
<script>
$(document).ready(function(){	
	var categoryCode = 'A100'
	let str = "";
	let fruitArea = $("#fruitArea");
	
	getProdCategoryList(categoryCode, function(data){
		console.log(data);
		
		let list = data;
		
		for(let i=0; i<list.length; i++){
			str += '<li><a class="nav-link" href="/fruitPage'+i+'">'+list[i].ct_nm2+'</a></li>'
		}
		
		fruitArea.html(str);

	});
	
	var categoryCode = 'B100'
	let str2 = "";
	let vegeArea = $("#vegeArea");
		
		getProdCategoryList(categoryCode, function(data){
		console.log(data);
			
		let list = data;
			
		for(let i=0; i<list.length; i++){
			str2 += '<li><a class="nav-link" href="/vegePage'+i+'">'+list[i].ct_nm2+'</a></li>'
		}
			
			vegeArea.html(str2);

		});
		
	var categoryCode = 'C100'
		let str3 = "";
		let meetArea = $("#meetArea");
				
		getProdCategoryList(categoryCode, function(data){
			console.log(data);
					
			let list = data;
					
			for(let i=0; i<list.length; i++){
				str3 += '<li><a class="nav-link" href="/meetPage'+i+'">'+list[i].ct_nm2+'</a></li>'
			}
					
			meetArea.html(str3);

		});
		
	var categoryCode = 'S100'
		let str4 = "";
		let clothArea = $("#clothArea");
					
		getProdCategoryList(categoryCode, function(data){
			console.log(data);
						
			let list = data;
						
			for(let i=0; i<list.length; i++){
				str4 += '<li><a class="nav-link" href="/clothPage'+i+'">'+list[i].ct_nm2+'</a></li>'
			}
						
			clothArea.html(str4);
				
		});	
		
	var categoryCode = 'K100'
		let str5 = "";
		let electroArea = $("#electroArea");
						
		getProdCategoryList(categoryCode, function(data){
			console.log(data);
							
			let list = data;
							
			for(let i=0; i<list.length; i++){
				str5 += '<li><a class="nav-link" href="/electroPage'+i+'">'+list[i].ct_nm2+'</a></li>'
			}
							
			electroArea.html(str5);
					
		});			

});
</script>



