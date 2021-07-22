<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" content="ko">
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="ctxp" value="${pageContext.request.contextPath}" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
#container {
	margin: 20px;
}

#register_table th {
	text-align: center;
	color: white;
	background-color: #cfc8b5;
}

#register_table td input {
	width: 100%;
	heigth: 50px;
}
</style>
<script>
	function validate() {
		var $boardTitle = $("#boardTitle").val();
		var $content = $("#content").val();
		if ($boardTitle == '') {
			alert("제목은 필수 입력입니다.");
			$("#boardTitle").focus();
			return;
		}
		if ($content == "") {
			alert("내용은 필수 입력입니다.");
			$content.focus();
			return;
		}
		if ($boardTitle.length < 2) {
			alert($title.value);
			alert("제목은 2자 이상입니다.");
			$boardTitle.focus();
			return;
		}
// 		if ($content.length < 10) {
// 			alert("내용은 10자 이상입니다.");
// 			$content.focus();
// 			return;
// 		}
		return true;
	}

	function goList() {
		location.href = "list.do";
	}

	function register() {
		if (validate()) {
			if (confirm("등록하시겠습니까?")) {
				$("#board_write").attr("action", "list_write.do").submit();
			} 
		}
	}
</script>
<div class="container">
	<h2>게시물 등록</h2>
	<p>게시물을 등록할 수 있습니다.</p>
	<form id="board_write" method="post">
		<table id="register_table" class="table table-bordered">
			<tr>
				<th><label for="boardTitle">제목</label></th>
				<td colspan="3"><input type="text" id="boardTitle" name="title" placeholder="제목을 입력하세요"></td>
			</tr>
			<tr>
				<th><label for="writer">작성자</label></th>
				<td><input type="text" id="writer" name="writer" value="홍길동" readonly /></td>
				<th><label for="regDate">작성일</label></th>
				<td><input type="text" id="regDate" name="regDate" value="<fmt:formatDate value="${now }" pattern="yyyy-MM-dd"/>" disabled></td>
			</tr>
			<tr style="height: 200px;">
				<th><label for="content">내용</label></th>
				<td colspan="3"><textarea id="content" name="content" placeholder="내용을 입력하세요" style="width: 100%; height: 200px;"></textarea></td>
			</tr>
			<tr>
				<th>파일 선택</th>
				<td><input type="file" id="file" name="file"></td>
			</tr>
		</table>
		<button type="button" class="btn btn-outline-primary" onclick="javascript:register()">등록</button>
		<button type="button" class="btn btn-outline-primary" onclick="javascript:goList()">목록</button>
	</form>
</div>