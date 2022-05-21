<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/resources/css/hinsert.css" rel="stylesheet" >
<html>
<body>
	<div id="page" class="container">
		<h1>공지사항등록</h1>
		<form name="frm" method="post">
		<table>
			<td class="title">제목</td>
				<td>
					<input type="text" name="ntitle" class="ititle">
				</td>
			<tr class="category">
				<td>
					<select name="ncode1" class="hselect">
						<option value="" selected="selected">카테고리선택</option>
						<option value="1">공지사항</option>
						<option value="2">자주묻는질문</option>
						<option value="3">검수기준</option>
					</select>
				</td>
			</tr>
					<tr class="category">
						<td>
							<select name="ncode2" class="hselect">
								<option value="" selected="selected">카테고리선택</option>
								<option value="1">공지사항-공지사항</option>
								<option value="1">자주묻는질문-이용정책</option>
								<option value="2">자주묻는질문-공통</option>
								<option value="3">자주묻는질문-구매</option>
								<option value="4">자주묻는질문-판매</option>
								<option value="1">검수기준-신발</option>
								<option value="2">검수기준-의류</option>
								<option value="3">검수기준-패션잡화</option>
								<option value="4">검수기준-테크</option>
								<option value="5">검수기준-라이프</option>
								<option value="6">검수기준-프리미엄시계</option>
								<option value="7">검수기준-프리미엄가방</option>
							</select>
						</td>
					</tr>
				<td>
					<textarea rows="5" cols="80" class="detail" name="notice"></textarea>
				</td>
				<td><input type="text" style="display: none;"
					name="nid" value="${uid}"></td>
				</table>
				<div class="insert">
					<button type="submit">공지사항등록</button>
					<button type="reset">등록취소</button>
					<button type="button"><a href="/notice/home?ucode=${ucode}">목록으로</a></button>
				</div>
		</form>
	
	</div>
</body>

</html>
<script>
	$(frm).on(
			"submit",
			function(e) {
				e.preventDefault();
				var notice = $(frm.notice).val();
				var ntitle = $(frm.ntitle).val();
				var ncode1 = $(frm.ncode1).val();
				var ncode2 = $(frm.ncode2).val();
				var nid = $(frm.nid).val();

				if (notice == "") {
					alert("내용을 입력하세요!");
					$(frm.notice).focus();
					return;
				} else if (ntitle == "") {
					alert("제목을 입력하세요!");
					$(frm.ntitle).focus();
					return;
				}
				if (!confirm("글을등록하시겟습니까?"))
					return;
				frm.submit();
			});
</script>