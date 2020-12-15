<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags/"%>
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

<script>
$(function(){
	$("#delete_btn").click(function() {
		if (confirm("정말 삭제하시겠습니까 ?")) {
			location.href = "delete.do?no=${articleData.article.number }";
		} else {
			return;
		}
	});
});
</script>

<title>게시글 읽기</title>
</head>
<body>
	<table border="1" width="100%">
		<tr>
			<td>번호</td>
			<td>${articleData.article.number }</td>
		</tr>
		<tr>
			<td>작성자</td>
			<td>${articleData.article.writer.name }</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><c:out value="${articleData.article.title }"></c:out></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><u:pre value="${articleData.content.content }" /></td>
		</tr>
		<tr>
			<td colspan="2"><c:set var="pageNo"
					value="${empty param.pageNo ? '1' : param.pageNo }"></c:set> <a
				href="list.do?pageNo=${pageNo }">[목록]</a> <c:if
					test="${authUser.id == articleData.article.writer.id }">
					<a href="modify.do?no=${articleData.article.number }">[게시글수정]</a>
					<button id="delete_btn">[게시글삭제]</button>
				</c:if></td>
		</tr>
	</table>
	
	
	<!-- 로그인한 경우만 댓글 폼 출력 -->
	<u:replyForm articleNo="${articleData.article.number }"></u:replyForm>
	
	<u:listReply></u:listReply>
	
	
</body>
</html>