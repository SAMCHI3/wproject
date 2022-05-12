<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="/resources/css/passupdate.css" rel="stylesheet" >
<div id="page">
<div class="container">
   <h1>비밀번호재발급</h1>
   <form name="frm"  enctype="multipart/form-data">
      <div style="position:relative; top:100px;">
      <table style="display: inline-block;">
         <tr>
            <td class="title" width=100>아이디</td>
            <td width=500>
               <input type="text" name="uid" class="uinput">
               <button type="button" id="check" class="ubutton">아이디체크</button>
            </td>
         </tr>
         <tr>
            <td class="title" width=100>유저이메일</td>
            <td width=500>
               <input type="text" name="uemail" class="uinput">
               <button type="button" id="check2" class="ubutton">이메일체크</button>
            </td>
         </tr>
            <tr>
            <td class="title" width=100>유저이름</td>
            <td width=500>
               <input type="text" name="uname" class="uinput">
               <button type="button" id="check3" class="ubutton">유저이름체크</button>
            </td>
         </tr>
         </tr>
            <tr>
            <td class="title" width=100>전화번호</td>
            <td width=500>
               <input type="text" name="utel"  placeholder="-를 붙여서 써주세요" class="uinput">
               <button type="button" id="check4" class="ubutton">전화번호확인</button>
            </td>
         </tr>
         <tr>
            <td class="title" width=100></td>
            <td width=500>
               <input type="hidden" name="upass" value="pass" class="uinput">
            </td>
         </tr>
      </table>
      <div style="text-align:center;margin-top:10px;"class="update-button">
         <button type="submit">재발급</button>
         <button type="reset">정보리셋</button>
      </div>
   </form>
   </div>
   </div>
</div>

<script>
   var check=false;
   var check2=false;
   var check3=false;
   var check4=false;
   $("#check").on("click", function(){
      var uid=$(frm.uid).val();
      if(uid==""){
         alert("아이디를 입력하세요!");
         $(frm.uid).focus();
         return;
      }
      
      $.ajax({
         type: "post",
         url: "/user/inserttest",
         data: {uid:uid},
         success: function(data){
            if(data==0){
               alert("존재하지않는아이디입니다!");
            
            }else if(data==1){
               alert("존재하는아이디입니다!");
               check=true;
            }else if(data==2){
               alert("존재하는아이디입니다!");
               check=true;
            }else{
               alert("존재하는아이디입니다!");
               check=true;
            }
         }
      });
   });
   $("#check2").on("click", function(){
      var uemail=$(frm.uemail).val();
      if(uemail==""){
         alert("이메일을 입력하세요!");
         $(frm.uemail).focus();
         return;
      }
      
      $.ajax({
         type: "post",
         url: "/user/inserttest2",
         data: {uemail:uemail},
         success: function(data){
            if(data==0){
               alert("존재하지않는이메일입니다!");
            }else if(data==1){
               alert("존재하는 이메일입니다!");
               check2=true;
            }else if(data==2){
               alert("존재하는 이메일입니다!");
               check2=true;
            }
         }
      });
   });
   $("#check3").on("click", function(){
      var uname=$(frm.uname).val();
      if(uname==""){
         alert("유저이름을 입력하세요!");
         $(frm.uname).focus();
         return;
      }
      
      $.ajax({
         type: "post",
         url: "/user/inserttest3",
         data: {uname:uname},
         success: function(data){
            if(data==0){
               alert("존재하지않는 유저이름입니다!");
            }else if(data==1){
               alert("존재하는 유저이름입니다!");
               check3=true;
            }else if(data==2){
               alert("존재하는 유저이름입니다!");
               check3=true;
            }
         }
      });
   });
   
   $("#check4").on("click", function(){
      var utel=$(frm.utel).val();
      if(utel==""){
         alert("유저전화번호을 입력하세요!");
         $(frm.utel).focus();
         return;
      }
      
      $.ajax({
         type: "post",
         url: "/user/inserttest4",
         data: {utel:utel},
         success: function(data){
            if(data==0){
               alert("존재하지않는 전화번호입니다!");
            }else if(data==2){
               alert("존재하는 전화번호입니다!");
               check4=true;
            }
         }
      });
   });
   
   $(frm).on("submit",function(e){
      e.preventDefault();
      
      
      if(!check){
         alert("아이디 중복 체크를 하세요!");
         return;
      }
      
      if(!check2){
         alert("이메일 중복 체크를 하세요!");
         return;
      }
      
      if(!check3){
         alert("유저이름 중복 체크를 하세요!");
         return;
      }
      
      if(!check4){
         alert("전화번호 중복 체크를 하세요!");
         return;
      }
      
   
      var uemail=$(frm.uemail).val();
      var uid=$(frm.uid).val();
      var uname=$(frm.uname).val();
      var utel=$(frm.utel).val();
      var upass=$(frm.upass).val();
      
      alert(uemail+"\n"+uid+"\n"+upass+"\n"+uname+"\n"+utel);
      
   
         if(!confirm("비밀번호를 재발급받으시겟습니까?")) return;
           frm.method="post";
         frm.action="updatereset";
         alert("재발급비밀번호는 pass입니다 변경을원하시면 개인정보수정페이지에서 변경해주십시오")
           frm.submit();      
      });
</script>