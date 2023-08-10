<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<%--  	<meta name="_csrf_header" content="${_csrf.headerName}">
	<meta name="_csrf" content="${_csrf.token}">  --%>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src="<c:url value="/resources/js/commoncode.js"/>"></script>
     <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="<c:url value="/resources/js/zipcode.js"/>"></script>
  
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">   
<link rel="stylesheet" href="<c:url value="/resources/css/header.css"/>">   
<link rel="stylesheet" href="<c:url value="/resources/css/main.css"/>">   

<c:if test="${msg != null}">
<script>
alert('장바구니나 구매목록에 이미 있는 상품입니다.')
</script>
</c:if>
<c:if test="${msgWish != null}">
<script>
alert('위시리스트에 이미 있는 상품입니다.')
</script>
</c:if>

</head>
<body>


<header class="top-bar con-min-width">
  <div id="fdiv" class="container w-75">
    <nav class="navbar navbar-expand-sm  navbar-white bg-white fixed-top">
       <ul class="navbar-nav">
         <li class="nav-item">
          <a id="home" class="nav-link active" href="<c:url value="/"/>"><b>MiniMall</b></a>
        </li>
		
        <li id="allProduct">
          <a class="nav-link active" href="#"><b>모든제품</b></a>
        </li>
        <li>
          <a class="nav-link active " href="#"><b>과일</b></a>
          <ul id="fruitArea">
            <li><a class="nav-link" href="#"></a></li>
          </ul>
        </li>
         <li>
          <a class="nav-link active" href="#"><b>채소</b></a>
          <ul id="vegeArea">
            <li><a class="nav-link" href="#"></a></li>
          </ul>
        </li>
         <li>
          <a class="nav-link active " href="#"><b>축산</b></a>
          <ul id="meetArea">
            <li><a class="nav-link" href="#"></a></li>
          </ul>
        </li>
         <li>
          <a class="nav-link active " href="#"><b>의류</b></a>
          <ul id="clothArea">
            <li><a class="nav-link" href="#"></a></li>
          </ul>
        </li>
        <li>
          <a class="nav-link active " href="#"><b>가전</b></a>
          <ul id="electroArea">
            <li><a class="nav-link" href="#"></a></li>
          </ul>
        </li>
    	 <li>
          <a class="nav-link active" href="#"><b>Community</b></a>
          <ul>
            <li><a class="nav-link" href="<c:url value="/board/noticePage"/>">Notice</a></li>
            <li><a class="nav-link" href="<c:url value="/board/faqPage"/>">FAQ</a></li>
            <li><a class="nav-link" href="<c:url value="/board/question"/>">1:1 문의하기</a></li>
          </ul>
        </li>
    
    
        <li id="UserArea">
          <a class="nav-link active" href="<c:url value="/myPage/myPagehome"/>">My Page</a>
          <ul>
            <li><a class="nav-link" href="<c:url value="/myPage/myInfoUpdate"/>" >내 정보수정</a>
            <li><a class="nav-link" href="<c:url value="/cart/wishList"/>">나의 위시리스트</a></li>
            <li><a class="nav-link" href="<c:url value="/myPage/myAddress"/>">나의 배송지 관리</a></li>
            <li><a class="nav-link" href="<c:url value="/myPage/myPagehome"/>">나의 주문/배송조회</a></li>
            <li><a class="nav-link" href="<c:url value="/myPage/myPagePoint"/>">나의 적립금</a></li>
            <li><a class="nav-link" href="<c:url value="/myPage/myPageQuestion"/>">나의 1:1문의</a></li>
            <li><a class="nav-link" href="<c:url value="/userQna/myPageProdQna"/>">나의 상품문의</a></li>
          </ul>
        </li>
         <li>
          <a class="nav-link active" href="<c:url value="/cart/cartList"/>">Cart</a>       
        </li>
        
         <c:if test="${sessionScope.userDTO ==null}">
            <li><a class="nav-link active ms-auto"
                     href="<c:url value="/user/userLogin"/>">Login</a></li>
            <li><a class="nav-link active ms-auto"
                     href="<c:url value="/user/userRegister"/>">join</a></li>
               </c:if>
               <c:if test="${sessionScope.userDTO !=null}">
                  <li><a class="nav-link active ms-auto"
                     href="<c:url value="/user/userLogout"/>">Logout</a></li>
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
			str += '<li><a class="nav-link" href="/productPage/fruitPage'+i+'">'+list[i].ct_nm2+'</a></li>'
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
			str2 += '<li><a class="nav-link" href="/productPage/vegePage'+i+'">'+list[i].ct_nm2+'</a></li>'
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
				str3 += '<li><a class="nav-link" href="/productPage/meetPage'+i+'">'+list[i].ct_nm2+'</a></li>'
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
				str4 += '<li><a class="nav-link" href="/productPage/clothPage'+i+'">'+list[i].ct_nm2+'</a></li>'
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
				str5 += '<li><a class="nav-link" href="/productPage/electroPage'+i+'">'+list[i].ct_nm2+'</a></li>'
			}
							
			electroArea.html(str5);
					
		});			

});
</script>



