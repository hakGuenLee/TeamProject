<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<jsp:include page="../include/a_header.jsp"/>

		<div class="container mt-5 border shadow p-5">
				<h3><b>관리자 로그인</b></h3>
				
				<c:if test = "${param.error}">
					<span class="text-danger">${exception}</span>
				</c:if> 
			<form action="/login" method="post" class="mt-5">	
					<input type="hidden" value="secretData" name="secret_key">
					<input type="hidden" value="${_csrf.token}" name="${_csrf.parameterName }">
					
						<div class="input-group mb-3">
						  <span class="input-group-text"><i class="xi-user"></i></span>
						  <input type="text"  name="username" class="form-control" placeholder="아이디를 입력하세요">
						</div>
						<div class="input-group mb-3">
						  <span class="input-group-text"><i class="xi-lock"></i></span>
						  <input type="password"  name="password" class="form-control" placeholder="비밀번호를 입력하세요">
						</div>
						<button type="submit" class="btn btn-outline-info">로그인</button>
				</form>
		</div>					
	<jsp:include page="../include/a_footer.jsp"/>
	
	
</body>
</html>
