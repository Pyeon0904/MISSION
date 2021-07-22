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
<!-- slick 라이브러리 -->
  <link rel="stylesheet" type="text/css" href="${path}/resources/slick/slick.css"/>
  <link rel="stylesheet" type="text/css" href="${path}/resources/slick/slick-theme.css"/>

<%@ include file="/WEB-INF/views/common/headerDetail.jsp"%>
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
<script src="${path}/resources/slick/slick.min.js" type="text/javascript"></script>

<style>
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
	height: 2800px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
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
/* 챌린지 홍보 슬라이드 쇼 영역 지정*/
.proimg{
 width:100%;
}

	.pro-slider .prev{
  		font-size:3em;
  		color:#1afc1a;
  		cursor: pointer;
  		float:left;
  		cursor: pointer;
  		margin-top:180px;
  		margin-left:200px;
  		margin-right:10px;
  	
	}
	.pro-slider .next{
		font-size:3em;
		color:#1afc1a;
		cursor: pointer;
		float:right;
		margin-top:-380px;
		margin-left:10px;
  		margin-right:200px;
  		
	}
	

/* --------------------- 간단히 홈페이지소개 ---------------------- */

/* 간단히 소개 이미지*/
.introImg{
position:relative;
left : 400px;
}
/* 간단히 홈페이지 설명 영역 지정 */
.introcontent {
	width: 500px;
	height: 350px;
	text-align:center;
	font-size: 18pt;
	line-height:3.0em;
}
.introcontent span{
font-weight: bold;
	color: black;
}

/*------------------------------챌린지 소개--------------------------*/
.introduce{
margin-bottom:100px;
}
.ground{
margin: 0 auto;
}
/*------------------게시판 소개------------------*/
.boardImg1{
    width: 400px;
	height: 400px;
	object-fit: cover;
	
}
.boardImg2{
    width: 400px;
	height: 400px;
	object-fit: cover;
	margin-top:50px;
}
.boardService{
font-size: 25pt;
font-weight: bold;
	color: black;
	
}
.boardReview{
font-size: 25pt;
font-weight: bold;
	color: black;
	
}
/*-----------------------공통-----------------------*/

/*자세히보기 */
.ViewMore {
  position:absolute;
	top:1500px;
	left:920px;
	font-size:20pt;
	color:black;
}
.ViewMore2 {
 position:absolute;
	width: 1280px;
	height: 30px;
	top:880px;
	left:1100px;
}

/*제목 */
.introTitle {
	font-family: 'AppleSDGothicNeoB';
    width:500px;
    height:50px;
	color: black;
	font-size: 20pt;
	font-weight: bold;
	text-align:left;
}
/*포인트 스타일*/
.span{
	font-size: 18pt;
	font-weight: bold;
	color: black;
}
</style>
</head>
<body>
<!-- 챌린지 홍보 -->
   	<section class="promotion">
   	<div class="pro-slider">
   	<i class="fa fa-angle-left prev" aria-hidden="true"></i>
   	<div class="pro-wrapper">
    <div class="proimg">   
    <a href="${ path}/challenge/recruitList">
    <img src="${path}/resources/images/walking.png" style="width: 1000px;height: 500px; " >
    </a>
    </div>
    <div class="proimg">
    <a href="${ path }/challenge/recruitList">
    <img src="${path}/resources/images/study.png"  style="width: 1000px;height: 500px;">
    </a>
    </div>
    <div class="proimg">
    <a href="${ path }/challenge/recruitList">
    <img src="${path}/resources/images/breathe.png" style="width: 1000px;height: 500px;">
    </a>
    </div>
    </div>
     <i class="fa fa-angle-right next" aria-hidden="true"></i>
    </div>
    </section>
