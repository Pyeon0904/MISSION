<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>메인페이지</title>
<meta charset="UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- Fotorama from CDNJS, 19 KB -->
<link   href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css"   rel="stylesheet">
<script   src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>

<!-- slick 라이브러리 -->
  <link rel="stylesheet" type="text/css" href="${path}/resources/slick/slick.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/resources/slick/slick-theme.css"/>


<%@ include file="/WEB-INF/views/common/headerDetail.jsp"%>
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${path}/resources/slick/slick.min.js" type="text/javascript"></script>

<style type="text/css">
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GmarketSansLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
   font-family: 'AppleSDGothicNeoB;
   font-weight: 30px;
    font-style: normal;
}

@font-face {
   font-family: 'AppleSDGothicNeoB, Noto Sans KR','Apple SD Gothic','맑은고딕','Nanum Gothic',sans-serif;
   font-weight: normal;
    font-style: normal;
}

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

/*-----------------------------------------------------------------------------------*/

/* 이미지 위치 ------------------------------------------------------------ */	
	/* 1. 페이지 최상단(헤더아래) */
	.pageTitleText{
		margin-left: 0px;
		margin-top : 100px;
	}
	.pageTitleButton{
		margin-left: -20px;
		margin-top : 100px;
	}
	.pageTitleLogo{
		margin-left: 700px;
		margin-top : -600px;
	}
	
	.pageTitle2{
		margin-left: 0px;
	}

	/* 2. 챌린지 홍보 슬라이드 쇼 (3장짜리)-------------------------- */
	.fotorama{
		 position:relative;
		 text-align:center;
		 margin-top:50px;
		 margin-left: 0px;
	}

	/* 3. 왜 작전? body에 지정함 */

	/* 4. 챌린지 소개(카드형식) ------------------------------------*/
	.ground{
		position:relative;
		margin-left: -150px; 
		margin-bottom:-800px;
	}
	.introduce{
		position:relative;
		margin-left:-30px;
		margin-top: 70px;
	}
	
	.ViewMore {
		position:absolute;
		width: 100%;
		height: 100%;
		left:1200px;
		top:200px;
		font-size:15pt;
		text-decoration:none;
		text-weight: bold;
		color:black;
	}

	/* 5. 고객센터 + 후기게시판 위치 */
	.board{
		margin-left: -150px; 
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
<!-- 헤더 아래 큰 로고 + 문구 ------------------------------------------------------------------------------------------------- -->
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
			<img class="pageTitleLogo" style="width: 600px; height: 600px;"
			src="${path}/resources/images/timeCircle.png"/>
		</a>
		</div>
<hr style="margin-bottom:50px;margin-top:50px;">  

<!-- 챌린지 홍보 ------------------------------------------------------------------------------------------------ -->
		<div class="fotorama" data-width="1600px" data-height="600px" data-autoplay="2000" data-loop="true">
			<div data-img="${path}/resources/images/walking.png"> </div>
			<div data-img="${path}/resources/images/breathe.png"> </div>
			<div data-img="${path}/resources/images/study.png"> </div>
		</div>

                  
<hr style="margin-bottom:50px;margin-top:50px;">     

				<!-- -------------- 왜 작전인가? 파트 ------------------ -->
						<a>
							<img class="pageTitle2" style="width: 1200px; height:750px;"
							src="${path}/resources/images/whyJackJeon.png"/>
						</a>
						
<hr style="margin-bottom:50px;margin-top:50px;"> 
 
<!-- 챌린지 소개 -->
		<div class="ground">
				<a class="ViewMore" href="${path}/challenge/challengeRegister">챌린지 개설</a>
				<img style="width:1500px; height:1000px;" 
					src="${path}/resources/images/challengeIntroduce.png" >
		</div>
		   
		<section class="introduce">
			<div class="slider">
				<a href="${path}/challenge/recruitList">
				<img src="${path}/resources/images/wakeupChallenge.png" style="width:420px;height:550px;">
				</a>
		    </div>
		    
		    <div class="slider">
				<a href="${path}/challenge/recruitList">
				<img src="${path}/resources/images/breatheChallenge.png" style="width:420px;height:550px;">
				</a>
		    </div>
		    
		    <div class="slider">
				<a href="${path}/challenge/recruitList">
				<img src="${path}/resources/images/foodChallenge.png"  style="width:420px;height:550px;">
				</a>
		    </div>
		    
		    <div class="slider">
				<a href="${path}/challenge/recruitList">
				<img src="${path}/resources/images/bookChallenge.png" style="width:420px;height:550px;">
				</a>
		    </div>
		    
		    <div class="slider">
				<a href="${path}/challenge/recruitList">
				<img src="${path}/resources/images/gardenChallenge.png" style="width:420px;height:550px;">
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

<hr style="margin-bottom:50px;margin-top:350px;"> 

		      	<!-- -------------- 게시판(고객센터&후기) 관련 사진 삽입 ------------------ -->
				        <div class="board">
				            <img src="${ path }/resources/images/boardMain.png" usemap="#maptest" style="width:1500px; height:500px;">
				            <map name="maptest">
				                <area shape="rect" coords="0,0,950,600" href="${ path }/board/boardList">
				            	<area shape="rect" coords="951,0,1915,600" href="${ path }/review/reviewList">
				            </map>
				        </div>
				<!-- ------------------------------------------------------- -->
	</div>
	</section>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>