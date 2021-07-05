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
	height: 2100px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
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
/*----------------------기획 의도-----------------------------------*/
.Runing{
position:absolute;
left:330px;
font-size: 25px;
font-weight: bold;
}
.JSPARK{
position:absolute;
left:30%;
color:white;
font-size: 20px;
}
.JORDAN{
position:absolute;
color:white;
left:300px;
}
.JORDAN2{
position:absolute;
color:white;
left:665px;
font-size: 20px;
}
.teamevent1{

}
.temaevent2{

}
.teamevent3{

}
/* --------------------- 간단히 홈페이지소개 ---------------------- */

/* 간단히 소개 이미지*/
.introImg{
  width:500px;
  height:360px;
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
/*챌린지 소개 글*/
.challTitle{
    font-size: 18pt;
	font-weight: bold;
	color: black;
	line-height: 1.5em;
}
.challcontext{
    width:550px;
    height:420px;
	font-size: 13.5pt;
	color: black;
	text-align:left;
	line-height: 2.5em;
}
.challcontext span{
font-weight: bold;
	color: red;
}

/*챌린지 소개 이미지*/
.IntrochallImg1{
	position:absolute;
	object-fit: cover;
    width: 500px;
	height: 300px;
	left: 550px;
	top:870px;
}
.IntrochallImg2{
    position:absolute;
	object-fit: cover;
    width: 500px;
	height: 300px;
	left: 550px;
	top:1220px;
}
/*챌린지 소개 이미지 소개 글*/
.challImgtext1{
 text-align:center;
 position:absolute;
 top:1180px;
 left:555px;
 font-size:22px;
 font-weight: bold;
 color: black;
}
.challImgtext2{
 text-align:center;
 width:1180px;
 height:30px;
 font-size:22px;
 font-weight: bold;
 color: black;
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
	width: 1280px;
	height: 30px;
	top:450px;
	left:1100px;
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
    
animateCSS('.my-element', 'fadeInLeft	','fadeInLeft')

//or
animateCSS('.my-element', 'fadeInLeft	','fadeInLeft',' ',function() {
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
			    <div id="plan">
				    <div id="show">
					    <div class="fotorama" data-width="1200px" 
					      data-height="400px"data-autoplay="9000" data-loop="true">
						   <div data-img="${path}/resources/images/Runing.png">
						     <p class=Runing>오늘 하루는 얼마나달려볼까?</p>
							   <div class="animated fast fadeInLeft delay-1s">
							    <p class="temaevent1">서브</p>
							</div>
						</div>
						<div data-img="${path}/resources/images/JSPark.jpg">
						<p class=JSPARK><br><br>언젠가 그들도 한번쯤은 쉴것이고 그때내가 쉬지않고<br> 나아간다면 차이는 조금이라도 줄어들 것이다.<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							-박지성-</p>
							<div class="animated slow fadeInLeft delay-3s">
							<p class="temaevent2">서브</p></div>
						</div>
						<div data-img="${path}/resources/images/JORDAN.jpg">
						<p class=JORDAN><br><br><br>한 번 포기하면 습관이된다. </p>
						<p class=JORDAN2><br><br>절대 포기하지 말아라 <br>&nbsp;&nbsp;&nbsp;&nbsp;-마이클 조던-</p>
							<div class="animated slow fadeInLeft delay-5s">
							<p class="temaevent3">서브</p></div>
						</div>
					</div>
				</div>
			</div>
        <hr style="margin-bottom:10px;">
        
<!-- 간단히 홈페이지 소개  -->
		     <div id="intro">
				<table class="introTable">
				    <tr>
						<td rowspan="2">
							<div class="introTitle">챌린지 홈페이지에 오신걸 환영합니다!</div>
							<img class="introImg"src="${path}/resources/images/Lewan.PNG">
					       </td>
						   <td>
							<div class="ViewMore">
								<a href="${ path }/introduce/introduce">자세히 보기</a>
							</div>
						</td>
					</tr>
						<tr>
							<td>
								<div class="introcontent">
									<span>지극히 평범한 일상을 벗어나고 싶으신가요?</span><br>
                                         절망의 끝자락에서 마음이 낙심될 때,<br>
                                         우리가 손잡고 함께하겠습니다.<br>
                                         '작전' 챌린지와 지금 당장 시작해봅시다!<br>
									         
								    </div>
							     </td>
						      </tr>
					     </table>
				   </div>
 <hr style="margin-bottom:10px;"> 
 
<!-- 챌린지 소개 -->
          <div id=challintro>
	          <table id="Introchalltable">
	              <tr>
					<td>
					  <div class="introTitle">챌린지 소개</div><br><br><br><br>
		     <span class="challTitle">지키고 싶은<br> 나와의 약속을 고르세요</span><br><br>
					  <p class="challcontext">
                       1.포스트 코로나 시대속 다양한 챌린지 모임 제공<br>
                       2.외출,인원,방문 각종 제한속에서 지혜롭게일상을 보내는 방안제시<br>
                       3.다양한 참가자들과의 열정공유, 의지확립으로 코로나 극복<br>
      <span>TIP 원하는 챌린지가 없다면<br>
             "챌린지 개설"로 직접 만들어 보세요.</span></p>
				   <img class="IntrochallImg1"src="${path}/resources/images/mission.png">
					  <div class="challImgtext1"> 매일 오전 6시 기상</div>
						<img class="IntrochallImg2"src="${path}/resources/images/mission2.png">
						  <p class="challImgtext2"><span>책 읽기</span></p>
					        </td>
						       <td>
							      <div class="ViewMore2">
								     <a href="${ path }/challenge/recruitList">자세히 보기</a>
							   </div>
						   </td>
					 </tr>
		     </table>
	    </div>
<hr style="margin-bottom:10px;">
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
          </div>
	   </section>
      </div>
   </body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
