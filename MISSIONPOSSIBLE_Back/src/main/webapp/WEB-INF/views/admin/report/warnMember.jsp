<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>  

<c:set var="path" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet" href="${ path }/resources/css/review.css">
<link rel="stylesheet" href="${ path }/resources/css/admin2.css">

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
   #box{ background-color:none; width:100%; height:5000px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
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
								<li class="tab-link">
									<a href="${ path }/admin/member/admin_viewReportMember">신고된 회원</a>
								</li>
								<li class="tab-link">
									<a href="${ path }/admin/report/reportChallenge">신고된 챌린지</a>
								</li>
								<li class="tab-link">
									<a href="${ path }/admin/report/reportReview">신고된 후기 게시글</a>
								</li>
								<li class="tab-link current">
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
								<button class="enroll-bt1" id="allWarnBtn">탈퇴</button>
							</span>
						</div>
						<!-- 게시글 리스트 테이블 ------------------------>
						<div class="tbArea">
							<table class="cateListTb memListTb">
								<tr id="titleTd">
									<th><input type="checkbox" id="allChecked"></th>
									<th>회원번호</th>
									<th>회원ID</th>
									<th>경고횟수</th>
									<th>상태</th>
									<th>처리</th>
								</tr>
								<c:if test="${ list.isEmpty() }">
									<tr>
										<td colspan="6">조회된 경고 회원이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${ !list.isEmpty() }">
									<c:forEach var="member" items="${ list }">
										<tr>
											<td><input type="checkbox" class="tdCheck"></td>
											<td>${ member.memberNo }</td>
											<td class="view-click td-3 noTd"><c:out value="${ member.id }"/></td>
											<td><c:out value="${ member.report_count }" /></td>
											<td>
											<c:if test="${ member.status == 'N' }">탈퇴처리</c:if>
											<c:if test="${ member.status == 'Y' }">활동중</c:if>
											</td>
											<td>
												<c:if test="${ member.status == 'Y' }">
												<button type="button" id="selectWarnBtn" class="stat-bt1 WarnBtn">탈퇴</button>
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
					<!-- 경고 회원 탈퇴 모달 -->
					<div class="cateUpdArea" id="cateDelArea">
						<div class="newWrapper">
							<div class="titleArea">
								<h2>경고 받은 회원 탈퇴</h2>
							</div>
							<div class="contentArea">
								<div class="div-inf" id="individual">
								</div>
								<form id=delForm" action="${ path }/admin/report/delMember" method="POST">
									<input type="hidden" name="warnId" id="warnId">
									<div class="infSendArea">
										<input type="submit" class="inf-bt2" value="확인">
										<button type="button" class="inf-bt1 closeDelBtn">취소</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- 경고 회원 탈퇴 모달 기능 -->
					<script>
						$(function(){
							// 게시글 삭제
							$('button.WarnBtn').click(function(){
								$("div#cateDelArea").css("display", "block");
								$('div.div-wrapper, nav, header, footer').css("pointer-events", "none");
								
								// 탈퇴 시킬 아이디 알려주기
								var warnId = $(this).parent('td').siblings('.td-3').html();
								$('div#individual').html("<h2>"+warnId+" 회원을<br>정말로 탈퇴 처리하겠습니까?</h2>");
								$("input#warnId").val(warnId);

							});
							$('button.closeDelBtn').click(function(){
								$('div.cateUpdArea').css("display", "none");
								$('div.div-wrapper, nav, header, footer').css("pointer-events", "all");
							});
						});
					</script>
					<!-- 경고 회원 선택 탈퇴 모달 -->	
					<div class="cateUpdArea" id="selectWarnArea">
					<div class="newWrapper">
						<div class="titleArea">
							<h2>경고 받은 회원 탈퇴</h2>
						</div>
						<div class="contentArea">
							<div class="div-inf">
								<h2>정말로 탈퇴 처리하시겠습니까?</h2>
							</div>
							<form id="selDelForm" action="${ path }/admin/report/selectDelMember" method="POST">
								<input type="hidden" name="cateSelWarnId" id="cateSelWarnId">
								<div class="infSendArea">
									<input type="submit" class="inf-bt2" value="확인">
									<button type="button" class="inf-bt1 closeDelBtn">취소</button>
								</div>
							</form>
						</div>
					</div>
					</div>
					<!-- 경고 회원 선택 탈퇴 모달 기능 -->
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
										$("#cateSelWarnId").val(arrId);
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