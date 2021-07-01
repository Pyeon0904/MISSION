<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<!-- jQuery 1.8 or later, 33 KB -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Fotorama from CDNJS, 19 KB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
<!-- Animate.CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
/* 전체 영역--------------------------------------------------------------------------*/

/*---------------제일 바깥 영역 설정-----------------*/
#box {
	background-color: rgb(224, 239, 132);
	width: 100%;
	height: 2300px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
	margin-top: 100px;
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
/*----------------------랜덤한 사진+글-----------------------------------*/
.temaevent1{
position:absolute;
left:330px;
font-size: 25px;
font-weight: bold;
}
.temaevent2{
position:absolute;
left:30%;
color:white;
font-size: 20px;

}
.temaevent3{

}
/* --------------------- 간단히 홈페이지소개 ---------------------- */

/*홈페이지 소개 테이블 전체 영역 지정*/
.introTable {
	width: 1000px;
	height: 200px;
	font-family: 'GmarketSansLight';
	margin-top: 0px;
}


/* 홈페이지 소개 제목*/
.introTitle {
	font-family: 'GmarketSansMedium';
	color: black;
	font-size: 25pt;
	font-weight: bold;
}
/* 홈페이지 설명 영역 지정 */
.introcontent {
	width: 300px;
	height: 300px;
	padding-top: 40px;
	padding-bottom: 10px;
}
/* 홈페이지 마지막 제목 */
.introlast{
   padding-top: 1000px;
   padding-bottom: 10px;
}
/* 홈페이지 뜻 문단 스타일*/
.introcontent span {
	font-size: 18pt;
	font-weight: bold;
	color: black;
}
/*-------------챌린지 소개----------------*/
.Introchalltable{
    width: 1000px;
	height: 200px;
	font-family: 'GmarketSansLight';
	margin-top: 0px;
}
/* 챌린지 소개 이미지 */
.IntrochallImg{
    width: 900px;
	height: 500px;
	object-fit: cover;
}
/* 챌린지 문장 폰트*/
.challcontent{
	font-size: 20pt;
	color: black;
	margin-top: 100px;
}
/*------------------게시판 소개------------------*/
.boardImg{
 width: 400px;
	height: 400px;
	object-fit: cover;
}
.boardFont span{
font-size: 25pt;
font-weight: bold;
	color: black;
}
.boardFont{
font-size: 15pt;
font-weight: bold;
	color: black;
}
/*공통*/
span{
font-size: 30pt;
	font-weight: bold;
	color: black;
}
/* 자세히보기 */
.ViewMore {
	width: 100px;
	height: 30px;
	text-align: center;
}
.ViewMore2 {
	width: 400px;
	height: 400px;
	text-align: center;
}
</style>
<script>
function animateCSS(element, animationName, callback) {
    const node = document.querySelector(element)
    node.classList.add('animated', animationName)

    function handleAnimationEnd() {
        node.classList.remove('animated', animationName)
        node.removeEventListener('animationend', handleAnimationEnd)

        if (typeof callback === 'function') callback()
    }

    node.addEventListener('animationend', handleAnimationEnd)
}
    
//animateCSS('.my-element', 'bounce	','lightSpeedIn')

//or
animateCSS('.my-element', 'bounce	','lightSpeedIn',' ',function() {
// Do something after animation
})
	$(document).on('mouseover', '.list8', function() {
		$('.hlist8wd').show();
	});

	$(document).on('mouseleave', '.hlist8', function() {
		$('.hlist8wd').hide();
	});
</script>

</head>
<body>
<!-- 기획의도 -->
<div id="box">
	<section id="section">
		<div id="conbox">
			<div id="temaevent">
				<div id="show">
					<div class="fotorama" data-width="1200px" 
					data-height="400px"data-autoplay="90000" data-loop="true">
						<div data-img="${path}/resources/images/Runing.png">
							<div class="animated fast fadeOutLeftBig delay-2s">
							<p class="temaevent1">오늘 하루는 얼마나달려볼까?</p>
							</div>
						</div>
						<div data-img="${path}/resources/images/JSPark.jpg">
							<div class="animated slow fadeInLeft delay-2s">
							<p class="temaevent2">
							<br><br>언젠가 그들도 한번쯤은 쉴것이고 그때내가 쉬지않고<br> 나아간다면 차이는 조금이라도 줄어들 것이다.<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							-박지성-</p></div>
						</div>
						<div data-img="${path}/resources/images/JORDAN.jpg">
							<div class="animated slow fadeInLeft delay-2s">
							<p class="temaevent3">한 번 포기하면 습관이된다. 절대 포기하지 말아라. -마이클 조던-</p></div>
						</div>
					</div>
				</div>
			</div>
    <hr>
			<!-- 간단히 홈페이지 소개  -->
			<div id="intro">
					<table class="introTable">
						<tr>
							<td rowspan="2"><img class="introImg"
								src="${path}/resources/images/flower1.png"></td>
							<td>
							<p class="introTitle">챌린지 홈페이지에 오신걸 환영합니다!</p>
							</td>
								<td>
							<div class="ViewMore">
								<a href="#">자세히 보기</a>
							</div>
							</td>
						</tr>
						<tr>
							<td>
								<p class="introcontent">
									&nbsp;&nbsp;<span>홈페이지</span>를 소개합니다~~~~ <br>
									소개소개소개소개소개소개소개소개소개소개<br><br><br><br><br>
								    <span>라스트라스트라스트라스트라스트라스트라스트라스트</span>
								    </p>
							     </td>
						      </tr>
					     </table>
				   </div>
		      <hr style="margin-bottom:50px;"> 
<!-- 챌린지 소개 -->
  <div id=challintro>
	 <table id="Introchalltable">
		 <tr>
		   <td>
		     <img class="introchallImg" src="${path}/resources/images/flower1.png">
				    </td>
				    	<td>
							<div class="ViewMore2">
								<a href="#">자세히 보기</a>
							  </div>
					       </td>
		                </tr>
			          <tr>
		            <td>
				       <div class="challcontent">
							<p>
							&nbsp;&nbsp;<span>챌린지 소개 소개소개소개</span><br><br>
							asdasdasd<br>
							asdasdasdasdasdasdasd
							</p>
						</div>
					  </td>
		    	</tr>
      </table>
</div>
<hr style="margin-bottom:50px;">
     <!-- 게시판 소개 -->
		      <div class="boardintro">
		         <table class="boardtable">
		       <tr>
		     <td>
		     <img class="boardImg" src="${path}/resources/images/flower1.png" style="margin-right:50px;">
		     <p class="boardFont"><span>나 올해 챌린지 얼마나했지?</span>
		     <br>소개소개소개소개</p>
		     </td>
		     <td>
		     <img class="boardImg" src="${path}/resources/images/river2.PNG"  style="margin-left:50px;">
		     <div class="boardFont" style="margin-left:50px;">
		       <p><span>asffasasfasfasfasfasf</span>
		        <br>소개소개소개소개</p>
		        </div>
		     </td>
		     <td>
				<div class="ViewMore2">
					<a href="#">자세히 보기</a>
					 </div>
				</td>
		     </tr>
		         </table>
		      </div>
          </div>
	   </section>
      </div>
   </body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
