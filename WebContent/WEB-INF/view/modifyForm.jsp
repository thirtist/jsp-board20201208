<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<form action="modify.do" method="post">
	<input type="text" hidden name="no" value="${modReq.articleNumber }"/>
<p>
	번호 : <br /> ${modReq.articleNumber }
</p>
<p>
	제목 : <br /> <input type="text" name="title" value="${modReq.title }"/>
	<c:if test="${errors.title }">제목을 입력하세요.</c:if>
</p>
<p>
	내용 : <br />
	<textarea rows="5" cols="30"name="content">${modReq.content }</textarea>
</p>
<input type="submit" value="글 수정"/>

</form>
</body>
</html>