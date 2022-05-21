<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/userlist.css">
<div id="page">
	<div class="container">
	<div class="h1">
	<h1 class="pay1">결제목록</h1>
	<h1 class="luser1"><a href="/user/list">사용자목록</a></h1>
	</div>
	<div id="tbl"></div>
	<script id="temp" type="text/x-handlebars-template">	
		<tr class="userchk1">
			<td><input type="checkbox" id="chkAll"></td>
			<td><button id="delete" >배송체크</button>
		</tr>
	{{#each list}}
		<tr class="userlist1">
			<td class="user">
				<h5>상품이미지</h5>
				<img src="/display?fileName={{aimage}}" width=150>
			</td>
			<td class="user">
				<h5>주문자아이디</h5>
				<p class="uid">{{aid}}</p>
			</td>
			<td class="user">
				<h5>주문자성명</h5>
				<p class="uname">{{aname}}</p>
			</td>
			<td class="user">
				<h5>주문자전화</h5>
				<p class="utel">{{atell}}</p>
			</td>
			<td class="user" width="200">
				<h5>주문자주소</h5>
				<p class="uaddress">{{aaddress}} {{aaddress1}}</p>
			</td>
			<td class="user" width="150" style="display:{{display2 del}};">
				<h5>결제날짜</h5>
				<p class="uaddress1">{{adate}}</p>
			</td>
			<td class="user" width="150" style="display:{{display3 del}};">
				<h5>배송날짜</h5>
				<p class="uaddress2" abdate={{abdate}}>{{abdate}}</p>
			</td>
			<td class="user" width="150" style="display:{{display1 del}};">
				<h5>배송날짜</h5>
				<p class="uaddress3" abdate1={{abdate1}}>{{abdate1}}</p>
			</td>
			<td class="user" width="150">
				<h5>배송상태</h5>
				<p class="del" del={{del}}>{{display del}}</p>
			</td>
			<td class="user" width="150">
				<h5>번호</h5>
				<p class="ano" ano={{ano}}>{{ano}}</p>
			</td>
			<td class="user" ><input type="checkbox" class="chk" style="position:relative; top: 75px;"></td>
		</tr>
	{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("display", function(del){
			if(del == 1) return "결제완료";
			else if(del == 2 ) return "배송중";
			else return "배송완료";
		});
		
		Handlebars.registerHelper("display1", function(del){
			if(del == 1) return "none";
			else if(del == 2) return "none";
		});
		
		Handlebars.registerHelper("display2", function(del){
			if(del == 2) return "none";
			else if(del == 3) return "none";
		});
		
		Handlebars.registerHelper("display3", function(del){
			if(del == 1) return "none";
			else if(del == 3) return "none";
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
	   });
	
	
	//배송정보변경을 클릭한경우
	$("#tbl").on("click", "#delete", function(){
		if(!confirm("배송정보를 변경하시겠습니까?")) return;
		
		$("#tbl tr td .chk:checked").each(function(){
			var chk=$(this);
			var tr=$(this).parent().parent();
			var del=tr.find(".del").attr("del");
			var ano=tr.find(".ano").attr("ano");
			
			if(del==1){
				del=2;
				
				$.ajax({
					type: "post",
					url: "/manager/update",
					data: {del:del, ano:ano},
					success: function(){
						alert("처리 완료!");
						getList();
					}
				});
			}else if(del==2){
				del=3;
				
				$.ajax({
					type: "post",
					url: "/manager/update1",
					data: {del:del, ano:ano},
					success: function(){
						alert("처리 완료!");
						getList();
					}
				});
			}
		});
	});
	
	
	function getList(){
		$.ajax({
			type: "get",
			url: "/manager/list.json",
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