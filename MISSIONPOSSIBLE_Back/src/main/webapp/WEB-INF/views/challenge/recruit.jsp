<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%> 

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>challengeRecruit</title>
	<!-- 아이콘 라이브러리 link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- 제이쿼리 import -->
	<script src="${path}/js/jquery-3.6.0.min.js"></script>

	<style>
	
	/* 전체 영역--------------------------------------------------------------------------*/
            
         /*---------------제일 바깥 영역 설정-----------------*/
         #box{ 
            background-color:rgb(224, 239, 132);
            width:100%;
            height:1300px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
            margin-top:330px;
            margin-bottom:100px;
            margin-left:-10px;
            padding:10px;
         }
         /*-------------------컨텐츠 영역---------------------*/
         #conbox{
            width:1200px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
            position:relative; 
            top:20px;
            margin:0 auto;
            background-color:rgb(255, 255, 255, 0.5);
         }
             
      /*-----------------------------------------------------------------------------------*/
		
		#subHeaderContainer{width:100%; height:70px;}
    	#subHeaderContainer h2{float:left; margin-top:20px;}
    	#subHeaderContainer .funcArea .btn{width:100px; height:30px; float:right; margin:20px 20px 0px 0px;}
    	
    	#challengeContTable table{
    		width:85%; height:1013px; margin:0 auto;
    	}
    	
    	#challengeContTable table tr:nth-child(-n+9){
    		height:50px;
    	}
    	
    	#challengeContTable table tr:nth-child(n+2):nth-child(-n+9) td:nth-child(1){
    		width:200px;
    	}
    	
    	
	</style>
</head>
<body>
	<div id="box">
	<section id="section">
	<div id="conbox">

	
			<div id="subHeaderContainer">
				<h2>모집중인 챌린지 정보</h2>
				<div class="funcArea">
					<form action="#" method="GET" class="" id="challengeJoinForm">
						<input type="hidden" name="" value="" />
						<input class="btn btnJoin" type="submit" value="참가신청"/>
					</form>
					<script>
					$(document).ready(()=>{	
						$("#challengeJoinForm").on("click",function(event){
							if(confirm("해당 챌린지에 참여하시겠습니까?")){
								alert("참여신청을 완료했습니다.")
								location.replace('#');
							} 
							else {
								alert("취소되었습니다.");
								location.replace('#');
							}
						});
					});
					</script>
					<form action="${ path }/challenge/zzimList" method="GET" class="" id="challengeZzimForm">
						<input type="hidden" name="" value="" />
						<input class="btn btnZzim" type="submit" value="찜하기"/>
					</form>
					<script>
					var path = "<c:out value='${path}'/>";

					$(document).ready(()=>{	
						$("#challengeZzimForm").on("click",function(event){
							if(confirm("해당 챌린지를 찜하시겠습니까?")){
								alert("찜하기를 완료했습니다.");
								location.replace(path + "/challenge/zzimList");
							}
							else{
								alert("취소되었습니다.");
								location.replace('/');
							}
						});
					});
					</script>
					<form action="${ path }/challenge/recruitList" method="GET" class="" id="challengeListForm">
						<input type="hidden" name="" value="" />
						<input class="btn btnList" type="submit" value="목록으로"/>
					</form>
				</div>
				
			</div>
			
			<div id="challengeContTable">
				<table id="detailContInfo">
					<tr>
						<td colspan="2">
							<span style="font-size:1.2em;">[d-day][참여가능여부][카테고리이름][챌린지제목]</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>등록일</span>
						</td>
						<td>
							<span>[yyyy-MM-dd]</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>모집기간</span>
						</td>
						<td>
							<span>[yyyy-MM-dd]까지</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>진행기간</span>
						</td>
						<td>
							<span>[yyyy-MM-dd]까지</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>모집 인원</span>
						</td>
						<td>
							<span>[maxCount]명</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>기본 인증 방법</span>
						</td>
						<td>
							<span>인증 사진 등록</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>참여시 차감 포인트</span>
						</td>
						<td>
							<span>1000P</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>오픈 카톡 링크</span>
						</td>
						<td>
							<span>[링크url]ex.https://open.kakao.com/o/gWfD3Ugd</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>참고파일</span>
						</td>
						<td>
							<span>[업로드된파일LIST]</span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							[챌린지textEditor내용 출력]<br>
							[챌린지textEditor내용 출력]<br>
							[챌린지textEditor내용 출력]<br>
							[챌린지textEditor내용 출력]<br>
							[챌린지textEditor내용 출력]<br>
							[챌린지textEditor내용 출력]<br>
							[챌린지textEditor내용 출력]<br>
							[챌린지textEditor내용 출력]<br>
						</td>
					</tr>
				</table>
			</div>
	</div>
	</section>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%> 
