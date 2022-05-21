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
	<textarea rows="5" cols="150" readonly="readonly">
회원탈퇴에 앞서 아래 내용을 반드시 확인해 주세요. 
KREAM을 탈퇴하면 회원 정보 및 서비스 이용 기록이 삭제됩니다.
탈퇴후 45일 이내에는 복구가 가능합니다
내 프로필, 거래내역(구매/판매), 관심상품, 보유상품, STYLE 게시물(게시물/댓글), 미사용 보유 포인트 등 사용자의 모든 정보가 사라지며 재가입 하더라도 복구가 불가능합니다.
탈퇴 14일 이내 재가입할 수 없으며, 탈퇴 후 동일 이메일로 재가입할 수 없습니다
관련 법령 및 내부 기준에 따라 별도 보관하는 경우에는 일부 정보가 보관될 수 있습니다.
1. 전자상거래 등 소비자 보호에 관한 법률
계약 또는 청약철회 등에 관한 기록: 5년 보관
대금결제 및 재화 등의 공급에 관한 기록: 5년 보관
소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
2. 통신비밀보호법
접속 로그 기록: 3개월 보관
3. 내부 기준에 따라 별도 보관
부정이용 방지를 위해 이름, 이메일(로그인ID), 휴대전화번호, CI/DI: 3년 보관
KREAM 탈퇴가 제한된 경우에는 아래 내용을 참고하시기 바랍니다.
진행 중인 거래(판매/구매)가 있을 경우: 해당 거래 종료 후 탈퇴 가능
진행 중인 입찰(판매/구매)가 있을 경우: 해당 입찰 삭제 후 탈퇴 가능
미납 수수료(착불 발송비/페널티)가 있을 경우: 해당 결제 완료 후 탈퇴 가능
이용 정지 상태인 경우: 이용 정지 해제 후 탈퇴 가능
회원탈퇴 안내를 모두 확인하였으며 탈퇴에 동의합니다.
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





