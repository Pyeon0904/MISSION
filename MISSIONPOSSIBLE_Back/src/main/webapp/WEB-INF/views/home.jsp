<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>작전 : MISSION</title>
<meta charset="UTF-8">


<!-- slick 라이브러리 (슬라이드) -->
	<link rel="stylesheet" type="text/css" href="${path}/resources/slick/slick.css"/>
	<link rel="stylesheet" type="text/css" href="${path}/resources/slick/slick-theme.css"/>
	<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

<%@ include file="/WEB-INF/views/common/headerDetail.jsp"%>
<script  src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<!-- 폰트 -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumBarunGothic@latest/nanumbarungothicsubset.css">
<style type="text/css">

@font-face { font-family: 'NanumBarunGothic';
src: url('/font/NanumBarunGothic.eot');
src: url('/font/NanumBarunGothic.eot') format('embedded-opentype'),
url('/font/NanumBarunGothic.woff') format('woff');}

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video 
{
font-family: 'NanumBarunGothic', sans-serif;
}
 a { text-decoration: none; color: black; }
 
/* 전체 영역--------------------------------------------------------------------------*/

/*---------------제일 바깥 영역 설정-----------------*/
	#box {
	   background-color: none;
	   width: 100%;
	   height: auto; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
	   margin-top: 0px;
	   margin-bottom: 100px;
	   margin-left: -10px;
	   padding: 10px;
	}
/*-------------------컨텐츠 영역---------------------*/
	#conbox {
	   width: 1200px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
	   position: relative;
	   top: 20px;
	   margin: auto;
	}

/* ----------------------------------------------------------------------------------- */

/* 각이미지 위치 ------------------------------------------------------------ */	
/* 1. 페이지 최상단(헤더아래) ------------------------------------- */
	.pageTitleText{
		margin-left: -60px;
		margin-top : 230px;
	}
	.pageTitleButton{
		margin-left: -100px;
		margin-top : 20px;
	}
	.pageTitleLogo{
		margin-left: 600px;
		margin-top : -600px;
	}
	
	.pageTitle2{
		margin-left: 0px;
	}

/* 2. 챌린지 홍보 슬라이드 쇼 (3장짜리)------------------------------ */
	.visual{
		position:relative;
		margin-left: 0px;
		margin-top:50px;
		text-align:center;
	}
	.visual button{
		position:absolute;
		z-index:10;
		top:45%;
		transform:translateY(-50%);
		border-radius:100%;
		border:none;
		width:71px;
		height:71px;
		background:rgba(0,0,0,0);
		border:none;
	}
	.visual button:before{
		font-family:'xeicon';
		color:#1afc1a;
		font-size:45px;
	}
	.visual button.slick-prev{
		left:0;
		margin-left:20px;
		font-size:0;
		color:transparent;
	}
	.visual button.slick-next{
		right:0;
		margin-right:20px;
		font-size:0;
		color:transparent;
	}
	.visual button.slick-prev:before{
		content:"\e93b";
		font-family:'xeicon';
	}
	.visual button.slick-next:before{
		content:"\e93e";
		font-family:'xeicon';
	}

/* 3. 왜 작전? body에 지정함-------------------------------------- */


/* 4. 챌린지 소개(카드형식) -----------------------------------------*/
	.ground{
		position:relative;
		margin-left: -150px; 
		margin-bottom:-800px;
	}
	.introduce{
		position:relative;
		margin-left:-5px;
		margin-top: 70px;
	}
	
	/* 챌린지 개설 */
	.ViewMore {
		position:absolute;
		left:1200px;
		top:200px;
		font-size:15pt;
		text-decoration:none;
		text-weight: bold;
		color:black;
  		font-family: '애플 SD 산돌고딕 Neo','Apple SD Gothic Neo','Helvetica Neue','Helvetica','나눔바른고딕','NanumBarunGothic','나눔바른고딕OTF','NanumBarunGothicOTF','Noto Sans','Noto+Sans','notokr-demilight','나눔고딕','NanumGothic','맑은 고딕','Malgun Gothic','sans-serif';
		
	}
	
	.introduce button{
		position:absolute;
		z-index:10;
		top:50%;
		transform:translateY(-50%);
		border-radius:100%;
		border:none;
		width:71px;
		height:71px;
		background:rgba(0,0,0,0);
		border:none;
	}
	.introduce button:before{
		font-family:'xeicon';
		color:#1afc1a;
		font-size:45px;
	}
	.introduce button.slick-prev{
		left:0;
		margin-left:25px;
		font-size:0;
		color:transparent;
	}
	.introduce button.slick-next{
		right:0;
		margin-right:30px;
		font-size:0;
		color:transparent;
	}
	.introduce button.slick-prev:before{
		content:"\e93b";
		font-family:'xeicon';
	}
	.introduce button.slick-next:before{
		content:"\e93e";
		font-family:'xeicon';
	}

/* 5. 고객센터 + 후기게시판 위치------------------------------------------------ */
	.board{
		margin-left: -150px;
		margin-top: 290px;
	}	
</style>

<script>
	$(document).on('mouseover', '.list8', function () {
		$('.hlist8wd').show();
		});
	
	$(document).on('mouseleave', '.hlist8', function () {
		$('.hlist8wd').hide();  
		});       
</script>
</head>

