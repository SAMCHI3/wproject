<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">  
	<link rel="stylesheet" href="/resources/css/about.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<body>

	<div id="carouselExampleIndicators" class="carousel slide mt-5" data-bs-ride="carousel">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner back inner">
    <div class="carousel-item active">
      <a href="https://kream.co.kr/promotions/171"><img src="/resources/img/카드할인.jpg" class="d-block w-100" alt="..." style="height:500px; object-fit: contain; background:#5F2BD8;"></a>
    </div>
    <div class="carousel-item">
      <img src="/resources/img/자켓.jpg" class="d-block w-100" alt="..." " style="height:500px; object-fit: contain; background:#4176C4;">
    </div>
    <div class="carousel-item">
      <img src="/resources/img/슈프림배경.jpg" class="d-block w-100" alt="..." " style="height:500px; object-fit:contain; background:#F4F4F4;">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>

<div id="tbl1" style="width:1300px;">
	<div>
		<div class="pro1">
			<a href="/product/new">
				<img src="/resources/img/new1.webp" />
			</a>
			<p>New</p>
		</div>
		<div class="pro1">
			<a href="/productList/list?keyword=나이키">
				<img src="/resources/img/아디다스로고.jpg" 
				style="object-fit:contain; background:black;"
				/>
			</a>
			<p>인기브랜드</p>
		</div>
		<div class="pro1">
			<a href="https://kream.co.kr/promotions/43">
				<img src="/resources/img/빠른배송.webp"/>
			</a>
			<p>빠른배송</p>
		</div>
		<div class="pro1">
			<a href="/productList/list?keyword=샤넬">
				<img src="/resources/img/명품가방.webp"/>
			</a>
			<p>명품</p>
		</div>
	</div>
</div>      
<div style="padding: 50px 50px; width: 70%; height: 700px; margin:0px auto;">
	<div class="title1">
		<h3 style="text-align:center;"><strong>인기상품</strong></h3><br>
	</div>
	<div id="slider-div"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each list}}
		<div class="pro">
			<div><a href="/productList/read?pmodel={{pmodel}}"><img src="/display?fileName={{pimage}}" width=150 border-radius=15></a></div>
			<div><p class="ellipsis pename">{{pename}}</p></div>
			<div><p class="ellipsis pkname">{{pkname}}</p></div>
			<div><p class="ellipsis pbrand">{{pbrand}}</p></div>
			<div><p class="ellipsis plprice">{{plprice}}</p></div>
		</div>
		{{/each}}
	</script>
</div>
<div><img src="/resources/img/캠퍼스룩.jpg" style="width:100%; height:500px; object-fit:contain; background:#4E69A0;"></div>
<div style="padding: 50px 50px; width: 70%; height: 700px; margin:0px auto;">
	<div class="title1">
		<h3 style="text-align:center;"><strong>최신상품</strong></h3><br>
	</div>
	<div id="slider-div1"></div>
	<script id="temp1" type="text/x-handlebars-template">
		{{#each list2}}
		<div class="pro">
			<div><a href="/productList/read?pmodel={{pmodel}}"><img src="/display?fileName={{pimage}}" width=150></a></div>
			<div><p class="ellipsis pename">{{pename}}</p></div>
			<div><p class="ellipsis pkname">{{pkname}}</p></div>
			<div><p class="ellipsis pbrand">{{pbrand}}</p></div>
			<div><p class="ellipsis ssell">{{display ssell}}원</p></div>
		</div>
		{{/each}}
	</script>
</div>
</body>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script>
	//최신상품슬라이드
	function destroyCarousel() {
	    if ($('#slider-div1').hasClass('slick-initialized')) {
	        $('#slider-div1').slick('unslick');
	    }
	}

    
    $.ajax({
		type:"get",
		dataTtpe:"json",
		url: "/product/list2.json",
		success:function(data){
			var template = Handlebars.compile($("#temp1").html());
			$("#slider-div1").html(template(data));	
			applySlider1();
		}
	});
	</script>
	<script>
		Handlebars.registerHelper("display", function(ssell){
		      return ssell.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		   });
	</script>


<script>  
    
    
    function applySlider1(){
        $('#slider-div1').slick({
            slide : 'div',  //슬라이드 되어야 할 태그 ex) div, li 
            infinite : true,  //무한 반복 옵션
            slidesToShow :4,  // 한 화면에 보여질 컨텐츠 개수
            slidesToScroll : 1,  //스크롤 한번에 움직일 컨텐츠 개수
            speed : 500,  // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
            arrows : true,  // 옆으로 이동하는 화살표 표시 여부
            dots : false,  // 스크롤바 아래 점으로 페이지네이션 여부
            autoplay : true,  // 자동 스크롤 사용 여부
            autoplaySpeed : 2000,  // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
            pauseOnHover : true,  // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
            vertical : false,  // 세로 방향 슬라이드 옵션
            prevArrow : "<button type='button' class='prev'>◁</button>",  // 이전 화살표 모양 설정
            nextArrow : "<button type='button' class='next'>▷</button>",  // 다음 화살표 모양 설정
            dotsClass : "slick-dots",  //아래 나오는 페이지네이션(점) css class 지정
            draggable : false,  //드래그 가능 여부 

            // 반응형 웹구현 옵션
            responsive : [
                {
                    breakpoint : 1200,  //화면 사이즈 960px
                    settings : { slidesToShow : 3 }  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                },
                {
                    breakpoint : 768,  //화면 사이즈 768px
                    settings : { slidesToShow : 2 }  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
                }
            ]
        });
    };

	//인기상품 슬라이드
	function destroyCarousel() {
	    if ($('#slider-div').hasClass('slick-initialized')) {
	        $('#slider-div').slick('unslick');
	    }
	}

	    
	    $.ajax({
			type:"get",
			dataTtpe:"json",
			url: "/product/list.json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#slider-div").html(template(data));	
    			applySlider();
			}
		});
	    
	    
	    
	    function applySlider(){
	        $('#slider-div').slick({
	            slide : 'div',  //슬라이드 되어야 할 태그 ex) div, li 
	            infinite : true,  //무한 반복 옵션
	            slidesToShow :4,  // 한 화면에 보여질 컨텐츠 개수
	            slidesToScroll : 1,  //스크롤 한번에 움직일 컨텐츠 개수
	            speed : 500,  // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
	            arrows : true,  // 옆으로 이동하는 화살표 표시 여부
	            dots : false,  // 스크롤바 아래 점으로 페이지네이션 여부
	            autoplay : true,  // 자동 스크롤 사용 여부
	            autoplaySpeed : 2000,  // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
	            pauseOnHover : true,  // 슬라이드 이동    시 마우스 호버하면 슬라이더 멈추게 설정
	            vertical : false,  // 세로 방향 슬라이드 옵션
	            prevArrow : "<button type='button' class='prev'>◁</button>",  // 이전 화살표 모양 설정
	            nextArrow : "<button type='button' class='next'>▷</button>",  // 다음 화살표 모양 설정
	            dotsClass : "slick-dots",  //아래 나오는 페이지네이션(점) css class 지정
	            draggable : false,  //드래그 가능 여부 

	            // 반응형 웹구현 옵션
	            responsive : [
	                {
	                    breakpoint : 1200,  //화면 사이즈 960px
	                    settings : { slidesToShow : 3 }  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
	                },
	                {
	                    breakpoint : 768,  //화면 사이즈 768px
	                    settings : { slidesToShow : 2 }  //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
	                }
	            ]
	        });
	    };

</script>

