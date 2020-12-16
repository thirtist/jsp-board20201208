<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!--fontawesom아이콘사용 w3school에서 가져옴 =>이후에 fontawesom.com에서 진한색이 무료 
그리고 아이콘html을 복사해서 u:navbar태그에서 사용하면 표시되어서 나옴 -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<u:navbar />

		<div class="container">
			<div class="jumbotron">
				<h1 class="display-4">첫 번째 프로젝트!</h1>
				<p class="lead">안녕하세요 저의 첫번째 프로젝트입니다</p>
				<hr class="my-4">
				<p>회원가입부터 시작해보세요</p>
				<a class="btn btn-primary btn-lg" href="${root }/join.do" role="button">회원가입</a>
			</div>
		</div>

	</div>

<%-- 위에 navbar만들어서 사용안하게됨
<u:isLogin> <!--커스텀태그만들어서 사용-->
	${authUser.name }님, 안녕하세요.
	<a href="logout.do">[로그아웃하기]</a>
	<a href="changePwd.do">[암호변경하기]</a>
	<a href="removeMember.do">[회원탈퇴하기]</a>
    <a href="article/write.do">[게시물쓰기]</a>  
    <a href="article/list.do">[게시물읽기]</a>  
</u:isLogin>

<u:notLogin>
	<a href="join.do">[회원가입하기]</a>
	<a href="login.do">[로그인하기]</a>
</u:notLogin> --%>

	<%--
<c:if test="${! empty authUser }">
	${authUser.name }님, 안녕하세요.
	<a href="logout.do">[로그아웃하기]</a>
	<a href="changePwd.do">[암호변경하기]</a>
</c:if>

<c:if test="${ empty authUser }">
	<a href="join.do">[회원가입하기]</a>
	<a href="login.do">[로그인하기]</a>
</c:if>
--%>

</body>
</html>