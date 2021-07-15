<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%> 
<%@ include file="/WEB-INF/views/admin/common/navi.jsp"%> 

<c:set var="path" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet" href="${ path }/resources/css/review.css">


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 게시판</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="/resources/demos/style.css">
<style>
   #box{ background-color:rgb(224, 239, 132); width:100%; height:5000px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
         margin-top:330px; margin-bottom:100px; margin-left:-10px; padding:10px;}
   #conbox{ width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/ position:relative; top:20px; margin:auto;}
</style>
</head>
<script>
$(function () {
	// 상단 신고 관리 메뉴 클릭시 black으로 바꾸기
	$(".reportA").css({ "background" : "var(--black)", "color" : "var(--white)"});

	// 검색
	$("#searchTxt").keyup(function(){
        var text = $(this).val();
        $(".cateListTb tr:not(#titleTd)").hide();
        
        var temp = $(".cateListTb td:contains('"+text+"')");
        $(temp).parent().show();
    });
});
</script>
<div id="box">
	<section id="section">
		<div id="conbox">
			<div id="wrap">
				<div id="container">
					<div class="inner">
						<!-- 탭 -->
						<div class="tabs">
							<ul class="tabs">
								<li class="tab-link current">
									<a href="${ path }/admin/report/reportReview">신고된 후기 게시글</a>
								</li>
								<li class="tab-link">
									<a href="approve">신고된 회원</a>
								</li>
								<li class="tab-link">
									<a href="${ path }/admin/report/reportChallenge">신고된 챌린지</a>
								</li>
								<li class="tab-link">
									<a href="${ path }/admin/report/warnMember">경고 회원 관리</a>
								</li>
							</ul>
						</div>
					<div class="cateList">
						<div class="head">
							<h2 id="title">신고 관리</h2>
						</div>
						<div class="btnArea">
							<span class="searchArea">
								<input type="text" id="searchTxt" name="searchTxt" placeholder="검색">
							</span>
							<span class="enrollArea">
								<button class="enroll-bt1" id="allWarnBtn">경고</button>
							</span>
						</div>
						<!-- 게시글 리스트 테이블 ------------------------>
						<div class="tbArea">
							<table class="cateListTb memListTb">
								<tr id="titleTd">
									<th><input type="checkbox" id="allChecked"></th>
									<th>신고번호</th>
									<th>신고자ID</th>
									<th>게시자ID</th>
									<th>게시글번호</th>
									<th>신고유형</th>
									<th>신고내용</th>
									<th>신고날짜</th>
									<th>상태</th>
									<th>처리</th>
								</tr>
								<c:if test="${ list.isEmpty() }">
									<tr>
										<td colspan="10">조회된 게시글이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${ !list.isEmpty() }">
									<c:forEach var="report" items="${ list }" varStatus="status">
										<tr>
											<td><input type="checkbox" class="tdCheck"></td>
											<td class="report">${ report.no }</td>
											<td>
												<c:out value="${ report.sendId } " />
											</td>
											<td class="view-click td-3 noTd"><c:out value="${ report.reportedId }" /></td>
											<td ><a class="getURL" href="${ path }/review/reviewView?no=${report.r_no}" target="viewF">
											<c:out value="${ report.r_no }" /></a></td>
											<td class="rNo"><c:out value="${ report.r_no }" /></a></td>
											<td><c:out value="${ report.category }" /></td>
											<td><c:out value="${ report.content }" /></td>
											<td><fmt:formatDate type="date" value="${ report.createDate }" /></td>
											<td>
												<c:if test="${ report.status == 'N' }">대기</c:if>
												<c:if test="${ report.status == 'Y' }">완료</c:if>
											</td>

											<td>
												<c:if test="${ report.status == 'N' }">
												<button type="button" id="selectWarnBtn" class="stat-bt1 WarnBtn">경고</button>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:if>
						</table>
						<!-- 게시글 리스트 테이블 끝 ------------------------>	
						<!-- 셀렉트 박스 전체 선택 -->	
						<script>
						$(function(){
							// 전체선택 해제
							$("#allChecked").click(function(){
	                            $("input:checkbox").each(function(){
	                                if($(this).is(":checked")){
	                                    $(this).prop("checked",false);
	                                    $("#allChecked").prop("checked",false);
	                                } else {
	                                    $(this).prop("checked",true);
	                                    $("#allChecked").prop("checked",true);
	                                }
	                            });
	                        });
						});					
					</script>
					<!-- 신고 게시글 작성자 경고 모달 -->
					<div class="cateUpdArea" id="cateDelArea">
						<div class="newWrapper">
							<div class="titleArea">
								<h2>신고된 게시글 작성자 경고</h2>
							</div>
							<div class="contentArea">
								<div class="div-inf" id="individual">
								</div>
								<form id=delForm" action="<%= request.getContextPath() %>/admin/report/oneWarnReview" method="POST">
									<input type="hidden" name="reportedNo" id="reportedNo">
									<input type="hidden" name="reportedId" id="reportedId">
									<div class="infSendArea">
										<input type="submit" class="inf-bt2" value="확인">
										<button type="button" class="inf-bt1 closeDelBtn">취소</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- 신고 게시글 작성자 경고 모달 기능 -->
					<script>
						$(function(){
							$('button.WarnBtn').click(function(){
								$("div#cateDelArea").css("display", "block");
								$('div.div-wrapper, nav, header, footer').css("pointer-events", "none");
								
								// 신고된 회원 아이디 알려주기
								var reportedId = $(this).parent('td').siblings('.td-3').html();
								$('div#individual').html("<h2>"+reportedId+" 회원을<br>정말로 경고 처리하겠습니까?</h2>");
								$("input#reportedId").val(reportedId);
								
								// 신고 번호 폼으로 가져오기
								var updno = $(this).parent('td').siblings('.report').html();
								$("input#reportedNo").val(updno);

							});
							$('button.closeDelBtn').click(function(){
								$('div.cateUpdArea').css("display", "none");
								$('div.div-wrapper, nav, header, footer').css("pointer-events", "all");
							});
						});
					</script>
					<!-- 신고 게시글 작성자 선택 경고 모달 -->	
					<div class="cateUpdArea" id="selectWarnArea">
					<div class="newWrapper">
						<div class="titleArea">
							<h2>후기 게시글 삭제</h2>
						</div>
						<div class="contentArea">
							<div class="div-inf">
								<h2>정말로 경고 처리하시겠습니까?</h2>
							</div>
							<form id="selDelForm" action="<%= request.getContextPath() %>/admin/report/selectWarnReview" method="POST">
								<input type="hidden" name="cateSelWarnNo" id="cateSelWarnNo">
								<input type="hidden" name="cateSelWarnReportNo" id="cateSelWarnReportNo">
								<div class="infSendArea">
									<input type="submit" class="inf-bt2" value="확인">
									<button type="button" class="inf-bt1 closeDelBtn">취소</button>
								</div>
							</form>
						</div>
					</div>
					</div>
					<!-- 신고 게시글 작성자 선택 경고 모달 기능 -->
					<script>
						$(function(){
							// 경고
							$('#allWarnBtn').click(function(){
								// 모달 창 띄우기
								$("#selectWarnArea").css("display", "block");
								$('div.div-wrapper, nav, header, footer').css("pointer-events", "none");
								
								// 체크된 아이디 배열로 묶어서 전달
								var arrId = [];
								var $objects = $('.tdCheck');
								
								$.each($objects,function(index,item){
									if($(item).prop('checked')){
										// 선택된 값 삭제 창에 전달
										var selId = $(item).parent('td').siblings('.noTd').html();
										arrId.push(selId);
										$("#cateSelWarnNo").val(arrId);
									}
								});
								// 체크된 신고 번호 배열로 묶어서 전달
								var arrNo = [];
								var $objects = $('.tdCheck');
								
								$.each($objects,function(index,item){
									if($(item).prop('checked')){
										// 선택된 값 삭제 창에 전달
										var selno = $(item).parent('td').siblings('.report').html();
										arrNo.push(selno);
										$("#cateSelWarnReportNo").val(arrNo);
									}
								});
							});
							$('button.closeDelBtn').click(function(){
								$('div.cateUpdArea').css("display", "none");
								$('div.div-wrapper, nav, header, footer').css("pointer-events", "all");
							});
						});
					</script>
					<!-- 후기 게시글 선택 삭제 모달 -->	
					<div class="cateUpdArea" id="selectRemoveArea">
					<div class="newWrapper">
						<div class="titleArea">
							<h2>후기 게시글 삭제</h2>
						</div>
						<div class="contentArea">
							<div class="div-inf">
								<h2>정말로 삭제하시겠습니까?</h2>
							</div>
							<form id="selDelForm" action="<%= request.getContextPath() %>/admin/report/selectDeleteR" method="POST">
								<input type="hidden" name="cateSelDelNo" id="cateSelDelNo">
								<div class="infSendArea">
									<input type="submit" class="inf-bt2" value="확인">
									<button type="button" class="inf-bt1 closeDelBtn">취소</button>
								</div>
							</form>
						</div>
					</div>
					</div>
					<!-- 후기 게시글 선택 삭제 모달 기능 -->
					<script>
						$(function(){
							$('.rNo').attr('style', "display:none;");

							// 게시글 삭제
							$('#allRemoveBtn').click(function(){
								// 모달 창 띄우기
								$("#selectRemoveArea").css("display", "block");
								$('div.div-wrapper, nav, header, footer').css("pointer-events", "none");
								
								// 체크된 번호 배열로 묶어서 전달
								var arrNo = [];
								var $objects = $('.tdCheck');
								
								$.each($objects,function(index,item){
									if($(item).prop('checked')){
										// 선택된 값 삭제 창에 전달
										var selno = $(item).parent('td').siblings('.rNo').html();
										arrNo.push(selno);
										$("#cateSelDelNo").val(arrNo);
									}
								});
							});
							$('button.closeDelBtn').click(function(){
								$('div.cateUpdArea').css("display", "none");
								$('div.div-wrapper, nav, header, footer').css("pointer-events", "all");
							});
						});
					</script>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%> 