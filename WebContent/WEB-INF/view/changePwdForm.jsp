<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<title>Insert title here</title>
</head>
<body>
<u:navbar></u:navbar>
<div class="container">
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">
		
			<h1>암호변경</h1>
			<form action="${root}/changePwd.do" method="post">
				<div class="form-group">
					<label for="input1-curPwd">현재암호</label>
					<input id="input1-curPwd" type="password" name="curPwd" class="form-control"/>
						<c:if test="${errors.curPwd }">
						<small class="form-text text-muted">현재암호를 입력하세요</small>
						</c:if>
						<c:if test="${errors.badCurPwd }">
						<small class="form-text text-muted">현재암호가 다릅니다</small>
						</c:if>
					<br />
					<label for="input1-curPwd">변경할 암호</label>
					<input id="input1-curPwd" type="password" name="newPwd" class="form-control"/>
		
						<c:if test="${errors.newPwd }">				
						<small class="form-text text-muted">변경할 암호를 입력하세요</small>
						</c:if>
					<br />	
					<button type="submit" class="btn-primary">변경</button>
				</div>
			</form>

		</div>
	</div>
</div>

<%-- <form action="changePwd.do" method="post">
<p>
	현재 암호 : <br /><input type="password" name="curPwd" />
	<c:if test="${errors.curPwd }">현재 암호를 입력하세요</c:if>
	<c:if test="${errors.badCurPwd }">현재 암호가 일치하지 않습니다</c:if>
</p>
<p>
	새 암호 : <br /><input type="password" name="newPwd" />
	<c:if test="${errors.newPwd }">새 암호를 입력하세요</c:if>
</p>
<input type="submit" value="암호변경" />
</form> --%>

</body>
</html>