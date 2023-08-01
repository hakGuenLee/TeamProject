<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!-- 사용자 로그인 페이지 -->

<jsp:include page="../include/header.jsp"/>
<div class="container w-50 shadow rounded border p-5 mt-5">
    <form action="<c:url value='/user/userLogin'/>" method="post">
        <h3 class="text-center mb-4">로그인</h3>
        <input class="form-control mb-3" type="text" id="user_id" name="user_id" placeholder="아이디"/>
        <input class="form-control mb-2" type="text" id="user_pw" name="user_pw" placeholder="비밀번호"/>

        <div class="text-center pt-4">
            <input type="submit" class="btn btn-primary w-100" value="로그인"/>
        </div>
    </form>
    <div class="mt-3 w-100 findIdPw">
        <div class="d-flex justify-content-between">
            <div><i class="fa fa-lock"></i>
                <a href="<c:url value='/user/idpwSearch?find=id'/>">아이디/</a>
                <a href="<c:url value='/user/idpwSearch?find=pw'/>">비밀번호 찾기</a>
            </div>
            <div><i class="fa fa-user-plus"></i> <a href="<c:url value="/user/userRegister"/>">회원가입</a></div>
        </div>
    </div>
</div>


	
					
	<jsp:include page="../include/footer.jsp"/>
	
	
</body>
</html>