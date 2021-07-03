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
<title>challengeOngoing</title>
	<!-- 아이콘 라이브러리 link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- 제이쿼리 import -->
	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>

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
            margin:auto;
            background:rgb(255,255,255,0.5);
         }
             
      /*-----------------------------------------------------------------------------------*/
		
		#subHeaderContainer{width:100%; height:70px;}
    	#subHeaderContainer h2{float:left; margin-top:20px;}
    	#subHeaderContainer .funcArea .btn{width:100px; height:30px; float:right; margin:20px 20px 0px 0px;}
    	
    	#challengeContTable table tr:nth-child(1) #detailCont{
    		width:750px; height:1013px;
    	}
    	#challengeContTable table tr:nth-child(1) #detailCont table#detailContInfo{
			width:650px; height:1000px; margin:0 auto;    	
    	}
    	#challengeContTable table tr:nth-child(1) #detailCont table#detailContInfo tr:nth-child(-n+4){
    		height:50px;
    	}
    	#challengeContTable table tr:nth-child(1) #progressBarArea{
    		width:450px; height:150px; background-color:rgb(255,255,255,0.5);
    	}
    	#challengeContTable table tr:nth-child(1) #progressBarArea #barContainer{
    		width:400px; height:100px; margin-left: 10px;
    	}
    	#challengeContTable table tr:nth-child(1) #progressBarArea #barContainer h4{margin:0 0 20px 0px;}
    	#challengeContTable table tr:nth-child(1) #progressBarArea #barContainer .barEmpty{
    		width:400px; height:10px; 
    		border:1px solid gray; border-radius:5px;
    		margin:0 auto; background-color:#f0f0f0;
    	}
    	#challengeContTable table tr:nth-child(1) #progressBarArea #barContainer .barEmpty .barGreen{
    		height:100%; background-color:lime; border-radius:5px;
    	}
    	#challengeContTable table tr:nth-child(1) #progressBarArea #barContainer .progStatus{
    		float:right;
    	}
    	#challengeContTable table tr:nth-child(2) #memberCertList{
    		width:450px; height:513px; background-color:rgb(255,255,255,0.5);
    	}
    	#challengeContTable table tr:nth-child(2) #memberCertList h4{
    		margin:10px 0 20px 10px;
    	}
    	
    	.certListCont {width:100%; height:90%; overflow:scroll; overflow-x:hidden;}
    	.certListCont .certListDisplay ul{list-style-type : none; margin-left:25px;}
		.certListCont .certListDisplay ul li .certItemCont {
			width:380px; height:75px; margin-bottom:10px;
		}
		.certListCont .certListDisplay ul li .certItemCont .certItemPhotoBox{
			width:72px; height:72px; border:1px solid gray; float:left;
		}
		.certListCont .certListDisplay ul li .certItemCont .certItemInfoCont{
			width:300px; height:70px; display:inline-block; float:left;
		}
		.certListCont .certListDisplay ul li .certItemCont .certItemInfoCont .certItemTitle{
			width:100%; height:20px; font-weight:bold; padding-left:5px;
			overflow:hidden; text-overflow: ellipsis;white-space:nowrap;
		}
		.certListCont .certListDisplay ul li .certItemCont .certItemInfoCont .certItemSubCont{
			width:100%; height:50px;padding-left:5px;
			line-height:1.8;
			overflow:hidden; 
			display: -webkit-box;
	        -webkit-line-clamp: 2;
	        -webkit-box-orient: vertical;
	    }
	</style>
</head>
<body>
	<div id="box">
	<section id="section">
	<div id="conbox">
	
			<div id="subHeaderContainer">
				<h2>진행중인 챌린지 정보</h2>
				<div class="funcArea">
					<form action="${ path }/challenge/ongoingList" method="GET" class="" id="challengeListForm">
						<input type="hidden" name="" value="" />
						<input class="btn btnList" type="submit" value="목록으로"/>
					</form>
				</div>
			</div>
			<div id="challengeContTable">
				<table>
					<tr>
						<td rowspan="2" id="detailCont">
							<table id="detailContInfo">
								<tr>
									<td colspan="2">
										<!-- [개인] / [단체] 상태 출력 -->
										<c:if test="${ challenge.attendStatus == 'PUBLIC' }">
											<span style="font-size:1.2em;">[단체]</span>
										</c:if>
										<c:if test="${ challenge.attendStatus == 'PRIVATE' }">
											<span style="font-size:1.2em;">[개인]</span>
										</c:if>
										
										<!-- 카테고리 이름 출력 부분-->
										<span style="font-size:1.2em;">
											[<c:out value="${ challenge.categoryName }"/>]
										</span>
										
										<!-- 챌린지 제목 출력 부분 -->
										<span style="font-size:1.2em;">
											<c:out value="${ challenge.title }"/>
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<span>진행 기간</span>
									</td>
									<td>
									
									<!-- D-Day 로직 구현한 파일 include -->
									<%@ include file="date.jsp" %>	
										<!-- 챌린지 수료까지의 D-Day -->
										<span>
											D-<c:out value="${ endNum - todayNum }"/>
										</span>
										<!-- 챌린지 시작일 및 수료일 => Date 포맷으로 변경 -->
										<fmt:formatDate var="clgStart" value="${ challenge.startDate }" pattern="yyyy년 MM월 dd일"/>
										<fmt:formatDate var="clgEnd" value="${ challenge.deadline }" pattern="yyyy년 MM월 dd일"/>
										<span>
											<c:out value="${ clgStart }"/>
											부터&nbsp;
											<c:out value="${ clgEnd }"/>
											까지
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<span>참여 인원</span>
									</td>
									<td>
										<span>
											<c:out value="${ challenge.currentCount }"/>명
										</span>
									</td>
								</tr>
								<tr>
									<td>
										<span>오픈 카톡 링크</span>
									</td>
									<td>
										<span>
											<c:out value="${ challenge.opentalkLink }"/>
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<c:out value="${ challenge.content }"/>
									</td>
								</tr>
							</table>
						</td>
						<td id="progressBarArea">
							<div id="barContainer">
								<h4>구성원들의 평균 달성률 </h4>
								
								<!-- 챌린지 총 일수와 내가 인증한 일수 값 받아오게끔 하기 -->
								<c:set var="totalDay" value="100"/>
								<c:set var="successDay" value="80"/>
								
								<!-- 챌린지 달성률 계산식 -->
								<c:set var="progPercent" value="${(successDay / totalDay) * 100}"/>
								
								<div class="barEmpty">
									<div class="barGreen" style="width:${progPercent}%"></div>
								</div>
								<div class="progStatus">
									<p>${successDay} / ${totalDay}</p>
								</div>
							</div>
						</td>						
					</tr>
					<tr>
						<td id="memberCertList">
							<h4>구성원들의 인증내역</h4>
							<div class="certListCont">
								<!-- 
									현재 진행중/참여중인 챌린지의 인증 내역을 보여주는 페이지 INCLUDE
									파라미터는 간단하게 참여중인 챌린지의 CHALLENGE_NO값만 보내줌
									아래 jsp:include 태그의 page속성 빨간줄(오류)은 무시가능! 정상작동함!
								-->
								<jsp:include page="/challenge/certList">
									<jsp:param name="no" value="${ challenge.challengeNo }"/>
								</jsp:include>
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
<%@ include file="../common/footer.jsp"%> 
