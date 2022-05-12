<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/userdelete.css">
<style>
	input[type=text]{margin-bottom:10px;}
</style>    
<div id="page">
	<div class="container">
	<form name="frm"   enctype="multipart/form-data">
	<h2>회원탈퇴 고지사항</h2>
	<textarea rows="5" cols="150">
	
	
	</textarea>
		<table style="display: none;">
			<tr>
				<td class="title" width=100>아이디</td>
				<td width=500>
					<input type="text" name="uid" value="${vo.uid}" readonly>
				</td>
			</tr>
			<tr>
				<td class="title" width=100>비밀번호</td>
				<td width=500><input type="password" name="upass" ></td>
			</tr>
			<tr>
				<td class="title" width=100>이름</td>
				<td width=500><input type="text" name="uname" value="${vo.uname}"></td>
			</tr>
			<tr>
				<td class="title" width=100>전화번호</td>
				<td width=500><input type="text" name="utel" value="${vo.utel}"></td>
			</tr>
			<tr>
				<td class="title" width=100>이메일</td>
				<td width=500><input type="text" name="uemail" value="${vo.uemail}"></td>
			</tr>
			<tr>
				<td class="title" width=100>유저코드</td>
				<td width=500><input type="text" name="ucode" value="3"></td>
			</tr>
			<tr>
				<td class="title" width=100>결제방법</td>
				<td width=500><input type="text" name="upay" value="${vo.upay}"></td>
			</tr>
			<tr>
				<td class="title" width=100>주소</td>
				<td width=500>
					<input type="text" name="uaddress" size=30 value="${vo.uaddress}">
					<button type="button" id="search">주소검색</button><br>
				</td>
			</tr>
		
		</table>
		<div class="dbutton">
			<button type="submit" class="update">탈퇴</button>
			<button><a href="/user/update?uid=${uid}">뒤로</a></button>
		</div>
	</form>
	</div>
</div>

<script>

	$(frm).on("submit", function(e){
		e.preventDefault();
		
		var ucode=$(frm.ucode).val();
		
		{
			if(!confirm("정말 탈퇴하시겟어요?")) return;
			frm.method="post";
			frm.action="update";
			frm.submit();
		}
	});
	

</script>





