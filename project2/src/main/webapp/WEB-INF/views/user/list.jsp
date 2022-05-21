<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/userlist.css">
<div id="page">
	<div class="container">
	<h1 class="pay"><a href="/manager/list">결제목록</a></h1>
	<h1 class="luser">사용자목록</h1>
	<div id="tbl"></div>
	<script id="temp" type="text/x-handlebars-template">	
		<tr class="userchk">
			<td><input type="checkbox" id="chkAll"></td>
			<td><button id="delete" >선택유저 복구</button>
		</tr>
	{{#each list}}
		<tr class="userlist">
			<td class="user">
				<img src="/display?fileName={{uimage}}" width=150>
			</td>
			<td class="user">
				<p class="uid">{{uid}}</p>
			</td>

			<td class="user">
				<p class="uname">{{uname}}</p>
			</td>

			<td class="user">
				<p class="utel">{{utel}}</p>
			</td>

			<td class="user" width="200">
				<p class="uaddress">{{uaddress}}</p>
			</td>

			<td class="user" width="150">
				<p class="uaddress1">{{uaddress1}}</p>
			</td>

			<td class="user" width=150>
				<p class="ucode" ucode="{{ucode}}">{{displayDel ucode}}</p>
			</td>
			<td class="user" ><input type="checkbox" class="chk"></td>
		</tr>
	{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("displayDel", function(isDelete){
			if(isDelete == "3") return "탈퇴신청중인회원";
			else if(isDelete == "2" ) return "관리자 계정";
			else return "일반회원";
		});
	</script>
	
</div>
</div>
<script>
	var page=1;
	getList();
	
	$("#tbl").on("click","#chkAll",function(){
	      var checked = $('#chkAll').is(':checked');
	      if(checked)$('input:checkbox').prop('checked',true);
	      else $('input:checkbox').prop('checked',false);
	   })
	
	//유저복구 버튼을 클릭한경우
	$("#tbl").on("click", "#delete", function(){
		if(!confirm("선택한 유저를 복구처리하시겟어요?")) return;
		
		$("#tbl tr td .chk:checked").each(function(){
			var chk=$(this);
			var tr=$(this).parent().parent();
			var uid=tr.find(".uid").text();
			var check=$(this).html();
			var ucode="0"
			
			$.ajax({
				type: "post",
				url: "/user/delete",
				data: {ucode:ucode, check:check,uid:uid},
				success: function(){
					alert(check + "처리 완료!");
					getList();
				}
			});
			
		});
		
		//삭제버튼을 클릭한 경우
		$("#product").on("click", ".box .delete", function(){
			var code=$(this).attr("code");
			var check=$(this).html();
			if(!confirm(code + "번 상품을 " + check + "처리 하실래요?")) return;
			
			$.ajax({
				type: "get",
				url: "/product/delete",
				data: {code:code, check:check},
				success: function(){
					alert(check + "처리 완료!");
					getList();
				}
			});
		});
	
		
	});
	
	
	function getList(){
		$.ajax({
			type: "get",
			url: "/user/list.json",
			data: {page:page},
			dataType: "json",
			success: function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
			
				
			}
		});
	}
	
	$(".pagination").on("click", "a", function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getList();
	});
	
</script>