<body>
<div id="box">
<section id="section">
<div id="conbox">

<!-- 1. 헤더 아래 큰 로고 + 문구 -------------------------------------------------------------------------------------- -->
		<div>
		<a>
			<img class="pageTitleText" src="${path}/resources/images/상단문구.png"/>
		</a>
		<br>
		<a href="${path}/introduce/introduce">
			<img class="pageTitleButton" src="${path}/resources/images/homeIntroButton.png"/>
		</a>
 		</div>
 		<div>
		<a>
			<img class="pageTitleLogo" style="width: 700px; height: 700px;"
			src="${path}/resources/images/timeCircle.png"/>
		</a>
		</div>

		<br><br><br><br>
<!-- 2. 챌린지 홍보 ------------------------------------------------------------------------------------------------ -->
	<section class="visual">  
       <div><img src="${path}/resources/images/walking.png" usemap="#maptest" style="width:1260px; height:630px;"></div>
       <div><img src="${path}/resources/images/breathe.png" usemap="#maptest" style="width:1260px; height:630px;"></div>   
       <div><img src="${path}/resources/images/study.png"   usemap="#maptest" style="width:1260px; height:630px;"></div>
       
       <!-- 작전 신청하기 버튼 maptest 링크 -->
       		<map name="maptest">
				<area shape="rect" coords="487,401,771,471" href="${ path }/challenge/recruitList">
			</map> 
 	 </section>
 	   
<script type="text/javascript">
$(function(){
	$(".visual").slick({
		slide: 'div',     	 	//슬라이드 되어야 할 태그 ex) div, li 
		slidesToShow: 1,  	  	// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll:1,  		//스크롤 한번에 움직일 컨텐츠 개수
		speed: 100,        		// 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
        arrows : true,          // 옆으로 이동하는 화살표 표시 여부
        dots: false,           	// 하단 paging버튼 노출 여부 
        autoplay : true,        // 자동 스크롤 사용 여부
		autoplaySpeed : 2000,   // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		pauseOnHover : true,    // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
        infinite: true,        	// 이미지 무한 모션
		variableWidth: true,   	// 이미지 양옆 
		vertical : false,      	// 세로 방향 슬라이드 옵션
    });
})
</script>
		
		
<!--  3. 왜 작전인가? 파트 ------------------------------------------------------------------------------------------ -->
						<a>
							<img class="pageTitle2" style="width: 1200px; height:800px;"
							src="${path}/resources/images/whyJackJeon.png"/>
						</a>
						

 
<!-- 4. 챌린지 소개------------------------------------------------------------------------------------------------- -->
		<div class="ground">
				<a class="ViewMore" href="${path}/challenge/challengeRegister">챌린지 개설</a>
				<img style="width:1500px; height:1000px;" 
					src="${path}/resources/images/challengeIntroduce.png" >
		</div>
		   
		<section class="introduce">
			<div class="slider">
				<a href="${path}/challenge/recruitList">
				<img src="${path}/resources/images/wakeupChallenge.png" style="width:300px;height:440px;">
				</a>
		    </div>
		    
		    <div class="slider">
				<a href="${path}/challenge/recruitList">
				<img src="${path}/resources/images/breatheChallenge.png" style="width:300px;height:440px;">
				</a>
		    </div>
		    
		    <div class="slider">
				<a href="${path}/challenge/recruitList">
				<img src="${path}/resources/images/foodChallenge.png"  style="width:300px;height:440px;">
				</a>
		    </div>
		    
		    <div class="slider">
				<a href="${path}/challenge/recruitList">
				<img src="${path}/resources/images/bookChallenge.png" style="width:300px;height:440px;">
				</a>
		    </div>
		    
		    <div class="slider">
				<a href="${path}/challenge/recruitList">
				<img src="${path}/resources/images/gardenChallenge.png" style="width:300px;height:440px;">
				</a>
		    </div> 
		</section>

<script type="text/javascript">
$(function(){
	$(".introduce").slick({
		slide: 'div',     	 	//슬라이드 되어야 할 태그 ex) div, li 
		slidesToShow: 1,  	  	// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll:1,  		//스크롤 한번에 움직일 컨텐츠 개수
		speed: 100,        		// 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
        arrows : true,          // 옆으로 이동하는 화살표 표시 여부
        dots: false,           	// 하단 paging버튼 노출 여부 
        autoplay : true,        // 자동 스크롤 사용 여부
		autoplaySpeed : 1000,   // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
		pauseOnHover : true,    // 슬라이드 이동   시 마우스 호버하면 슬라이더 멈추게 설정
        infinite: true,        	// 이미지 무한 모션
		variableWidth: true,   	// 이미지 양옆 
		vertical : false,      	// 세로 방향 슬라이드 옵션
    });
})
</script>

<!-- 5. 게시판(고객센터&후기) 관련 사진 삽입 ------------------------------------------------------------------------------ -->
				        <div class="board">
				            <img src="${ path }/resources/images/boardMain.png" usemap="#maptest1" style="width:1500px; height:500px;">
				            <map name="maptest1">
				                <area shape="rect" coords="0,0,950,600" href="${ path }/board/boardList">
				            	<area shape="rect" coords="951,0,1915,600" href="${ path }/review/reviewList">
				            </map>
				        </div>

</div>
</section>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>