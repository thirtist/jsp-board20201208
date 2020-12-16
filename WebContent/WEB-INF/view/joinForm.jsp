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
	<div class="container">
		<u:navbar />

		<div class="container">

			<!-- <div class="row">
				아래 col-n에서 n의 합이 총 12까지 사용가능
				<div class="col-2">
					<div>Lorem ipsum dolor sit amet, consectetur adipisicing
						elit. Fugit laboriosam hic vitae fugiat aut ad maiores quidem
						dignissimos tempora possimus eaque harum sint corrupti iusto
						dolorem deleniti error eius quis.</div>
				</div>
				<div class="col-4">
					<div>Eaque totam iusto beatae voluptates architecto pariatur
						fugiat voluptatibus rem esse non! Placeat eaque illo quia magnam
						voluptate magni expedita repellendus praesentium iste quae
						accusamus reiciendis necessitatibus voluptatem similique eum!</div>
				</div>
				<div class="col">
					<div>Obcaecati magni placeat iusto sint perspiciatis animi
						fugiat commodi consectetur ratione deserunt sit quasi quam
						architecto officiis excepturi quod modi blanditiis explicabo
						distinctio accusamus ex quas earum atque facere omnis.</div>
				</div>
			</div> -->

			<div class="row">
				<div class="col-3"></div>
				<div class="col-6">
					<h1>회원가입</h1>
					<form action="${root }/join.do" method="post">
						<div class="form-group">
							<label for="input1-id">아이디</label> <input type="text" name="id"
								value="${param.id }" class="form-control" id="input1-id">
							<c:if test="${errors.id }">
								<small class="form-text text-muted">ID를 입력하세요</small>
							</c:if>
							<c:if test="${errors.duplicateId }">
								<small class="form-text text-muted">이미 사용중인 아이디입니다.</small>
							</c:if>

						</div>
						<div class="form-group">
							<label for="input2-name">이름</label> <input type="text"
								name="name" value="${param.name }" class="form-control"
								id="input2-name">
							<c:if test="${errors.name }">
								<small class="form-text text-muted">이름을 입력하세요</small>
							</c:if>
						</div>
						<div class="form-group">
							<label for="input3-password">암호</label> <input type="password"
								name="password" class="form-control" id="input3-password">
							<c:if test="${errors.password }">
								<small class="form-text text-muted">암호를 입력하세요</small>
							</c:if>
						</div>
						<div class="form-group">
							<label for="input4-confirmPassword">암호확인</label> <input
								type="password" name="confirmPassword" class="form-control"
								id="input4-confirmPassword">
							<c:if test="${errors.confirmPassword }">
								<small class="form-text text-muted">암호확인을 입력하세요</small>
							</c:if>
							<c:if test="${errors.notMatch }">
								<small class="form-text text-muted">암호와 암호확인이 일치하지 않습니다</small>
							</c:if>
						</div>
						<button type="submit" class="btn btn-primary">회원가입</button>
					</form>
				</div>

			</div>
			<div class="col-3"></div>
		</div>






		<%-- <h1>회원가입</h1>
	<form action="join.do" method="post">
		<p>
			아이디 : <br />
			<input type="text" name="id" value="${param.id }"/>
			<c:if test="${errors.id }">ID를 입력하세요</c:if>
			<c:if test="${errors.duplicateId }">이미 사용중인 아이디입니다.</c:if>
		</p>
		<p>
			이름 : <br />
			<input type="text" name="name" value= "${param.name }"/>
			<c:if test="${errors.name }">이름을 입력하세요</c:if>
		</p>
		<p>
			암호 : <br />
			<input type="password" name="password"/>
			<c:if test="${errors.password }">암호를 입력하세요</c:if>
		</p>
		<p>
			확인 : <br />
			<input type="password" name="confirmPassword" />
			<c:if test="${errors.confirmPassword }">확인을 입력하세요</c:if>
			<c:if test="${errors.notMatch }">암호와 확인이 일치하지 않습니다</c:if>			
		</p>
		<input type="submit" value="가입" />
	</form> --%>
	</div>
</body>
</html>