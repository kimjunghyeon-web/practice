<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script>
	$(document).ready(function() {
	})

	function goList() {
		location.href = "list.do";
	}

	function boardDelete(bno) {
		if (confirm("삭제하시겠습니까?")) {
			if (bno != '' && bno != null) {
				$("#bno").val(bno);
				$("#searchForm").attr("action", "list_delete.do").attr("target", "_self");
				$("#searchForm").submit();
			} else {
				alert("삭제에 실패하였습니다");
			}
		}
	}
</script>
<div id="wrap">
	<form id="searchForm" name="searchForm" method="post">
		<input type="hidden" id="bno" name="bno">
	</form>
	<table>
		<tr>
			<td>제목</td>
			<td colspan=2>${view.title }</td>
		</tr>
		<tr>
			<td>작성일</td>
			<td colspan=2>${view.regDate }</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea>${view.content }</textarea></td>
		</tr>
	</table>
	<button type="button" class="btn btn-outline-primary" onclick="javascript:boardEdit()">수정</button>
	<button type="button" class="btn btn-outline-primary" onclick="javascript:boardDelete('${view.bno}')">삭제</button>
	<button type="button" class="btn btn-outline-primary" onclick="javascript:goList()">목록</button>
</div>