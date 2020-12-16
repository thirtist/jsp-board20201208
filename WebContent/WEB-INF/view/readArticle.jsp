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

<script src="https://kit.fontawesome.com/a076d05399.js"></script>

<script>
	$(function() {
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
	<u:navbar></u:navbar>

	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">

			<table class="table table-bordered">
				<tr>
					<th width="100">번호</th>
					<td>${articleData.article.number }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${articleData.article.writer.name }</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><c:out value="${articleData.article.title }"></c:out></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><u:pre value="${articleData.content.content }" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo }"></c:set>
						<a href="list.do?pageNo=${pageNo }">[목록]</a> 
						<c:if test="${authUser.id == articleData.article.writer.id }">
							<button onclick="location.href='modify.do?no=${articleData.article.number }'">게시글수정</button>
							<%-- <a href="modify.do?no=${articleData.article.number }">[게시글수정]</a> --%>	
							<button id="delete_btn">게시글삭제</button>
						</c:if></td>
				</tr>
			</table>

			<!-- 로그인한 경우만 댓글 폼 출력 -->
			<u:replyForm articleNo="${articleData.article.number }"></u:replyForm>
			<br />
			<u:listReply></u:listReply>

		</div>
	</div>




</body>
</html>