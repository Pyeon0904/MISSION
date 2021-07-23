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
	
	<link rel="stylesheet" href="${ path }/resources/css/admin.css">

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
    	#subHeaderContainer .funcArea .btn:first-child{margin-right:0;}
    	#challengeContTable table{
    		width:100%; height:1013px;
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
					<c:if test="${ loginMember != null && loginMember.id != challenge.id}">
					
					<!-- 챌린지 신고하기 버튼 -->
					<a class="btn red small" id="btn-report">신고하기</a>
					
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
						<a class="btn green small">찜하기</a>
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
					</c:if>
					<a href="${ path }/challenge/recruitList" class="btn green small">목록으로</a>
					
					<c:if test="${ (loginMember != null) && (loginMember.id == challenge.id) }">
						<a href="${ path }/challenge/update?challengeNo=${ challenge.challengeNo }" class="btn green small">챌린지 수정</a>
					</c:if>
				</div>
				
			</c:if>
			
			<!-- 종료된 챌린지 조회 상태일 때의 뷰페이지 SubHeader -->
			<c:if test="${ (todayNum >= startNum) and (todayNum >= endNum) }">
			
				<div class="subHeaderImg test">
					<img alt="" src="${path}/resources/images/pageTitle/종료된챌린지정보.png">
				</div>
				<div class="funcArea">
					<a href="${ path }/challenge/recruitList" class="btn green small">목록으로</a>
				</div>
				
			</c:if>
			
			</div>
			
						<!-- 챌린지 신고 모달 -->
							<div class="cateUpdArea" id="cateDelArea">
								<div class="newWrapper">
									<div class="titleArea">
										<h2>챌린지 신고</h2>
									</div>
									<div class="contentArea">
										<div class="div-inf" id="individual">
										</div>
										<form id="report" action="${path}/challenge/challengeReport" method="POST">
								            <table>
								            	<tr>
								                    <td></td>
								                    <td> <!-- 현재 페이지에 담긴 게시글 제목, 게시글 번호, 작성자ID, 신고자ID -->
								                        챌린지 : 
								                        <input type="text" name="title" id="title" value=" ${ challenge.title }" readonly><br>
								                        <input type="hidden" name="c_no" id="c_no" value="${ challenge.challengeNo }"readonly>
								                        <input type="hidden" name="reportedId" id="reportedId" value="${ challenge.id }"readonly>
								                        <input type="hidden" name="sendId" id="sendId" value="${ loginMember.id }"readonly>
								                    </td>
								                </tr>
								                <tr>
								                <td>&emsp;&emsp;</td>
								                    <td>           
								                      	신고 유형 &emsp;&emsp;&emsp; : <select name="category" class="form-control" style="height:22px; width: 177px;" required>
								                  		<option value="" selected disabled hidden>신고 유형 선택</option>
								                  		<option value="욕설/비방">욕설/비방</option>
								                  		<option value="광고">도배</option>
									                  	<option value="광고">광고</option>
									                  	<option value="음란물">음란물</option>
									                  	<option value="개인정보 침해">개인정보 침해</option>
									                  	<option value="기타">기타</option>
									              	 </select>
								                    </td>
								                </tr>
								                <tr>
								                    <td>&emsp;&emsp;</td>
								                    <td>
								                        <textarea cols="100" row="100" style="height:50px; width: 400px;" name="content" placeholder="신고 내용을 입력하세요." id="reportContent" class="reportList"></textarea><br><br>    
								                    </td>
								                    <td></td>
								                </tr>
								                <tr>
								                    <td colspan="3" align="center">
								                        <input type="submit" class="inf-bt2" value="신고하기">
								                        <button type="button" class="inf-bt1 closeDelBtn">취소</button>
								                    </td>
								                </tr>
								            </table>
								        </form>
									</div>
								</div>
							</div>
							<script>
								$(function(){
									// 게시글 신고
									$("#btn-report").click(function(){
										$("div#cateDelArea").css("display", "block");
										$('div.div-wrapper, nav, header, footer').css("pointer-events", "none");
			
										// 게시글 번호 폼으로 가져오기
										var updno = $(this).parent('td').siblings('.noTd').html();
										$("input#a").val(updno);
										});
									
									$('button.closeDelBtn').click(function(){
										$('div.cateUpdArea').css("display", "none");
										$('div.div-wrapper, nav, header, footer').css("pointer-events", "all");
									});
								});
							</script>			
			
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