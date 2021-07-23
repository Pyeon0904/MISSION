<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%> 

<c:set var="path" value="${ pageContext.request.contextPath }" />
<link rel="stylesheet" href="${ path }/resources/css/admin.css">
<link rel="stylesheet" href="${ path }/resources/css/review.css">
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

	// 검색
	$("#searchTxt").keyup(function(){
        var text = $(this).val();
        $(".cateListTb tr:not(#titleTd)").hide();
        
        var temp = $(".cateListTb td:contains('"+text+"')");
        $(temp).parent().show();
    });
    
    // 메세지 버튼
    $("button#mem-msg-btn").click(function() {
        $("table#message-tb").css({ "display": "block" });
    });

    // 닫기 버튼
    $('#close-btn, #close-btn2').click(function () {
        $('.commView').css("display", "none");
        $('div.div-wrapper').css("pointer-events", "all");
    });

});
</script>
<div id="box">
	<section id="section">
		<div id="conbox">
		<!-- title 이미지 삽입 -->
		<a><img class="pageTitle"
			src="${path}/resources/images/pageTitle/회원관리.png" />
		</a>
			<div id="wrap">
				<div id="container">
					<div class="inner">
							<!-- 탭 -->
							<div class="tabs">
							<ul class="tabs">
								<li class="tab-link">
									<a href="${ path }/admin/member/admin_viewAllMember">활동중인 회원</a>
								</li>
								<li class="tab-link current">
									<a href="${ path }/admin/member/admin_viewWithdrawMember">탈퇴한 회원</a>
								</li>
							</ul>
			</div>
			<div class="cateList">
			<div class="head">
				<h2 style="color:white;">_</h2>
			</div>
			<div class="btnArea">
				<span class="searchArea" style="margin-left: 800px;">
					<input type="text" id="searchTxt" name="searchTxt" placeholder="검색">
				</span>
			</div>
			<!-- 탈퇴 리스트 테이블 ------------------------>
					<div class="tbArea">
						<table class="cateListTb memListTb">
							<tr id="titleTd">
									<th>날짜</th>
									<th>탈퇴한 회원 ID</th>
									<th>탈퇴 이유</th>
									<th>복구</th>
							</tr>
							<c:if test="${ admin_WithdrawalMemberList != null }">
								<c:forEach var="WithdrawalMemberList" items="${ admin_WithdrawalMemberList }">
									<tr>
										<td style="width: 200px"><fmt:formatDate type="date" value="${ WithdrawalMemberList.dateWithdrawal }"/></td>
										<td style="width: 200px; color: red"><c:out value="${ WithdrawalMemberList.id }" /></td>
										<td>
										<c:if test="${ WithdrawalMemberList.reason == null}">
												<c:out value="기입한 내용이 없습니다." />
										</c:if>
										<c:if test="${ WithdrawalMemberList.reason != null}">
											<c:out value="${ WithdrawalMemberList.reason }" />
										</c:if>
										</td>
										<td><button type="button" id="Return" class="stat-bt1 removeBtn" value="${ WithdrawalMemberList.id }">복구</button></td>
									</tr>
								</c:forEach>
							</c:if>
						</table>	
					</div>
					<!-- 회원 복구 확인  -->
					<div class="cateUpdArea" id="cateDelArea">
						<div class="newWrapper">
							<div class="titleArea">
								<h2>회원 복구</h2>
							</div>
							<div class="contentArea">
								<div class="div-inf" id="individual">
								</div>
								<form id=delForm action="<%= request.getContextPath() %>/admin/member/oneMemberReturn" method="POST">
									<input type="hidden" name="returnMemberId" id="returnMemberId">
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
							// 회원복구
							$('button.removeBtn').click(function(){
								$("div#cateDelArea").css("display", "block");
								$('div.div-wrapper, nav, header, footer').css("pointer-events", "none");
								
								// 회원 아이디 알려주기
								var secId = $(this).val();
								$('div#individual').html("<h2>' "+secId+" ' 회원을<br> 정말로 복구 하시겠습니까?</h2>");
								
								// 아이디 폼으로 가져오기
								$("input#returnMemberId").val(secId);
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
	</section>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%> 