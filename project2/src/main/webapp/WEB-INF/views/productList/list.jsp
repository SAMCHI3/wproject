<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<style>
	.title {white-space: nowrap;
  			overflow: hidden;
  			text-overflow: ellipsis;}	
	</style>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/resources/css/list.css" rel="stylesheet" >
	<div id="page">
	<div class="shop-search">
		<div class="buttonbox">
			<input type="text" placeholder="검색어" id="keyword"> 
			<input type="button" value="검색" id="search">
		</div>
	</div>
<div class="container">
	<c:if test="${ucode== 2}">
   <button class="insert">상품등록</button>
   </c:if>
	<h1 style="font-family: 'Cafe24Ssurround';">SHOP</h1>
		<div class="searchkey">
			<button><img src="/resources/img/search.png"></button>
		</div>
	<div class="page-list">
		<div id="category">
			<div id="ct" style=" cursor:pointer;">
				<div id=cg>카테고리</div>
				<ul id="ctmenu" style="display: none;">
					<div id="ctmenu-top"  style="margin-bottom:10px;">
						<input type="checkbox" value="sh" class="chksh">신발
					</div>
					<div id="ctmenu-m" name="shdiv">
						<ul id="ctmenu-subsh">
							<li><input type="radio" value="allsh" name="sh">전체상품</li>
							<li><input type="radio" value="sn" name="sh">스니커즈</li>
							<li><input type="radio" value="lo" name="sh">로퍼/플랫</li>
							<li><input type="radio" value="sa" name="sh">샌들/슬리퍼</li>
							<li><input type="radio" value="bo" name="sh">부츠</li>
						</ul>
					</div>
					<div id="ctmenu-top1" style="margin-bottom:10px;">
						<input type="checkbox" value="cl" class="chkcl">의류
					</div>
					<div id="ctmenu-m1" style="display: none;">
						<ul id="ctmenu-subcl">
							<li><input type="radio" value="allcl" name="cl" checked>전체상품</li>
							<li><input type="radio" value="pd" name="cl">패딩</li>
							<li><input type="radio" value="ct" name="cl">코트</li>
							<li><input type="radio" value="jk" name="cl">자켓</li>
							<li><input type="radio" value="hd" name="cl">후드</li>
							<li><input type="radio" value="ss" name="cl">스웨트셔츠</li>
							<li><input type="radio" value="cd" name="cl">니트웨어</li>
							<li><input type="radio" value="lts" name="cl">긴팔티셔츠</li>
							<li><input type="radio" value="sts" name="cl">반팔티셔츠</li>
							<li><input type="radio" value="ts" name="cl">셔츠</li>
							<li><input type="radio" value="pt" name="cl">바지</li>
							<li><input type="radio" value="spn" name="cl">반바지</li>
							<li><input type="radio" value="et" name="cl">기타</li>
						</ul>
					</div>
					<li class="ctmenu-top"><input type="checkbox" value="etc" class="etc">잡화</li>
					<li class="ctmenu-top"><input type="checkbox" value="1" class="lux">럭셔리</li>
				
				</ul>
			</div>
			<div id="br">브랜드</div>
				<ul id="ctmenu-br" style="display: none;">
					<li><input type="radio" value="allbr" name="pbrand" checked>전체상품</li>
					<li><input type="radio" value="Balenciaga" name="pbrand">Balenciaga</li>
					<li><input type="radio" value="Gucci" name="pbrand">Gucci</li>
					<li><input type="radio" value="Dior" name="pbrand">Dior</li>
					<li><input type="radio" value="Essentials" name="pbrand">Essentials</li>
					<li><input type="radio" value="IAB Studio" name="pbrand">IAB Studio</li>
					<li><input type="radio" value="Louis Vuitton" name="pbrand">Louis Vuitton</li>
					<li><input type="radio" value="Supreme" name="pbrand">Supreme</li>
					<li><input type="radio" value="Stone Island" name="pbrand">Stone Island</li>
					<li><input type="radio" value="Apple" name="pbrand">Apple</li>
					<li><input type="radio" value="Casio" name="pbrand">Casio</li>
					<li><input type="radio" value="Chanel" name="pbrand">Chanel</li>
					<li><input type="radio" value="Samsung" name="pbrand">Samsung</li>
					<li><input type="radio" value="Hermes" name="pbrand">Hermes</li>
					<li><input type="radio" value="Kaws" name="pbrand">Kaws</li>
					<li><input type="radio" value="Human Made" name="pbrand">Human Made</li>
					<li><input type="radio" value="Bearbrick" name="pbrand">Bearbrick</li>
					<li><input type="radio" value="Nike" name="pbrand">Nike</li>
					<li><input type="radio" value="Palace" name="pbrand">Palace</li>
					<li><input type="radio" value="Rolex" name="pbrand">Rolex</li>
					<li><input type="radio" value="Adidas Yeezy" name="pbrand">Adidas Yeezy</li>
					<li><input type="radio" value="Adidas" name="pbrand">Adidas</li>
					<li><input type="radio" value="Asics" name="pbrand">Asics</li>
					<li><input type="radio" value="New Balance" name="pbrand">New Balance</li>
				</ul>
			<div id="si">사이즈</div>
			<div id="pr">가격</div>
		</div>
		
		<div id="brand">
			<div class="brand-list">
			<a href="?keyword=나이키">
            <img src="/resources/img/조던.jpg" width=200 height=120/>
         </a>
            <p>나이키</p>
         </div>
         <div class="brand-list">
            <a href="?keyword=슈프림">
               <img src="/resources/img/슈프림.jpg" width=200 height=120/>
            </a>
            <p>슈프림</p>
         </div>
         <div class="brand-list">
            <a href="?keyword=샤넬">
               <img src="/resources/img/샤넬.png" width=200 height=120/>
            </a>
            <p>샤넬</p>
         </div>
         <div class="brand-list">
            <a href="?keyword=발렌시아가">
               <img src="/resources/img/발렌시아가.jpg" width=150 height=120/>
            </a>
            <p>발렌시아가</p>
			</div>
		</div>

		<table id="tbl" width="100%"></table>
		<script id="temp" type="text/x-handlebars-template">
		
		{{#each ct}}
			<ul 
			style="float: left;
    width: 300px;
    margin: 40px;
    text-align: center;">
				<li><img src="/display?fileName={{pimage}}" 
					style="width:300px; border-radius:15px;" class="img5" 
					pmodel={{pmodel}} onClick="getRead()"></li>
				<li style="font-weight:bold;">{{pbrand}}</li>
				<li class="title">{{pename}}</li>
				<li class="title" style="color:gray;">{{pkname}}</li>
				<li >{{plprice}}</li>
				<li class="lpcnt" lpcnt={{lpcnt}}><span style="display:none;">{{lpcnt}}</span><li>
			</ul>
		{{/each}}
	
	</script>
	</div>
		<div class="pagination" style="margin-top:50px;"></div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
<script>
	$(".searchkey").on("click", function(){
		$(".shop-search").addClass("shop-modal");
	});


	$("#search").on("click", function(){
		$(".shop-search").removeClass("shop-modal");
	});


	
</script>
<script>
	document.querySelector(".shop-search").addEventListener("click", function(e){
		console.log(e.target);
		console.log(document.querySelector(".shop-search"));
		if(e.target == document.querySelector(".shop-search")){
			document.querySelector(".shop-search").classList.remove("shop-modal");
		};
	});
	//$(".shop-search").on("click", function(e){
		//if ($(e.target) == $(".shop-search")){
			//$(".shop-search").removeClass("shop-modal");
		// }
	// });
</script>
<script>
	var page = 1;
	var keyword = "${param.keyword==null ? '':param.keyword}";
	var pcode = "";
	var pccode = "";
	var pbrand = "";
	var plprice = "";
	var plux = "";
	var uid="${uid}"
	
		
		function getRead(){
			$(".img5").on("click", function(){
				var pmodel=$(this).attr('pmodel');
				var lpcnt=$(this).parent().parent().find(".lpcnt").attr('lpcnt');
				if(uid==""){
					location.href="/productList/read?pmodel=" + pmodel;
				}else if(uid!="" && lpcnt==0){
					location.href="/productList/read?pmodel=" + pmodel + "&uid=" + uid 
				}else if(uid!="" && lpcnt != 0){
					location.href="/productList/read?pmodel=" + pmodel + "&uid=" + uid + "&lpcnt=" + lpcnt;
				}
			});
		};
	
	//카테고리열기
	$("#cg").on("click", function() {
		$("#ctmenu").toggle()
	});
	//브랜드열기
	$("#br").on("click", function() {
		$("#ctmenu-br").toggle()
	});

	//카테고리밑에 신발체크
	getSh();
	function getSh(){
		$(".chksh").on("click", function() {
			if ($(".chksh").is(":checked") == false) {
				$(".chksh").prop("checked", false);
				$("#ctmenu-m").toggle();
				getList();
			} else {
				$(".chksh").prop("checked", true);
				$("#ctmenu-m").toggle();
				var pcode = $(".chksh").val();
			};
			$("#ctmenu-subsh").on("click", function() {
				pccode = $('input[name="sh"]:checked').val();
				if (pccode == "allsh") {
					pccode = "";
				}
				
				$.ajax({
					type : "get",
					url : "/productList/category.json",
					data : {
						page : page,
						keyword : keyword,
						pcode:pcode,
						pccode:pccode,
						pbrand:pbrand,
						plprice:plprice,
						plux:plux
					},
					dataType : "json",
					success : function(data1) {
						var template = Handlebars.compile($("#temp").html());
						$("#tbl").html(template(data1));
						$(".pagination").html(getPagination(data1));
					}
				})
			})	
		});
	};
	
	//카테고리밑에 의류체크
	getCl();
	function getCl(){
		$(".chkcl").on("click", function() {
			if ($(".chkcl").is(":checked") == false) {
				$(".chkcl").prop("checked", false);
				$("#ctmenu-m1").toggle();
				getList();
			} else {
				$(".chkcl").prop("checked", true);
				$("#ctmenu-m1").toggle();
				var pcode = $(".chkcl").val();
			};
			$("#ctmenu-subcl").on("click", function() {
				pccode = $('input[name="cl"]:checked').val();
				if (pccode == "allcl") {
					pccode = "";

				}

				$.ajax({
					type : "get",
					url : "/productList/category.json",
					data : {
						page : page,
						keyword : keyword,
						pcode:pcode,
						pccode:pccode,
						pbrand:pbrand,
						plprice:plprice,
						plux:plux
					},
					dataType : "json",
					success : function(data1) {
						var template = Handlebars.compile($("#temp").html());
						$("#tbl").html(template(data1));
						$(".pagination").html(getPagination(data1));
					}
				})
			})	
		});
	};
	
	//카테고리밑에 잡화체크
	getEtc();
	function getEtc(){
		$(".etc").on("click", function() {
			if ($(".etc").is(":checked") == false) {
				$(".etc").prop("checked", false);
				getList();
			} else {
				$(".etc").prop("checked", true);
				var pcode = $(".etc").val();
			};
				$.ajax({
					type : "get",
					url : "/productList/category.json",
					data : {
						page : page,
						keyword : keyword,
						pcode:pcode,
						pccode:pccode,
						pbrand:pbrand,
						plprice:plprice,
						plux:plux
					},
					dataType : "json",
					success : function(data1) {
						var template = Handlebars.compile($("#temp").html());
						$("#tbl").html(template(data1));
						$(".pagination").html(getPagination(data1));
					}
				})
			})	
	};
	
	//카테고리밑에 브랜드체크
	getbr();
	function getbr(){
		$("#ctmenu-br").on("click", function() {
			$("#ctmenu-br").on("click", function() {
				pbrand = $('input[name="pbrand"]:checked').val();
				if (pbrand == "allbr") {
					pbrand = "";

				}

				$.ajax({
					type : "get",
					url : "/productList/category.json",
					data : {
						page : page,
						keyword : keyword,
						pcode:pcode,
						pccode:pccode,
						pbrand:pbrand,
						plprice:plprice,
						plux:plux
					},
					dataType : "json",
					success : function(data1) {
						var template = Handlebars.compile($("#temp").html());
						$("#tbl").html(template(data1));
						$(".pagination").html(getPagination(data1));
					}
				})
			})	
		});
	};
	
	//카테고리밑에 럭셔리체크
	getLux();
	function getLux(){
		$(".lux").on("click", function() {
			if ($(".lux").is(":checked") == false) {
				$(".lux").prop("checked", false);
				var plux="";
				getList();
			} else {
				$(".lux").prop("checked", true);
				var plux = $(".lux").val();
			};

				$.ajax({
					type : "get",
					url : "/productList/category.json",
					data : {
						page : page,
						keyword : keyword,
						pcode:pcode,
						pccode:pccode,
						pbrand:pbrand,
						plprice:plprice,
						plux:plux
					},
					dataType : "json",
					success : function(data1) {
						var template = Handlebars.compile($("#temp").html());
						$("#tbl").html(template(data1));
						$(".pagination").html(getPagination(data1));
					}
				})
			})	
	};
	
	
	//신발라디오버튼값가져오기
// 	$("#ctmenu-subsh").on("click", function() {
// 		pccode = $('input[name="sh"]:checked').val();
// 		if (pccode == "allsh") {
// 			pccode = "";
// 		}
// 		alert(pccode);
// 	});
	
// 	//카테고리밑에 의류체크
// 	$(".chkcl").on("click", function() {
// 		if ($(".chkcl").is(":checked") == false) {
// 			$(".chkcl").prop("checked", false);
// 			$("#ctmenu-m1").toggle();
// 		} else {
// 			$(".chkcl").prop("checked", true);
// 			$("#ctmenu-m1").toggle();
// 			var pcode = $(".chkcl").val();
// 			alert(pcode);
// 		}
// 		;
// 	});
	
// 	//의류라디오버튼값가져오기
// 	$("#ctmenu-subcl").on("click", function() {
// 		$('input[name="sh"]').removeAttr('checked');
// 		pccode = $('input[name="cl"]:checked').val();
// 		if (pccode == "allcl") {
// 			pccode = "";
// 		}
// 		alert(pccode);
// 	});


	//검색어 엔터
	$("#keyword").on("keypress", function(e) {
		if (e.keyCode == 13)
			$("#search").click()
	});

	//검색클릭
	$("#search").on("click", function() {
		keyword = $("#keyword").val();
		page = 1;
		getList();
	});

	getList();
	function getList() {
		$.ajax({
			type : "get",
			url : "/productList/list.json",
			data : {
				page : page,
				keyword : keyword
			},
			dataType : "json",
			success : function(data) {
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
				$(".pagination").html(getPagination(data));
			}

		})
	}
	$(".pagination").on("click", "a", function(e) {
		e.preventDefault();
		page = $(this).attr("href");
		getList();
		getSh();
	})
	
	//상품등록
   $("#page").on("click",".insert",function(){
      location.href="insert";
   })
	
// 	$(".pagination").on("click", "a", function(e) {
// 		e.preventDefault();
// 		page = $(this).attr("href");
// 		getSh();
// 	})
</script>