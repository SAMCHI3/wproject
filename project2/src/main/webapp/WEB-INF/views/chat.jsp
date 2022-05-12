<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style>
	.sender.right {display:none;}
	.delete.left {display:none;}
</style>
<html>
	<head>
		<title>채팅방</title>
		<link rel="stylesheet" href="/resources/chat.css">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
	</head>
<body>
	<div class="chat_wrap">
		<div class="header">채팅방 (${uid})</div>
		<div id="chat"></div>
		<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
			<div class="{{display sender}}">
				<div class="sender {{display sender}}">
					<img src="display?fileName={{image}}" style="width:50px; border-radius:50%;">{{sender}}
				</div>
				<div class="message">
					{{message}}
					<a href="{{id}}" class="delete {{display sender}}">x</a>
				</div>
				<div class="date">{{regdate}}</div>
			</div>
		{{/each}}
		</script>
		<script>
			Handlebars.registerHelper("display", function(sender){
				if(sender=="${uid}"){
					return "right";
				}else{
					return "left";
				}
			});
		</script>
		<div class="input-div">
			<textarea id="txtMessage" placeholder="내용을입력하세요"></textarea>
		</div>
	</div>
</body>
<script>
	var uid="${uid}";
	getList();
	
	function getList(){
		$.ajax({
			type: "get",
			dataType: "json",
			url: "/chat/list.json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#chat").html(template(data));
				window.scrollTo(0, $("#chat").prop("scrollHeight"));
			}
		});
	}
	
	$("#chat").on("click", ".message a", function(e){
		e.preventDefault();
		var id=$(this).attr("href");
		if(!confirm(id + "글을 삭제하실래요?")) return;
		$.ajax({
			type: "post",
			url: "/chat/delete",
			data: {id:id},
			success:function(){
				getList();
				sock.send("delete");
			}
		});
	});
	
	$("#txtMessage").on("keydown", function(e){
		if(e.keyCode==13 && !e.shiftKey){
			e.preventDefault();
			var message=$(this).val();
			if(message==""){
				alert("보내실 내용을 입력하세요!");
				return;
			}
			
			//채팅데이터입력
			$.ajax({
				type:"post",
				url: "/chat/insert",
				data: {sender:uid, message:message},
				success:function(){
					sock.send("insert");
					$("#txtMessage").val("");
				}
			});
		}
	});
	
	//소켓설정
	var sock = new SockJS("http://localhost:8088/sock_chat");
	sock.onmessage = onMessage;
	//서버에서 메시지를 받을때 (클라이언트)
	function onMessage(msg){
		getList();
	}
</script>
</html>










