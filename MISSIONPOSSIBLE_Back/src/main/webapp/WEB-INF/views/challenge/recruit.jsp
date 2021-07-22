<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%> 

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- D-Day 로직 구현한 파일 include -->
<%@ include file="date.jsp" %>		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>challengeRecruit</title>
	<!-- 아이콘 라이브러리 link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<!-- view 페이지용 테스트 CSS link -->
	<link rel="stylesheet" href="${ path }/resources/css/btn-view.css">

	<!-- 제이쿼리 import -->
	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>

	<style>
	
	/* 전체 영역--------------------------------------------------------------------------*/
            
         /*---------------제일 바깥 영역 설정-----------------*/
         #box{ 
            background-color:none;
            width:100%;
            height:1300px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
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
            margin:0 auto;
         }
             
      /*-----------------------------------------------------------------------------------*/
		
		#subHeaderContainer{width:100%; height:70px;}
    	#subHeaderContainer .subHeaderImg{width:300px; height:70px; float:left;position:relative;left:-35px;}
    	#subHeaderContainer .funcArea .btn{float:right; margin:20px 20px 0px 0px;}
    	
    	#challengeContTable table{
    		width:100%; height:1013px;
    	}
    	
h2{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:20px;color:#666;letter-spacing:0px}

td,th,caption{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:13px;color:#666;letter-spacing:0px}
    	
/* table */
table.table01 {border-collapse:separate;border-spacing:0;line-height:1.5;border-top:1px solid #ccc;border-left:1px solid #ccc;margin:auto;}
table.table01 th {padding: 10px;font-weight: bold;vertical-align: middle;text-align:center;border-right:1px solid #ccc;border-bottom:1px solid #ccc;border-top:1px solid #fff;border-left:1px solid #fff;background:#eee;}
table.table01 td {padding:10px;vertical-align:middle;border-right:1px solid #ccc;border-bottom:1px solid #ccc;}
   	
    	
	</style>
</head>
<body>
	<div id="box">
	<section id="section">
	<div id="conbox">

	
			<div id="subHeaderContainer">
			
			<!-- 모집중인 챌린지 조회 상태일 때의 뷰페이지 SubHeader -->
			<c:if test="${ (todayNum < startNum) and (todayNum < endNum) }">
				<!-- 
				<a href="#" class="btn-gradient cyan small">Button</a>
				<a href="#" class="btn-gradient orange small">Button</a>
				<a href="#" class="btn-gradient blue small">Button</a>
				<a href="#" class="btn-gradient purple small">Button</a>
				-->
			
				<div class="subHeaderImg test">
					<img alt="" src="${path}/resources/images/pageTitle/모집중인챌린지정보.png">
				</div>
				<div class="funcArea">
					<!-- 참가신청 버튼 클릭시 addMyChallengeList.do로 참가신청을 의미하는 값과 해당 게시물의 No값을 넘긴다. -->
					<form action="${ path }/challenge/saveMyChallengeList.do" method="GET" class="" id="challengeJoinForm">
						<input type="hidden" name="myStatus" value="JOIN" />
						<input type="hidden" name="myChallengeNo" value="${ challenge.challengeNo }"/>
						<a class="btn green small">참가신청</a>
					</form>
					<script>
					$(document).ready(()=>{	
						$("#challengeJoinForm").on("click",function(event){
							if(confirm("해당 챌린지에 참여하시겠습니까?")){
								$("#challengeJoinForm").submit();
							} 
							else {
								alert("취소되었습니다.");
							}
						});
					});
					</script>
					
					<!-- 찜하기 버튼 클릭시 addMyChallengeList.do로 찜하기 의미하는 값과 해당 게시물의 No값을 넘긴다. -->
					<form action="${ path }/challenge/saveMyChallengeList.do" method="GET" class="" id="challengeZzimForm">
						<input type="hidden" name="myStatus" value="ZZIM" />
						<input type="hidden" name="myChallengeNo" value="${ challenge.challengeNo }"/>
						<a class="btn red small">찜하기</a>
					</form>
					<script>

					$(document).ready(()=>{	
						$("#challengeZzimForm").on("click",function(event){
							if(confirm("해당 챌린지를 찜하시겠습니까?")){
								$("#challengeZzimForm").submit();
							}
							else{
								alert("요청이 취소되었습니다.");
							}
						});
					});
					</script>
					<a href="${ path }/challenge/recruitList" class="btn blue small">목록으로</a>
					
					<c:if test="${ (loginMember != null) && (loginMember.id == challenge.id) }">
						<a href="${ path }/challenge/update?challengeNo=${ challenge.challengeNo }" class="btn purple small">챌린지 수정</a>
					</c:if>
				</div>
				
			</c:if>
			
			<!-- 종료된 챌린지 조회 상태일 때의 뷰페이지 SubHeader -->
			<c:if test="${ (todayNum >= startNum) and (todayNum >= endNum) }">
			
				<div class="subHeaderImg test">
					<img alt="" src="${path}/resources/images/pageTitle/종료된챌린지정보.png">
				</div>
				<div class="funcArea">
					<a href="${ path }/challenge/recruitList" class="btn blue small">목록으로</a>
				</div>
				
			</c:if>
			
			</div>
			
			<div id="challengeContTable">
				<table id="detailContInfo" class="table01">
					<thead style="height:70px">
						<tr>
							<!-- 챌린지 제목 단 -->
							<td colspan="10">													
																							
								<!-- 
									챌린지 시작일에서 오늘 날짜를 뺌 D-Day 완성! 
								-->
								
								<!-- 모집중인 챌린지 조회 상태일 때의 D-Day 부분-->
								<c:if test="${ (todayNum < startNum) and (todayNum < endNum) }">
									<span style="font-size:1.2em;color:#4d76ff;font-weight:bold;">
										D-<c:out value="${ startNum - todayNum }"></c:out>&nbsp;
									</span>
								</c:if>
								
								<!-- 종료된 챌린지 조회 상태일 때의 D-Day 부분 -->
								<c:if test="${ (todayNum > startNum) and (todayNum > endNum) }">
									<span style="font-size:1.2em;color:gray;font-weight:bold;">
										[챌린지종료]
									</span>
								</c:if>
								
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
									&nbsp;<c:out value="${ challenge.title }"/>
								</span>
							</td>
						</tr>
					</thead>
					<tbody>
						<colgroup>
					        <col width="10%">
					        <col width="10%">
					        <col width="10%">
					        <col width="10%">
					        <col width="10%">
					        <col width="10%">
					        <col width="10%">
					        <col width="10%">
					        <col width="10%">
					        <col width="10%">
					    </colgroup>
						<tr style="height:50px;">
							<th>
								<span>모집기간</span>
							</th>
							<td>
								<fmt:formatDate var="recruitEnd" value="${ challenge.startDate }" pattern="yyyy-MM-dd"/>
								<span>
									<c:out value="${ recruitEnd }"/>까지
								</span>
							</td>
							<th>
								<span>진행기간</span>
							</th>
							<td>
								<fmt:formatDate var="clgEnd" value="${ challenge.deadline }" pattern="yyyy-MM-dd"/>
								<span>
									<c:out value="${ clgEnd }"/>까지
								</span>
							</td>
							<th>
								<span>차감 포인트</span>
							</th>
							<td>
								<span>
									<c:out value="${ challenge.minusPoint }"/>P
								</span>
							</td>
							<th>
								<span>모집 인원</span>
							</th>
							<td>
								<span>
									<c:if test="${ challenge.maxCount != 9999 }">
										<c:out value="${ challenge.maxCount }"/>명
									</c:if>
									<c:if test="${ challenge.maxCount == 9999 }">
										제한 없음
									</c:if>
									
								</span>
							</td>
							<th>
								<span>등록일</span>
							</th>
							<td>
								<fmt:formatDate var="regDate" value="${ challenge.createDate }" pattern="yyyy-MM-dd"/>
								<span>
									<c:out value="${ regDate }"/>
								</span>
							</td>
						</tr>
						<tr style="height:50px;">
							<th>
								<span>오픈 카톡 링크</span>
							</th>
							<td colspan="9">
								<span>
									<c:out value="${ challenge.opentalkLink }"/>
								</span>
							</td>
						</tr>
						<tr>
							<!-- 챌린지 상세 설명(Content) -->
							<td colspan="10" style="vertical-align:top;">
								<p>
									${ challenge.content }
								</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
	</div>
	</section>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%> 