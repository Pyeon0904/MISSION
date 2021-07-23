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
<title>챌린지 게시판</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="/resources/demos/style.css">
<style>
   #box{ background-color:none; width:100%; height:auto; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
         margin-top:50px; margin-bottom:100px; margin-left:-10px; padding:10px;}
   #conbox{ width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/ position:relative; top:20px; margin:auto;}

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
	// 상단 후기 게시판 관리 메뉴 클릭시 black으로 바꾸기
	$(".reviewA").css({ "background" : "var(--black)", "color" : "var(--white)"});

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
		<!-- title 이미지 삽입 -->
		<a><img class="pageTitle"
			src="${path}/resources/images/pageTitle/챌린지관리.png" />
		</a>
			<div id="wrap">
				<div id="container">
					<div class="inner">
						<!-- 탭 -->
						<div class="tabs">
							<ul class="tabs">
								<li class="tab-link current">
									<a href="${ path }/admin/challenge/viewChallenge">전체 챌린지 조회</a>
								</li>
								<li class="tab-link">
									<a href="${ path }/admin/challenge/viewDeleteChallenge">삭제된 챌린지</a>
								</li>
								<li class="tab-link">
									<a href="${ path }/admin/challenge/viewGiveupChallenge">챌린지 포기 사유 조회</a>
								</li>
								<li class="tab-link">
									<a href="${ path }/admin/challenge/viewCategory">카테고리 관리</a>
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
							</span>
							<span class="enrollArea">
								<button class="enroll-bt1" id="allRemoveBtn">삭제</button>
							</span>
						</div>
						<!-- 게시글 리스트 테이블 ------------------------>
						<div class="tbArea">
							<table class="cateListTb memListTb">
								<tr id="titleTd">
									<th><input type="checkbox" id="allChecked"></th>
									<th>번호</th><!-- challengeNo -->
									<th>포인트</th><!-- minusPoint -->
									<th>카테고리</th><!-- attendStatus / categoryName -->
									<th style="width:25%;">제목</th><!-- title -->
									<th style="width:9%;">생성자</th><!-- id -->
									<th>현재인원</th><!-- currentCount/maxCount -->
									<th>진행기간</th><!-- startDate ~ deadline -->
									<th>처리</th>
								</tr>
								<c:if test="${ list.isEmpty() }">
									<tr>
										<td colspan="9">조회된 게시글이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${ !list.isEmpty() }">
									<c:forEach var="challenge" items="${ list }">
										<tr>
											<td><input type="checkbox" class="tdCheck"></td>
											<td class="noTd">${ challenge.challengeNo }</td>
											<td><c:out value="${ challenge.minusPoint }" /></td>
											<td>
												<c:out value="${ challenge.attendStatus }"/>
												 / <c:out value="${ challenge.categoryName }" />
											</td>
											<td class="view-click td-3"><a class="getURL" href="${ path }/challenge/recruit?no=${challenge.challengeNo}" target="viewF">
												<c:out value="${ challenge.title } " /> </a>
											</td>
											<td><c:out value="${ challenge.id }" /></td>
											<td>
												<c:out value="${ challenge.currentCount }"/> / 
												<c:out value="${ challenge.maxCount }"/>
											</td>
											<td>
												<fmt:formatDate value="${ challenge.startDate }" pattern="yyyy-MM-dd"/> ~ 
												<fmt:formatDate value="${ challenge.deadline }" pattern="yyyy-MM-dd"/>
											</td>
											<td>
												<button type="button" id="selectRemoveBtn" class="stat-bt1 removeBtn">삭제</button>
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
					<!-- 후기 게시글 삭제 모달 -->
					<div class="cateUpdArea" id="cateDelArea">
						<div class="newWrapper">
							<div class="titleArea">
								<h2>챌린지 삭제</h2>
							</div>
							<div class="contentArea">
								<div class="div-inf" id="individual">
								</div>
								<form id=delForm" action="${ path }/admin/challenge/oneDelete" method="POST">
									<input type="hidden" name="challengeNo" id="challengeNo">
									<div class="infSendArea">
										<input type="submit" class="inf-bt2" value="확인">
										<button type="button" class="inf-bt1 closeDelBtn">취소</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- 후기 게시글 삭제 모달 기능 -->
					<script>
						$(function(){
							// 게시글 삭제
							$('button.removeBtn').click(function(){
								$("div#cateDelArea").css("display", "block");
								$('div.div-wrapper, nav, header, footer').css("pointer-events", "none");
								
								// 게시글 제목 알려주기
								var title = $(this).parent('td').siblings('.td-3').html();
								$('div#individual').html("<h2>"+title+" 게시글을<br>정말로 삭제하겠습니까?</h2>");
								
								// 게시글 번호 폼으로 가져오기
								var updno = $(this).parent('td').siblings('.noTd').html();
								$("input#challengeNo").val(updno);
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
							<h2>챌린지 삭제</h2>
						</div>
						<div class="contentArea">
							<div class="div-inf">
								<h2>정말로 삭제하시겠습니까?</h2>
							</div>
							<form id="selDelForm" action="${ path }/admin/challenge/selectDelete" method="POST">
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
										var selno = $(item).parent('td').siblings('.noTd').html();
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