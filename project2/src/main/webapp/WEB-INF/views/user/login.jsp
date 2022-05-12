<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/resources/css/login.css">

<form  name="frm" id="mylogin">
	<table>
		<div id="mycontent">
			<div class="login">
				<div class="login-top">
					<a href="/"><img src="/resources/img/it.png" style="width:150px;"></a><br><br>
				</div>
				<div class="login-center">
						<h5>아이디</h5>
						<input type="text" name="uid" placeholder="예) likeit" class="login-input">
					<hr><br>
						<h5>비밀번호</h5>
						<input type="password" name="upass" class="login-input">
					<hr><br>
					
					<button type="submit" class="login-button">로그인</button>
					<br>
					<div class="login-bottom">
						<div class="form-group form-check">
							<input class="form-check-input" type="checkbox"> 
							<p class="button-bottom1">아이디 저장</p>
						</div>
						<div>
							<a class="post" href="/user/insert">
							<p class="button-bottom3">회원가입</p></a>
						</div>
						<div>
							<a class="post" href="/user/passupdate">
							<p class="button-bottom4">비밀번호 재발급</p></a>
						</div>
					</div>
					<div class="login-api"><a href="https://kauth.kakao.com/oauth/authorize?client_id=875fa1f5aba0b0cb1bf90f42f47f4dc3&redirect_uri=http://localhost:8088/user/kakao/login&response_type=code">
						<button type="button" class="kakao" >
						<img src="/resources/img/kakao로그인2.png" ></button></a>
					</div>   
				</div>	
			</div>
		</div>
	</table>
</form>

<script>
	$(frm).on("submit",function(e){
		e.preventDefault();
		var uid=$(frm.uid).val();
		var upass=$(frm.upass).val();
		
		$.ajax({
			type:"post",
			url:"/user/login",
			data:{uid:uid,upass:upass},
			success:function(data){
				if(data==0){
					alert("존재하지않는 아이디입니다!");
				}else if(data==2){
					alert("비밀번호가 일치하지 않습니다")
				}else if(data==3){
					alert("탈퇴된 회원입니다 복구관련 문의는 아래 고객센터로 문의해주십시오" + "\n"+"1588-0000")
					
				}else{
					var dest="${dest}";
					if(dest==null||dest==""){
						location.href="/";
					}else{
						location.href=dest;
					}
				}
			}
		})
	})
</script>