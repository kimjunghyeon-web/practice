<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
	$(document).ready(function(){
		alert('${view.title}');
	})
</script>
<div id="wrap">
	<table>
		<tr>
			<td>제목</td><td colspan=2>${view.title }</td>
		</tr>
		<tr>
			<td>작성일</td><td colspan=2>${view.regDate }</td>
		</tr>
		<tr>
			<td>내용</td><td><textarea>${view.content }</textarea></td>
		</tr>
	</table>
</div>