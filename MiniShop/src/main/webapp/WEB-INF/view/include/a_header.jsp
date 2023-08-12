<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Minimall Admin Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<%-- -  	<meta name="_csrf_header" content="${_csrf.headerName}">
	<meta name="_csrf" content="${_csrf.token}">   --%>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="<c:url value="/resources/js/commoncode.js"/>"></script>
     <script src="<c:url value="/resources/js/zipcode.js"/>"></script>
      <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">   
<link rel="stylesheet" href="<c:url value="/resources/css/a_header.css"/>">   
<link rel="stylesheet" href="<c:url value="/resources/css/admin.css"/>">   

</head>
<body>

<header class="top-bar con-min-width">
  <div class="con">
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <ul class="navbar-nav w-100">
       <div class="d-flex w-100 justify-content-around">
       	<div>
         <li class="nav-item">
          <a class="nav-link active" href="<c:url value="/adminHome"/>">관리자 홈</a>
        </li>
        </div>
        <div class="d-flex">
        <li>
          <a class="nav-link active" href="#">관리자관리</a>
          <ul>
            <li> <a class="nav-link" href="<c:url value="/admin/adminRegister"/>">관리자 등록</a></li>
            <li> <a class="nav-link" href="<c:url value="/admin/adminList"/>">관리자 리스트</a></li>
          </ul>
        </li>
          <li>
          <a class="nav-link active" href="#">회원관리</a>
          <ul>
            <li> <a class="nav-link" href="<c:url value="/admin/userList"/>">회원리스트</a></li>
          </ul>
        </li>
        <li>
          <a class="nav-link active" href="#">카테고리 관리</a>
          <ul>
            <li><a class="nav-link" href="<c:url value="/category/catRegister"/>">카테고리 등록</a></li>
            <li><a class="nav-link" href="<c:url value="/category/catList"/>">카테고리 리스트</a></li>
          </ul>
        </li>
        <li>
          <a class="nav-link active" href="#">상품 관리</a>
          <ul>
            <li><a class="nav-link" href="<c:url value="/product/prodRegister"/>">상품 등록</a></li>
            <li><a class="nav-link" href="<c:url value="/product/prodList"/>">상품 리스트</a></li>
          </ul>
        </li>
         <li>
          <a class="nav-link active" href="#">공지 관리</a>
          <ul>
            <li><a class="nav-link" href="<c:url value="/post/postRegister"/>">공지/팝업 등록</a></li>
            <li><a class="nav-link" href="<c:url value="/post/postList"/>">공지/팝업 리스트</a></li>
          </ul>
        </li>
         <li>
          <a class="nav-link active" href="#">주문/배송 관리</a>
          <ul>
           <li><a class="nav-link" href="<c:url value="/orderManager/AllOrder"/>">회원 주문/배송 리스트</a></li>
            <li><a class="nav-link" href="<c:url value="/orderManager/orderList"/>">회원 주문/배송조회</a></li>
          </ul>
        </li>
         <li>
          <a class="nav-link active" href="#">고객 문의 관리</a>
          <ul>
            <li><a class="nav-link" href="<c:url value="/customer/csList"/>">고객(1:1)문의 처리</a></li>
            <li><a class="nav-link" href="<c:url value="/QnA/qnaList"/>">상품 문의 처리</a></li>
          </ul>
        </li>
        </div>
        <div class="d-flex">
        <c:if test="${SPRING_SECURITY_CONTEXT == null}">
           <li sec:authorize="isAnonymous()">
          <a class="nav-link active" href="<c:url value="/adminLogin"/>">로그인</a>
        </li>
        </c:if>
         <c:if test="${SPRING_SECURITY_CONTEXT != null}">
         <p class="nav-link active"><sec:authentication property="principal"/>님 접속 중</p>
         <li sec:authorize="isAuthenticated()">
          <a class="nav-link active" href="<c:url value="/adminLogout"/>">로그아웃</a>
        </li>
        </c:if>
        </div>
        </div>
      </ul>
    </nav>
  </div>
</header>