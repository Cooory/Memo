<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메모 보기</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div id="wrap">
		<c:import url="/WEB-INF/jsp/include/header.jsp" />
		<section class="contents d-flex justify-content-center">
			<div class="post-layout my-5">
				
				<h1 class="text-center">메모 보기</h1>
				
				<div class="d-flex mt-3">
					<label class="col-2">제목:</label>
					<input type="text" class="form-control col-10" id="titleInput" value="${post.title }">
				</div>
				<textarea class="form-control mt-3 mb-3" rows="7" id="contentInput">${post.content }</textarea>
				
				<img width="100%" src="${post.imagePath }">

				<div class="d-flex justify-content-between mt-3">
					<div>
						<a href="/post/list-view" class="btn btn-secondary">목록으로</a>
						<button type="button" class="btn btn-danger" id="deleteBtn" data-post-id="${post.id }">삭제</button>
					</div>
					<button type="button" class="btn btn-secondary" id="modifyBtn" data-post-id="${post.id }" >수정</button>
				</div>
				
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/include/footer.jsp" />
	</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	
<script>
	$(document).ready(function() {
		
		$("#deleteBtn").on("click", function() {
			
			let postId = $(this).data("post-id");
			
			$.ajax({
				type:"delete"
				, url:"/post/delete"
				, data:{"postId":postId}
				, success:function(data) {
					
					if(data.result == "success") {
						location.href = "/post/list-view";
					} else {
						alert("삭제 실패");
					}
				}
				, error:function() {
					
					alert("삭제 에러");
				}
			});
		});
		
		$("#modifyBtn").on("click", function() {
			
			let title = $("#titleInput").val();
			let content = $("#contentInput").val();
			
			let postId = $(this).data("post-id");
			
			$.ajax({
				type:"put"
				, url:"/post/update"
				, data:{"postId":postId, "title":title, "content":content}
				, success:function(data) {
					
					if(data.result == "success") {
						alert("수정 완료!")
						location.reload();
					} else {
						alert("메모 수정 실패");
					}
				}
				, error: function() {
					alert("메모 수정 에러");
				}
			});
		});
	});
</script>
	



</body>
</html>