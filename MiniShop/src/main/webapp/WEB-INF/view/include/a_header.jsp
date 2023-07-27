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
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">   
<link rel="stylesheet" href="<c:url value="/resources/css/a_header.css"/>">   

</head>
<body>


<header class="top-bar con-min-width">
  <div class="con">
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <ul class="navbar-nav">
         <li class="nav-item">
          <a class="nav-link active" href="<c:url value="/admin/adminHome"/>">관리자 홈</a>
        </li>
        <li>
          <a class="nav-link active" href="#">관리자관리</a>
          <ul>
            <li> <a class="nav-link" href="<c:url value="/admin/adminRegister"/>">관리자 등록</a></li>
            <li> <a class="nav-link" href="<c:url value="/admin/adminList"/>">관리자 리스트</a></li>
            <li> <a class="nav-link" href="<c:url value="/admin/logList"/>">시스템 로그</a></li>
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
          <a class="nav-link active" href="#">공지 관리</a>
          <ul>
            <li><a class="nav-link" href="<c:url value="/post/postRegister"/>">공지/팝업 등록</a></li>
            <li><a class="nav-link" href="<c:url value="/post/postList"/>">공지/팝업 리스트</a></li>
          </ul>
        </li>
         <li>
          <a class="nav-link active" href="#">주문/배송 관리</a>
          <ul>
            <li><a class="nav-link" href="<c:url value="/order/orderList"/>">회원 주문/배송조회</a></li>
          </ul>
        </li>
         <li>
          <a class="nav-link active" href="#">고객 문의 관리</a>
          <ul>
            <li><a class="nav-link" href="<c:url value="/customer/csList"/>">고객(1:1)문의 처리</a></li>
            <li><a class="nav-link" href="<c:url value="/QnA/qnaList"/>">상품 문의 처리</a></li>
          </ul>
        </li>
         <li>
          <a class="nav-link active" href="<c:url value="/aLogin/adminLogin"/>">로그인</a>
        </li>
      </ul>
    </nav>
  </div>
</header>