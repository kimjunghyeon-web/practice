<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<style>
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
	function goList() {
		location.href = "list.do";
	}

	function boardModify(bno) {
		if (confirm("수정하시겠습니까?")) {
			if (bno != '' && bno != null) {
				$("#bno").val(bno);
				$("#board_modify").attr("action", "list_Modify.do").attr(
						"target", "_self");
				$("#board_modify").submit();
			} else {
				alert("수정에 실패하였습니다");
			}
		}
	}

	function boardDelete(bno) {
		if (confirm("삭제하시겠습니까?")) {
			if (bno != '' && bno != null) {
				$("#bno").val(bno);
				$("#searchForm").attr("action", "list_delete.do").attr(
						"target", "_self");
				$("#searchForm").submit();
			} else {
				alert("삭제에 실패하였습니다");
			}
		}
	}
</script>
<form id="searchForm" name="searchForm" method="post">
	<input type="hidden" id="bno" name="bno">
</form>
<div class="container">
	<h2>게시물 수정</h2>
	<p>게시물을 수정할 수 있습니다.</p>
	<form id="board_modify" method="post">
		<input type="hidden" id="bno" name="bno" value="${view.bno }">
		<table id="register_table" class="table table-bordered">
			<tr>
				<th><label for="boardTitle">제목</label></th>
				<td><input type="text" id="boardTitle" name="title" value=${view.title }></td>
				<th>조회수</th>
				<td>${view.viewCnt }</td>
			</tr>
			<tr>
				<th><label for="writer">작성자</label></th>
				<td><input type="text" id="writer" name="writer" value="${view.writer }" readonly /></td>
				<th><label for="regDate">작성일</label></th>
				<td><input type="text" id="regDate" name="regDate" value="<fmt:formatDate value="${now }" pattern="yyyy-MM-dd"/>" disabled></td>
			</tr>
			<tr style="height: 200px;">
				<th><label for="content">내용</label></th>
				<td colspan="3"><textarea id="content" name="content" style="width: 100%; height: 200px;">${view.content }</textarea></td>
			</tr>
			<tr>
				<th>파일 선택</th>
				<td><input type="file" id="file" name="file"></td>
			</tr>
		</table>
	</form>
	<div id="btn_area">
		<button type="button" class="btn btn-outline-primary" onclick="javascript:boardModify('${view.bno}')">수정</button>
		<button type="button" class="btn btn-outline-primary" onclick="javascript:boardDelete('${view.bno}')">삭제</button>
		<button type="button" class="btn btn-outline-primary" onclick="javascript:goList()">목록</button>
	</div>
</div>

<%-- <div class="container">
	<h2>게시물 수정</h2>
	<p>게시물을 수정할 수 있습니다.</p>
	<form id="board_write" method="post">
		<table id="register_table" class="table table-bordered">
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="hidden" id="boardTitle" name="title" value="${view.title }" disabled>${view.title }</td>
			</tr>
			<tr>
				<th><label for="writer">작성자</label></th>
				<td><input type="hidden" id="writer" name="writer" value="${view.writer }" readonly />${view.writer }</td>
				<th><label for="regDate">작성일</label></th>
				<td><input type="hidden" id="regDate" name="regDate" value="${view.regDate}" disabled>${view.regDate }</td>
			</tr>
			<tr style="height: 200px;">
				<th><label for="content">내용</label></th>
				<td colspan="3">${view.content }</td>
			</tr>
			<tr>
				<th>파일</th>
				<td><input type="hidden" id="file" name="file">파일없음</td>
			</tr>
		</table>
	</form>
	<div id="btn_area">
		<button type="button" class="btn btn-outline-primary" onclick="javascript:register()">수정</button>
		<button type="button" class="btn btn-outline-primary" onclick="javascript:boardDelete('${view.bno}')">삭제</button>
		<button type="button" class="btn btn-outline-primary" onclick="javascript:goList()">목록</button>
	</div>
	<div class="form-group">
		<label for="comment">Comment:</label>
		<textarea class="form-control" rows="5" id="comment"></textarea>
		<button type="button" class="btn btn-primary btn-xs">등록</button>
		<button type="button" class="btn btn-primary btn-xs">삭제</button>
	</div>
</div> --%>
