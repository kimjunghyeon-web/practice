<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page trimDirectiveWhitespaces="true"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	function goMain() {
		location.href = "home.do";
	}
	
	function detailView(bno) {
		$("#bno").val(bno);
 		$("#searchForm").attr("action","list_view.do").attr("target","_self");
 		$("#searchForm").submit();
		
	}
	function register() {
		location.href ="list_write.do";
	}
	

</script>
	<form id="searchForm" name="searchForm" method="post">
		<input type="hidden" id="bno" name="bno">
	</form>
	<div class="container">
		<h2>게시판</h2>
		<p>게시물을 확인할 수 있다.</p>
		<table class="table table-hover">
			<colgroup>
				<col style="width: 5%" />
				<col style="width: 15%" />
				<col style="width: 40%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
				<col style="width: 10%" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="list" items="${list }" end="${list.size() }">
					<tr>
						<td>${list.bno }</td>
						<td>${list.title }</td>
						<td><a href="javascript:detailView('${list.bno }')">${list.content }</a></td>
						<td>${list.writer }</td>
						<td>${list.regDate }</td>
						<td>${list.viewCnt }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="button" class="btn btn-outline-primary" onclick="javascript:register()">등록</button>
		<button type="button" class="btn btn-outline-primary" onclick="javascript:goMain()">HOME</button>
	</div>