<script type="text/javascript">
$(function(){
$(".pro-wrapper").slick({
	slide: 'div',       //슬라이드 되어야 할 태그 ex) div, li 
	slidesToShow: 1,    // 한 화면에 보여질 컨텐츠 개수
	slidesToScroll:1,   //스크롤 한번에 움직일 컨텐츠 개수
	speed: 200,         // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
	Arrows: true,       // 옆으로 이동하는 화살표 표시 여부
	dots : true,         // 스크롤바 아래 점으로 페이지네이션 여부
	autoplay : true,      // 자동 스크롤 사용 여부
	autoplaySpeed : 1000000,  // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
	pauseOnHover : true,  // 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
	prevArrow: $('#aro1_prev'),
	nextArrow: $('#aro1_next'),	
});
})
</script>
<hr style="margin-bottom:50px;margin-top:50px;">       
<!-- 간단히 홈페이지 소개  -->
		     <div id="intro">
				<table class="introTable">
				    <tr>
						<td rowspan="2">
							<div class="introTitle">챌린지 홈페이지에 오신걸 환영합니다!</div>
							
					       </td>
						   <td>
							<div class="ViewMore">
							</div>
						</td>
					</tr>
						<tr>
							<td>
							<div class="animated  fadeInRight ">
								<p class="introcontent">
									<span>지극히 평범한 일상을 벗어나고 싶으신가요?</span><br>
                                         절망의 끝자락에서 마음이 낙심될 때,<br>
                                         우리가 손잡고 함께하겠습니다.<br>
                                         <span>'작전'</span> 챌린지와 지금 당장 시작해봅시다!<br>
									         </p>
								    </div>
							     </td>
						      </tr>
					     </table>
				   </div>
 <hr style="margin-bottom:50px;margin-top:50px;"> 
 
<!-- 챌린지 소개 -->   
   <section class="introduce slider">
      <div>
      <img src="${path}/resources/images/wakeupChallenge.png" style="width:250px;height:300px;">
    </div>
    <div>
      <img src="${path}/resources/images/breatheChallenge.png" style="width:250px;height:300px;">
    </div>
    <div>
      <img src="${path}/resources/images/foodChallenge.png"  style="width:250px;height:300px;">
    </div>
    <div>
      <img src="${path}/resources/images/bookChallenge.png" style="width:250px;height:300px;">
    </div>
    <div>
      <img src="${path}/resources/images/gardenChallenge.png" style="width:250px;height:300px;">
    </div>     
  </section>
      <img src="${path}/resources/images/challengeIntroduce.png">
  <script type="text/javascript">
  $(".introduce").slick({
	  slide: 'div',       //슬라이드 되어야 할 태그 ex) div, li 
		slidesToShow: 1,  // 한 화면에 보여질 컨텐츠 개수
		slidesToScroll:1,  //스크롤 한번에 움직일 컨텐츠 개수
		speed: 100,        // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		Arrows: true,       // 옆으로 이동하는 화살표 표시 여부
      dots: true,           // 하단 paging버튼 노출 여부
      infinite: true,        // didqkdgid 무한 모션
      variableWidth: true,   // 이미지 양옆 
      autoplay : true,       // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
      autoplaySpeed : 2000,  // 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
      pauseOnHover : true,  // 슬라이드 이동시 마우스 호버하면 슬라이더 멈추게 설정
      vertical : false,     // 세로 방향 슬라이드 옵션
    });
  </script>
<hr style="margin-bottom:50px;margin-top:50px;"> 
     <!-- 게시판 소개 -->
		      <div class="boardintro">
		         <table class="boardtable">
		       <tr>
		     <td>
		     <p class="introTitle">소통의 장</p>
		     <a href="${ path }/board/boardList">
		     <img class="boardImg1" src="${path}/resources/images/Service.jpg">
		     </a>
		     <p class="boardService"><span>고객센터</span></p>		    
		     </td>
		     <td>
		     <a href="${ path }/review/reviewList">
		     <img class="boardImg2" src="${path}/resources/images/flower.png">
		     </a>
		     <div class="boardReview"><p><span>후기게시판</span></p>
		        </div>
		     </td>
		  </tr>
		     </table>
		 </div>
    </body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
