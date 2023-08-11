<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!--접근 권한 불허 메세지   -->

<jsp:include page="../include/a_header.jsp"/>

	<div class="container mt-5">
			<span class="text-secondary" style="font-size:25px">
			<sec:authentication property="principal"/>님은 해당 페이지에 대한 접근 권한이 없습니다.
			</span>
	</div>	
			
<jsp:include page="../include/a_footer.jsp"/>
