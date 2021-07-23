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
	
	.tab-link current{
		color: green;
	}
	
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
			src="${path}/resources/images/pageTitle/회원관리.png" />
		</a>
			<div id="wrap">
				<div id="container">
					<div class="inner">
						<!-- 탭 -->
						<div class="tabs">
							<ul class="tabs">
								<li class="tab-link current">
									<a href="${ path }/admin/member/admin_viewAllMember">활동중인 회원</a>
								</li>
								<li class="tab-link">
									<a href="${ path }/admin/member/admin_viewWithdrawMember">탈퇴한 회원</a>
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
								<button class="enroll-bt1" id="allRemoveBtn">탈퇴</button>
							</span>
						</div>
						<!-- 전체(활동중) 멤버 테이블 ------------------------>
						<div class="tbArea">
							<table class="cateListTb memListTb">
								<tr id="titleTd">
									<th><input type="checkbox" id="allChecked"></th>
									<th style="width:8%;">회원번호</th>
									<th>ID</th>
									<th>등급</th>
									<th>포인트</th>
									<th style="width:11%;">닉네임</th>
									<th>이메일</th>
									<th>경고횟수</th>
									<th>처리</th>
								</tr>
								<c:if test="${ admin_allMemberList != null}">
									<c:forEach var="allMemberList" items="${ admin_allMemberList }">
										<tr>
											<td><input type="checkbox" class="tdCheck"></td>
											<td><c:out value="${ allMemberList.memberNo }" /></td>
											<td class="noTd"><c:out value="${ allMemberList.id }" /></td>
											<td><c:out value="${ allMemberList.gradeName }" /></td>
											<td><c:out value="${ allMemberList.point }" /></td>
											<td><c:out value="${ allMemberList.nickname }" /></td>
											<td><c:out value="${ allMemberList.email }" /></td>
											<td><c:out value="${ allMemberList.report_count }" /></td>
											<td>
												<button type="button" id="selectRemoveBtn" style="content: left;" class="stat-bt1 removeBtn" value="${ allMemberList.id }">탈퇴</button>
											</td>
										</tr>
									</c:forEach>
								</c:if>
						</table>
			    <!-- 게시글 리스트 테이블 끝 ------------------------>	
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
				<!-- 회원 탈퇴 -->
				</script>
				<div class="cateUpdArea" id="cateDelArea">
					<div class="newWrapper">
						<div class="titleArea">
							<h2>회원 탈퇴</h2>
						</div>
						<div class="contentArea">
							<div class="div-inf" id="individual">
							</div>
							<form id=delForm action="${ path }/admin/member/onedelMember" method="POST">
								<input type="hidden" name="oneDeleteId" id="oneDeleteId">
								<div class="infSendArea">
									<input type="submit" class="inf-bt2" value="확인">
									<button type="button" class="inf-bt1 closeDelBtn">취소</button>
								</div>
							</form>
						</div>
					</div>
					</div>
				</div>
				<script>
					$(function(){
						//회원 탈퇴
						$('button.removeBtn').click(function(){
							$("div#cateDelArea").css("display", "block");
							$('div.div-wrapper, nav, header, footer').css("pointer-events", "none");
							
							var secId = $(this).val();
							$('div#individual').html("<h2>' "+secId+" ' 회원을<br> 정말로 탈퇴 처리 하시겠습니까?</h2>");
							
							// 회원 탈퇴 폼으로 가져오기
							$("input#oneDeleteId").val(secId);
						});
						$('button.closeDelBtn').click(function(){
							$('div.cateUpdArea').css("display", "none");
							$('div.div-wrapper, nav, header, footer').css("pointer-events", "all");
						});
					});
				<!-- 선택된 회원 탈퇴 -->
				</script>
				<div class="cateUpdArea" id="selectRemoveArea">
					<div class="newWrapper">
						<div class="titleArea">
							<h2>회원 탈퇴</h2>
						</div>
						<div class="contentArea">
							<div class="div-inf">
								<h2>정말로 탈퇴를 하시겠습니까?</h2>
							</div>
							<form id="selDelForm" action="${ path }/admin/member/selectDelMember" method="POST">
								<input type="hidden" name="cateSelDelNo" id="cateSelDelNo">
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
									$("#cateSelDelNo").val(arrID);
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
		</div>
	</section>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%> 