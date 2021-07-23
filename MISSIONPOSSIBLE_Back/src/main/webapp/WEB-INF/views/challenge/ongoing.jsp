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
	
	<!-- view 페이지용 테스트 CSS link -->
	<link rel="stylesheet" href="${ path }/resources/css/btn-view.css">

	<style>

		/* 전체 영역--------------------------------------------------------------------------*/
            
         /*---------------제일 바깥 영역 설정-----------------*/
         #box{ 
            background-color:none;
            width:100%;
            height:auto; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
            margin-top:50px;
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
    	#subHeaderContainer .subHeaderImg{width:300px; height:70px; float:left;position:relative;left:-35px;}
    	#subHeaderContainer .funcArea {width:800px; height:70px; float:right; position:relative;left:0px; padding:0}
    	#subHeaderContainer .funcArea .btn{width:80px; height:15px; float:right; margin:20px 20px 0px 0px; font-size:0.95em; padding-top:-5px;}
    	#subHeaderContainer .funcArea .btn:first-child{margin-right:0;}
    	
    	/*오른쪽 위 input 버튼 추가 CSS 수정*/
		.btn.green {background-color: #6fde7e;}/*버튼 윗부분*/
		.btn.green {box-shadow: 0px 4px 0px #62bf6e;}/*버튼 아랫부분*/
		.btn.green:active {box-shadow: 0 0 #62bf6e; background-color: #62bf6e;}/*버튼 아랫부분*/
    	
    	#challengeContTable
    	#challengeContTable table tr:nth-child(1) #detailCont{
    		width:750px; height:auto;
    	}
    	#challengeContTable table tr:nth-child(1) #detailCont table#detailContInfo{
			width:700px; height:auto;    	
    	}
    	#challengeContTable table tr:nth-child(1) #detailCont table#detailContInfo tr:nth-child(-n+3){
    		height:50px;
    	}
    	#progressBarArea{
    		width:450px; height:180px; background-color:rgb(255,255,255,0.5);
    	}
    	#progressBarArea #barContainer{
    		width:400px; height:180px; margin-left: 10px;
    	}
    	#progressBarArea #barContainer h4{margin:0 0 20px 0px;}
    	.barContents{width:400px;height:90px;margin:auto 0;margin-top:10px;}
    	#progressBarArea #barContainer .barEmpty{
    		width:400px; height:10px; 
    		border:1px solid #b3b3b3; border-radius:5px;
    		margin:0 auto; background-color:#f0f0f0;
    	}
    	#progressBarArea #barContainer .barEmpty .barGreen{
    		height:100%; background-color:lime; border-radius:5px;
    	}
    	#progressBarArea #barContainer .progStatus{
    		float:right;
    	}
    	#memberCertList{
    		width:450px; height:auto; background-color:rgb(255,255,255,0.5);
    	}
    	#memberCertList h4{
    		margin:10px 0 20px 10px;
    	}
    	
    	.certListCont {width:100%; height:600px; overflow:scroll; overflow-x:hidden;}
    	.certListDisplay ul{list-style-type : none; margin-left:25px;}
		.certListDisplay ul li .certItemCont {
			width:380px; height:75px; margin-bottom:10px;
		}
	.certListDisplay ul li .certItemCont .certItemPhotoBox{
		width:70px; height:70px; float:left;
	}
	.certListDisplay ul li .certItemCont .certItemInfoCont{
		width:300px; height:70px; float:left;
	}
	.certListDisplay ul li .certItemCont .certItemInfoCont .certItemTitle{
		width:100%; height:20px; font-weight:bold; margin-left:5px;
		overflow:hidden; text-overflow: ellipsis;white-space:nowrap;
	}
	.certListDisplay ul li .certItemCont .certItemInfoCont .certItemSubCont{
		width:100%; height:50px; margin-left:5px;
		line-height:1.7;
		overflow:hidden; 
		display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	}
    	
