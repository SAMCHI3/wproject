<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/resources/css/boardlist.css">

<div id="page">
	<div class="container">
	<h1 >나만의 STYLE</h1>
	<table id="tbl"></table>
	<script id="temp" type="text/x-handlebars-template">
		<div class="board-button2">
			<button><a href="/board/insert">글쓰기</a></button>
		</div>
		<div class="board-button">
			<button class="famous" type="button"><a href="/board/top">인기</a></button>
			<button class="new" type="button"><a href="/board/list">최신</a></button>
		</div>

		<div>
		{{#each list}}
				<div class="box">
				<div class="bno" style="display: none;">{{bno}}</div>
				<div class="img"><img src="/display?fileName={{bimage}}"></div>
				<div class="bid">{{bid}}</div>
				<div class="bcon">{{bcontent}}</div>
				<input style="display:none" type="text" bcount={{bcount}} class="bcount">
				<input style="display:none" type="text" lbcnt="{{lbcnt}}" class="lbcnt">
				<input style="display:none" type="text" lno="{{lno}}" class="lno">
				<div class="like imote" style="display:{{display0 lbcnt}}"><button class="ibutton">0🤍{{bcount}}<span style="display:none;">{{lbcnt}}</span></button></div>
				<div class="ulike imote" style="display:{{display1 lbcnt}}"><button class="ibutton"><span style="display:none;">1</span>🤍{{bcount}}<span style="display:none;">{{lbcnt}}</span></button></div>
				<div class="lcancel imote" style="display:{{display2 lbcnt}}"><button class="ibutton"><span style="display:none;">2</span>❤️{{bcount}}<span style="display:none;">{{lbcnt}}</span></button></div>
				</div>
		{{/each}}
		</div>
	</script>
	<script>
	
	Handlebars.registerHelper("display0", function(lbcnt) {
        if (lbcnt == 1 || lbcnt == 2) {
           return "none";
        }
     });

	
  Handlebars.registerHelper("display2", function(lbcnt) {
        if (lbcnt == "" || lbcnt == 1) {
           return "none";
        }
     });
  
   
   Handlebars.registerHelper("display1", function(lbcnt) {
       if (lbcnt == ""||lbcnt == 2) {
          return "none";
       }
    });

       </script>  
<div class="pagination"></div>
</div>
</div>
<script>
 	var page=1;
 	var keyword="";
 	var uid="${uid}";


 	
 	//찜입력
 	$("#tbl").on("click",".like", function(e){
 		e.preventDefault();
 		
 		if(uid==""){
 			location.href="/user/login";
 		}
 		
 		var lbno=$(this).parent().find(".bno").html();
 		if(uid!=""){
 			if(lbcnt==null){
	 		 	var lid=$(this).parent().find(".bid").html();
	 		 	var bno=$(this).parent().find(".bno").html();
	 		 	var lbcnt=$(this).parent().find(".lbcnt").attr("lbcnt");
	 		 	var lbcnt=2;
	 		 	var bcount=$(this).parent().find(".bcount").attr("bcount");
	 		 	bcount=bcount+1;
 			}
  		
 			if(!confirm("찜하시겠습니까?")) return;			
 			$.ajax({
 				type:"post",
 				data:{lbcnt:lbcnt,bcount:bcount,lbno:lbno,lid:lid},
 				url:"/board/insert1",
 				success:function(data){
 					 alert("찜완료")
 					 getList();
 				}
 			})	
 		
 		
 		}
 	})
 	//찜수정
 		$("#tbl").on("click",".ulike",function(e){
 		e.preventDefault();
 		var lbcnt=$(this).parent().find(".lbcnt").attr("lbcnt");
 		if(uid==""){location.href="/user/login";}
 		var lno=$(this).parent().find(".lno").attr("lno");
 		var lbcnt=$(this).parent().find(".lbcnt").attr("lbcnt");
 		if(lbcnt==1){
 			var lid=$(this).parent().find(".bid").html();
 		 	var lbno=$(this).parent().find(".bno").html();
 		 	var lbcnt=2;
 		 	var bno=$(this).parent().find(".bno").html();
 		 	var bcount=$(this).parent().find(".bcount").attr("bcount");
 		 	bcount=bcount+1;
 		 	lno;
		}
		if(!confirm("찜하시겠습니까?")) return;			
			$.ajax({
				type:"post",
 				data:{lbcnt:lbcnt,lbno:lbno,bcount:bcount,lid:lid,lno:lno,bno:bno},
 				url:"/board/update1",
				success:function(data){
					 alert("찜완료")
					 getList();
				}
			})	
 	})
 			 
 	//찜 취소
 	$("#tbl").on("click",".lcancel",function(e){
 		e.preventDefault();
 		
 		var lbcnt=$(this).parent().find(".lbcnt").attr("lbcnt");
 		if(uid==""){
 			location.href="/user/login";
 			}
 		if(lbcnt==2){
 			var lno=$(this).parent().find(".lno").attr("lno");
 		
 			var lid=$(this).parent().find(".bid").html();
 		 	var lbno=$(this).parent().find(".bno").html();
 		 	var lbcnt=1;
 		 	var bno=$(this).parent().find(".bno").html();
 		 	var bcount=$(this).parent().find(".bcount").attr("bcount");
 		 	bcount=bcount-1;
 		 	lno;
 		 	if(!confirm("찜취소하시겠습니까?")) return;			
 			$.ajax({
 				type:"post",
 				data:{lbcnt:lbcnt,lbno:lbno,bcount:bcount,lid:lid,lno:lno,bno:bno},
 				url:"/board/update2",
 				success:function(data){
 					alert("찜취소")
 					 getList();
 				}
 			})	
 			
 			
 		}
 	})	 
 
 	$("#tbl").on("click",".top",function(){
 		getTop();
 		function getTop(){
 		$.ajax({
			type:"get",
			url:"/board/top.json",
			data:{page:page,keyword:keyword},
			dataType:"json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				$(".pagination").html(getPagination(data));
				}
			})
 		}
	$(".pagination").on("click","a",function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getTop();
		})
 	})
 	
 	
 	$("#tbl").on("click",".img",function(){
 		var bno=$(this).parent().find(".bno").html();
 		var bid=$(this).parent().find(".bid").html();
 		location.href="/board/read?bno=" + bno+"&bid="+bid;
 	})
 	//검색어 엔터
	$("#keyword").on("keypress",function(e){
		if(e.keyCode==13) $("#search").click()
	});
	
	//검색클릭
	$("#search").on("click",function(){
		keyword=$("#keyword").val();
		page=1;
		getList();
	});
 	
	getList();
	function getList(){
		$.ajax({
			type:"get",
			url:"/board/list.json",
			data:{page:page,keyword:keyword},
			dataType:"json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				$(".pagination").html(getPagination(data));
			}
		})
	}
	$(".pagination").on("click","a",function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getList();
	})
	
	
</script>