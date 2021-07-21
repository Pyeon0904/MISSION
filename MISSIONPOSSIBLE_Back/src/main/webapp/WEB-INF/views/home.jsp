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



<%@ include file="/WEB-INF/views/common/headerDetail.jsp"%>
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
	height: 2000px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
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


.pageTitle2{
	margin-left: 40px;
}

.board{
	margin-left: 40px; 
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
animateCSS('.my-element','slideOutLeft')    

animateCSS('.my-element','slideOutLeft',function() {
	/*슬라이드 바*/
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
	<div id="box">
<hr style="margin-bottom:10px;">
        

<hr style="margin-bottom:10px;"> 

						<a>
							<img class="pageTitle2"
							src="${path}/resources/images/whyJackJeon.png"/>
						</a>

<hr style="margin-bottom:10px;">
		      	<!-- -------------- 게시판(고객센터&후기) 관련 사진 삽입 ------------------ -->
				        <div class="board">
				            <img src="${ path }/resources/images/boardMain.png" usemap="#maptest">
				            <map name="maptest">
				                <area shape="rect" coords="0,0,950,600" href="${ path }/board/boardList">
				            	<area shape="rect" coords="951,0,1915,600" href="${ path }/review/reviewList">
				            </map>
				        </div>
				<!-- ------------------------------------------------------- -->
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