h2{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:20px;color:#666;letter-spacing:0px}

td,th,caption{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:13px;color:#666;letter-spacing:0px}
    	
/* table */
table.table01 {border-collapse:separate;border-spacing:0;line-height:1.5;border-top:1px solid #ccc;border-left:1px solid #ccc;margin:auto;}
table.table01 th {padding: 10px;font-weight: bold;vertical-align: middle;text-align:center;border-right:1px solid #ccc;border-bottom:1px solid #ccc;border-top:1px solid #fff;border-left:1px solid #fff;background:#eee;}
table.table01 td {padding:10px;vertical-align:middle;border-right:1px solid #ccc;border-bottom:1px solid #ccc;}

	/*오른쪽 위 input 버튼 추가 CSS 수정*/
	.btn.green {background-color: #97fd97; color:black;}/*버튼 윗부분*/
	.btn.green {box-shadow: 0px 4px 0px #8deb8d;}/*버튼 아랫부분*/
	.btn.green:active {box-shadow: 0 0 #62bf6e; background-color: #8deb8d;}/*버튼 아랫부분*/
	
	.btn.red{background-color:#fd9797;color:black}/*버튼 윗부분*/
	.btn.red{box-shadow: 0px 4px 0px #e08787;}/*버튼 아랫부분*/
	.btn.red:active {box-shadow: 0 0 #62bf6e; background-color: #e08787;}/*버튼 아랫부분*/
	</style>
</head>
<body>
	<div id="box">
	<section id="section">
	<div id="conbox">
	
			<div id="subHeaderContainer">
				<div class="subHeaderImg test">
					<img alt="" src="${path}/resources/images/pageTitle/진행중인챌린지정보.png">
				</div>
				<div class="funcArea">
					<a class="btn green small btnList" href="${ path }/challenge/ongoingList">목록으로</a>
				</div>
			</div>
			<div id="challengeContTable">
				<table class="table01">
					<tr>
						<td id="detailCont">
							<table class="table01" id="detailContInfo" style="min-height:900px;">
								<tr>
									<td colspan="2">
										<!-- [개인] / [단체] 상태 출력 -->
										<c:if test="${ challenge.attendStatus == 'PUBLIC' }">
											<span style="font-size:1.2em;color:#ff974d;font-weight:bold;">[단체]</span>
										</c:if>
										<c:if test="${ challenge.attendStatus == 'PRIVATE' }">
											<span style="font-size:1.2em;color:#ff974d;font-weight:bold;">[개인]</span>
										</c:if>
										
										<!-- 카테고리 이름 출력 부분-->
										<span style="font-size:1.2em;color:#6b4dff;font-weight:bold;">
											[<c:out value="${ challenge.categoryName }"/>]
										</span>
										
										<!-- 챌린지 제목 출력 부분 -->
										<span style="font-size:1.2em;color:gray;font-weight:bold;">
											<c:out value="${ challenge.title }"/>
										</span>
									</td>
								</tr>
								<tr>
									<th>
										<span>진행 기간</span>
									</th>
									<td>
									
									<!-- D-Day 로직 구현한 파일 include -->
									<%@ include file="date.jsp" %>	
										<!-- 챌린지 수료까지의 D-Day -->
										<span style="color:#4d76ff;font-weight:bold;">
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
									<th>
										<span>참여 인원</span>
									</th>
									<td>
										<span>
											<c:out value="${ challenge.currentCount }"/>명
										</span>
									</td>
								</tr>
								<tr>
									<td colspan="2" style="vertical-align:top;">
										${ challenge.content }
									</td>
								</tr>
							</table>
						</td>
						<td id="subContents" style="vertical-align:top;">
							<table class="table01">
								<tr>
									<td id="progressBarArea">
										<div id="barContainer">
											<div class="barContents">
												<h4>구성원들의 평균 달성률 </h4>
								
												<!-- 챌린지 총 일수와 내가 인증한 일수 값 받아오게끔 하기 -->
												<c:set var="totalDay" value="${ endNum - startNum }"/>
												<c:set var="successDay" value="${ avgSuccess }"/>
												
												<!-- 챌린지 달성률 계산식 -->
												<c:set var="progPercent" value="${(successDay / totalDay) * 100}"/>
												
												<div class="barEmpty">
													<div class="barGreen" style="width:${progPercent}%"></div>
												</div>
												<div class="progStatus">
													<fmt:parseNumber var="succDay" value="${successDay}" pattern="0"/>
													<p>${succDay} / ${totalDay}</p>
												</div>
											</div>
											<div class="barContents">
												<h4>챌린지 경과일 수</h4>
												
												<!-- 챌린지 총 일수와 내가 인증한 일수 값 받아오게끔 하기 -->
												<c:set var="progressDay" value="${ todayNum - startNum }"/>
												
												<!-- 챌린지 달성률 계산식 -->
												<c:set var="progPercent" value="${(progressDay / totalDay) * 100}"/>
												
												<div class="barEmpty">
													<div class="barGreen" style="width:${progPercent}%"></div>
												</div>
												<div class="progStatus">
													<p>${progressDay} / ${totalDay}</p>
												</div>											
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
