<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%> 

<c:set var="path" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet" href="${ path }/resources/css/review.css">
<link rel="stylesheet" href="${ path }/resources/css/admin.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 게시판</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="/resources/demos/style.css">
<style>
	#box{ 
            background-color:none;
            width:100%;
            height:auto; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
            margin-top:50px;
            margin-bottom:100px;
            margin-left:-10px;
            padding:10px;
         }

         #conbox{
            width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
            position:relative; 
            top:20px;
            margin:auto;
         }


.ui-autocomplete {
	max-height: 120px;
	overflow-y: auto;
	/* prevent horizontal scrollbar */
	overflow-x: hidden;
	}
	
	/* 페이지 타이틀 이미지 작업 */
	h2{
		color:black;
	}
	.pageTitle{
		margin-left : 265px;
	}
	/* ---------------------- */
	
</style>
</head>
<script>
$(function () {
    $(".memberA").css({ "background": "var(--black)", "color": "var(--white)" });

	//검색
	var searchSource = [];
	
	<c:forEach var="memberId" items="${listMemberId}">
		searchSource.push("${memberId}");
	</c:forEach>
	
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
		<!-- title 이미지 삽입 -->
		<a><img class="pageTitle"
			src="${path}/resources/images/pageTitle/신고관리.png" />
		</a>
			<div id="wrap">
				<div id="container">
					<div class="inner">
						<!-- 탭 -->
						<div class="tabs">
							<ul class="tabs">
								<li class="tab-link current">
									<a href="${ path }/admin/member/admin_viewReportMember">신고된 회원</a>
								</li>
								<li class="tab-link">
									<a href="${ path }/admin/report/reportChallenge">신고된 챌린지</a>
								</li>
								<li class="tab-link">
									<a href="${ path }/admin/report/reportReview">신고된 후기 게시글</a>
								</li>
								<li class="tab-link">
									<a href="${ path }/admin/report/warnMember">경고 회원 관리</a>
								</li>
							</ul>
						</div>
						<div class="cateList">
						<div class="head">
							<h2 style="color:white;">_</h2>
						</div>
						<div class="btnArea">
							<span class="searchArea">
								<input type="text" id="searchTxt" name="searchTxt" placeholder="검색">
								<button class="enroll-bt1" id="allRemoveBtn">경고</button>
							</span>
						</div>
						<!-- 신고된 멤버 테이블 ------------------------>
						<div class="tbArea">
							<table class="cateListTb memListTb">
								<tr id="titleTd">
									<th><input type="checkbox" id="allChecked"></th>
									<th style="width:11%;">신고일자</th>
									<th>신고자ID</th>
									<th>신고된ID</th>
									<th>신고유형</th>
									<th style="width:18%;">신고내용</th>
									<th style="width:11%;">경고횟수</th>
									<th>상태</th>
									<th>처리</th>
								</tr>
								<c:if test="${ admin_memberList.isEmpty() }">
									<tr>
										<td colspan="9">조회된 신고 회원이 없습니다.</td>
									</tr>
								</c:if>
								
								<c:if test="${ admin_memberList != null}">
									<c:forEach var="memberReport" items="${ admin_memberList }">
										<tr>
											<td><input type="checkbox" class="tdCheck"></td>
											<td style="width: 100px"><fmt:formatDate type="date" value="${ memberReport.createDate }" /></td>
											<td><c:out value="${ memberReport.id }" /></td>
											<td style="color: red;" class="noTd"><c:out value="${ memberReport.reportId }" /></td>
											<td><c:out value="${ memberReport.reportType }" /></td>
											<td><c:out value="${ memberReport.reportContent }" /></td>
											<td><c:out value="${ memberReport.reportCount }" /></td>
											<td>
												<c:if test="${ memberReport.status eq 'N'}">
													<c:out value="탈퇴" />
												</c:if>
												<c:if test="${ memberReport.status eq 'Y'}">
													<c:out value="활동중" />
												</c:if>
											</td>
											<td>
												<c:if test="${ memberReport.status eq 'Y'}">
													<button type="button" id="selectRemoveBtn" style="content: left;" class="stat-bt1 removeBtn" value="${ memberReport.reportId }">경고</button>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:if>
						</table>	
				<script>
					$(function(){
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
				<!-- 회원 경고 -->
				<div class="cateUpdArea" id="cateDelArea">
					<div class="newWrapper">
						<div class="titleArea">
							<h2>회원 경고</h2>
						</div>
						<div class="contentArea">
							<div class="div-inf" id="individual">
							</div>
							<form id=delForm action="<%= request.getContextPath() %>/admin/member/oneMemberWarn" method="POST">
								<input type="hidden" name="warnMemberId" id="warnMemberId">
								<div class="infSendArea">
									<input type="submit" class="inf-bt2" value="확인">
									<button type="button" class="inf-bt1 closeDelBtn">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<script>
					$(function(){
						$('button.removeBtn').click(function(){
							$("div#cateDelArea").css("display", "block");
							$('div.div-wrapper, nav, header, footer').css("pointer-events", "none");
							
							var secId = $(this).val();
							$('div#individual').html("<h2>"+secId+" 회원을<br> 경고 처리 하시겠습니까?</h2>");
							
							$("input#warnMemberId").val(secId);
						});
						$('button.closeDelBtn').click(function(){
							$('div.cateUpdArea').css("display", "none");
							$('div.div-wrapper, nav, header, footer').css("pointer-events", "all");
						});
					});
				</script>
				<!-- 선택 회원 경고 -->	
				<div class="cateUpdArea" id="selectRemoveArea">
					<div class="newWrapper">
						<div class="titleArea">
							<h2>회원 경고</h2>
						</div>
						<div class="contentArea">
							<div class="div-inf">
								<h2>정말로 경고를 주시겠습니까?</h2>
							</div>
							<form id="selDelForm" action="<%= request.getContextPath() %>/admin/member/selectMemberWarn" method="POST">
								<input type="hidden" name="cateSelWarnNO" id="cateSelWarnNO">
								<div class="infSendArea">
									<input type="submit" class="inf-bt2" value="확인">
									<button type="button" class="inf-bt1 closeDelBtn">취소</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<script>
					$(function(){
						$('#allRemoveBtn').click(function(){
							$("#selectRemoveArea").css("display", "block");
							$('div.div-wrapper, nav, header, footer').css("pointer-events", "none");
							
							var arrID = [];
							var $objects = $('.tdCheck');
							
							$.each($objects,function(index,item){
								if($(item).prop('checked')){
									var selID = $(item).parent('td').siblings('.noTd').html();
									arrID.push(selID);
									$("#cateSelWarnNO").val(arrID);
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