<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="/resources/css/notice.css" rel="stylesheet" >
<div id="page" class="container">
	<div class="notice-home">
		<h1 style="font-weight:bold;">공지사항</h1>
		<ul>
			<li><a href="/notice/home?ucode=${ucode}" style="color:black"><strong>공지사항</strong></a></li>
			<li><a href="/notice/nfaq?ucode=${ucode}">자주묻는 질문</a></li>
			<li><a href="/notice/npo?ucode=${ucode}">검수기준</a></li>
		</ul>
	</div>

<div class="notice-home2">
	<h2>공지사항</h2>
		<div id="tbl"></div>
		<script id="temp" type="text/x-handlebars-template">
	{{#each list}}
		<tr>
			<td width="150">
				<button class="ntitle"><a href="/notice/read?ncount={{ncount}}"> {{ntitle}}</a></button>
			</td>
		</tr>
	{{/each}}
	</script>	
	</div>
	<div>
		<ul>
			<li>
				<c:if test="${ucode== 2}">
					<button class="insert"><a href="/notice/insert?uid=${uid}">글쓰기</a></button>
				</c:if>
			</li>
		</ul>
	</div>
</div>
<script>
	var page=1;
	getList();
	
function getList(){
	$.ajax({
		type: "get",
		url: "/notice/list.json",
		data: {page:page,ncode1:"1",ncode2:"1"},
		dataType: "json",
		success: function(data){
			var template = Handlebars.compile($("#temp").html());
			$("#tbl").html(template(data));
		
			
		}
	});
}
</script>
