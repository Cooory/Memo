<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheer" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="contents d-flex justify-content-center">
			<div class="input-box my-5">
				<h1 class="text-center">회원 가입</h1>
				<input type="text" placeholder="아이디" class="form-control mt-4" id="loginIdInput">
				<input type="password" placeholder="비밀번호" class="form-control mt-2" id="passwordInput">
				<input type="password" placeholder="비밀번호 확인" class="form-control mt-2" id="passwordConfirmInput">
				<input type="text" placeholder="이름" class="form-control mt-2" id="nameInput">
				<input type="text" placeholder="이메일" class="form-control mt-2" id="emailInput">
				<button type="button" class="btn btn-secondary btn-block mt-3" id="joinBtn">가입</button>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>
	
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function() {
			$("#joinBtn").on("click", function() {
				let loginId = $("#loginIdInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				
				if (loginId == "") {
					alert("아이디를 입력하세요");
					return ;
				}
				
				if (password == "") {
					alert("비밀번호를 입력하세요");
					return ;
				}
				
				if (password != passwordConfirm) {
					alert("비밀번호가 일치하지 않습니다");
					return ;
				}
				
				if (name == "") {
					alert("이름을 입력하세요");
					return ;
				}
				
				if (email == "") {
					alert("이메일을 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/join"
					, data:{"loginId":loginId, "password":password, "name":name, "email":email}
					, success:function(data) {
						
						if (data.result == "success") {
							location.href = " /user/login-view";
						} else {
							alert("회원가입 실패!!")
						}
					}
					, error:function() {
						alert("회원가입 에러!!");
					}
				});
			});
		});
	</script>


</body>
</html>