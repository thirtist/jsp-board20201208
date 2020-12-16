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

<title>게시글쓰기</title>
</head>
<body>
<u:navbar></u:navbar>
<div class="container">
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">
			<h1></h1>
			<form action="${root}/article/write.do" method="post">
				<div class="form-group">
					<label for="input1-title">제목</label>
					<input type="text" class="form-control" id="input1-title" name="title" value="${param.title }"/>
					<c:if test="${errors.title }">
						<small class="form-text text-muted">제목을 입력하세요</small>
					</c:if>
				</div>
				
				<div class="form-group">
					<label for="textarea1-content">내용</label>
					<textarea style="resize: none" name="content" class="form-control" id="textarea1-content" cols="30" rows="10">${param.content }</textarea>
				</div>
				
				<button type="submit" class="btn-primary">새 글등록</button>
			</form>
		</div>
	</div>
</div>
<%-- 
<form action="write.do" method="post">
<p>
	제목: <br /><input type="text" name="title" value="${param.title }"/>
	<c:if test="${errors.title }">제목을 입력하세요</c:if>
</p>

<p>
	내용: <br />
	<textarea name="content"rows="5" cols="30">${param.content }</textarea>
</p>
<input type="submit" value="새 글 등록"/>
</form>
 --%>
</body>
</html>