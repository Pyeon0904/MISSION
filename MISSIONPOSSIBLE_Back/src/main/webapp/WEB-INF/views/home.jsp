<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!-- jQuery 1.8 or later, 33 KB -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<!-- Fotorama from CDNJS, 19 KB -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<style>
/* 전체 영역--------------------------------------------------------------------------*/

/*---------------제일 바깥 영역 설정-----------------*/
#box {
	background-color: rgb(224, 239, 132);
	width: 100%;
	height: 2500px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
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

/* --------------------- 소개 ---------------------- */

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
font-size: 24pt;
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
	$(document).on('mouseover', '.list8', function() {
		$('.hlist8wd').show();
	});

	$(document).on('mouseleave', '.hlist8', function() {
		$('.hlist8wd').hide();
	});
</script>
<!-- 기획의도 -->
<div id="box">
	<section id="section">
		<div id="conbox">
			<div id="temaevent">
				<div id="slide">
					<div class="fotorama" data-width="1200px" data-height="350px"
						data-autoplay="true" data-loop="true">
						<div data-img="${path}/resources/images/file.png">
							<a href="#" class="fes-title"></a>
							<p>원1111111111111111111111111111111111<br>111111111111</p>
						</div>
						<div data-img="${path}/resources/images/file.png">
							<a href="#" class="fes-title"></a>
							<p>투</p>
						</div>
						<div data-img="${path}/resources/images/file.png">
							<a href="#" class="fes-title"></a>
							<p>쓰리</p>
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
								src="${path}/resources/images/flower.png"></td>
							<td>
							<p class="introTitle">홈페이지소개 제목</p>
							</td>
								<td>
							<div class="ViewMore">
								<a href="${ path }/introduce/introduce">자세히 보기</a>
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
		     <img class="introchallImg" src="${path}/resources/images/file.png">
				    </td>
				    	<td>
							<div class="ViewMore2">
								<a href="${ path }/challenge/recruitList">자세히 보기</a>
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
		     <img class="boardImg" src="${path}/resources/images/file.png" style="margin-right:50px;">
		     <p class="boardFont"><span>나 올해 챌린지 얼마나했지?</span>
		     <br>소개소개소개소개</p>
		     </td>
		     <td>
		     <img class="boardImg" src="${path}/resources/images/file.png"  style="margin-left:50px;">
		     <div class="boardFont" style="margin-left:50px;">
		       <p><span>asffasasfasfasfasfasf</span>
		        <br>소개소개소개소개</p>
		        </div>
		     </td>
		     <td>
				<div class="ViewMore2">
					<a href="${ path }/review/reviewList">자세히 보기</a>
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
