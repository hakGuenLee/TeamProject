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
<link rel="stylesheet" href="<c:url value="/resources/css/header.css"/>">   

</head>
<body>


<header class="top-bar con-min-width">
  <div class="con">
    <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
       <ul class="navbar-nav">
         <li class="nav-item">
          <a class="nav-link active" href="#">쇼핑몰 홈</a>
        </li>
        <li>
          <a class="nav-link active" href="#">모든 제품보기</a>
          <ul>
            <li> <a class="nav-link" href="#">과일</a></li>
            <li> <a class="nav-link" href="#">가전</a></li>
            <li> <a class="nav-link" href="#">의류</a></li>
          </ul>
        </li>
        <li>
          <a class="nav-link active" href="#">Cart</a>       
        </li>
        <li>
          <a class="nav-link active" href="#">My Page</a>
          <ul>
            <li><a class="nav-link" href="#">나의 주문/배송조회</a></li>
            <li><a class="nav-link" href="#">나의 적립금</a></li>
            <li><a class="nav-link" href="#">나의 1:1문의</a></li>
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
         <li>
          <a class="nav-link active" href="<c:url value="/aLogin/adminLogin"/>">로그인</a>
        </li>
      </ul>
    </nav>
  </div>
</header>