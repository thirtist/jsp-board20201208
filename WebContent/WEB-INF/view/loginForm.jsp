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

<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<title>Insert title here</title>
</head>
<body>
<u:navbar />
<!-- .container>.row>.col-3+.col-6>h1+form -->

<div class="container">
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">
			<h1>로그인</h1>
			<form action="${root }/login.do" method="post">
				<!-- div.form-group*2>label+input.form-control -->
				<div class="form-group">
					<label for="input1-id">아이디</label>
					<input type="text" name="id" value="${param.id }" id="input1-id" class="form-control" />
					<c:if test="${errors.id }">
						<small class="form-text text-muted">
							ID를 입력하세요.
						</small>
					</c:if>
				</div>
				<div class="form-group">
					<label for="input2-password">패스워드</label>
					<input type="text" name="password" id="input2-password" class="form-control" />
					<c:if test="${errors.password }">
						<small class="form-text text-muted">
							password를 입력하세요.
						</small>
					</c:if>
				</div>
				<button type="submit" class="btn btn-primary">로그인</button>
			</form>
		</div>
	</div>
</div>


	<%-- <h1>로그인</h1>
	<form action="login.do" method="post">
		<c:if test="${errors.idOrPwNotMatch }">
	아이디와 암호가 일치하지 않습니다.
	</c:if>
		<p>
			아이디:<br /> <input type="text" name="id" value="${param.id }" />
			<c:if test="${errors.id }">ID를 입력하세요.</c:if>
		</p>
		<p>
			패스워드:<br /> <input type="password" name="password"value="${param.password }" />
			<c:if test="${errors.password }">password를 입력하세요.</c:if>
		</p>
		<input type="submit" value="로그인" />

	</form> --%>
</body>
</html>