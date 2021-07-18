<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%> 

<c:set var="path" value="${ pageContext.request.contextPath }" />
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
            background-color:rgb(224, 239, 132);
            width:100%;
            height:5000px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
            margin-top:330px;
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

h2{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:20px;color:#666;letter-spacing:0px}

td,th,caption{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:13px;color:#666;letter-spacing:0px}

input, button{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;overflow:visible}
input[type="radio"]{*width:13px;*height:13px;font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;}
input[type="checkbox"]{*width:13px;*height:13px;font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;vertical-align:middle}
input[type="text"]{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;color:#666;padding-left:3px;border:1px solid #ABADB3}
input[type="password"]{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;color:#666;padding-left:3px;border:1px solid #cdcdcd}
input[type="file"]{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;height:22px;color:#666;background:#fff;border:1px solid #cdcdcd}
select{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;color:#666;vertical-align:middle;border:none}
textarea{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;color:#666;padding:5px;vertical-align:middle;border:1px solid #cdcdcd}
em, address{font-style:normal}

/* layout */
html, body{padding:0;margin:0;width:100%;height:100%;}

#wrap{position:relative;width:100%;height:100%}
#container .inner{width:1000px; margin:0 auto; padding:10px 0}
 
/* table */
table.table01 {border-collapse:separate;border-spacing:0;text-align:center;line-height:1.5;border-top:1px solid #ccc;border-left:1px solid #ccc;margin:auto;}
table.table01 th {padding: 10px;font-weight: bold;vertical-align: middle;text-align:center;border-right:1px solid #ccc;border-bottom:1px solid #ccc;border-top:1px solid #fff;border-left:1px solid #fff;background:#eee;}
table.table01 td {padding:10px;vertical-align:middle;text-align:center;border-right:1px solid #ccc;border-bottom:1px solid #ccc;}

table.table02 caption{height:45px;line-height:45px;color:#333;padding-left:35px;border-top:1px solid #464646;border-bottom:1px solid #c9c9c9;background:#ececec}
table.table02 caption.center{padding-top:6px;height:39px;line-height:130%;text-align:center;color:#333;padding-left:0;border-top:3px solid #464646;border-bottom:1px solid #c9c9c9;background:#ececec}
table.table02 tbody th{padding:10px;vertical-align:middle;font-family:'malgunbd';color:#333;border-right:1px solid #c9c9c9;border-bottom:1px solid #c9c9c9;background:#ececec}
table.table02 tbody td{padding:10px;vertical-align:middle;padding-left:15px;background:#fafafa;border-bottom:1px solid #c9c9c9}

/* link_style 
a:link, a:visited, a:hover, a:active{color:#666;text-decoration:underline}
a:hover{color:#0076c8} */

/* button */
.btn {font-family:'malgunbd';display:inline-block;padding:3px 20px 6px 20px;margin:0;border:1px solid #aaa;cursor:pointer;color:#333;border-radius:2px;vertical-align:middle;font-size:13px;letter-spacing:-1px;line-height:normal;background-color:#feffff;text-decoration:none;}
.btn.black {border-color:#191919;color:#fff;background-color:#333;text-decoration:none;}

/* button_align */
.btn_left{clear:both;text-align:left}
.btn_right{clear:both;text-align:right}
.btn_center{clear:both;text-align:center}

/* select_style */
.selbox{*margin-top:2px;height:28px;*height:18px;padding:3px 4px 4px 3px;border:solid 1px #abadb3;vertical-align:middle}

/* textbox_style */
input.tbox01{width:200px;height:26px;line-height:26px}

/* textarea */
textarea.textarea01{width:410px;height:95px;margin:10px 0}

/* text_color_style */
.t_blue{color:#004fa8}
.t_red{color:#f55500}

/* margin & padding */
.ml5{margin-left:5px}
.ml10{margin-left:10px}
.ml15{margin-left:15px}
.mr5{margin-right:5px}
.mr15{margin-right:15px}
.mr30{margin-right:30px}
.mt15{margin-top:15px}
.mb10{margin-bottom:10px}
.mb25{margin-bottom:25px}

/* page_option */
.page_info{margin-bottom:10px;text-align:right}
.page_info span.total_count{font-size:12px;color:#333}

/* pagination */
.pagination{display:block;margin-top:15px;text-align:center;line-height:normal;color:#666}
.pagination *{display:inline-block;text-decoration:none;vertical-align:top}
.pagination a{text-decoration:none;padding:0 5px;line-height:20px}
.pagination a.onpage{font-family:'malgunbd';color:#0460a5}
.pagination .direction_left01{margin:0 6px 0 3px}
.pagination .direction_right01{margin:0 3px 0 6px}

div#pageBar{margin-top:10px; text-align:center; background-color: rgb(224, 239, 132);}


.ui-autocomplete {
	max-height: 120px;
	overflow-y: auto;
	/* prevent horizontal scrollbar */
	overflow-x: hidden;
	}
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
			<div id="wrap">
				<div id="container">
					<div class="inner">
								<!-- 탭 -->
			<div class="tabs">
				<ul class="tabs">
					<li class="tab-link">
						<a href="${ path }/admin/member/admin_viewReportMember">신고된 회원</a>
					</li>
					<li class="tab-link current">
						<a href="${ path }/admin/member/admin_viewDeleteMemberw">탈퇴한 회원</a>
					</li>
					<li class="tab-link">
						<a href="${ path }/admin/member/admin_viewAllMember">전체 회원</a>
					</li>
				</ul>
			</div>
			<h2>탈퇴한 회원 관리</h2>
			<div class="btnArea">
				<span class="searchArea">
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
					 <!-- 페이지바 -->
					<div id="pageBar">
						<button onclick="location.href='${ path }/admin/member/admin_viewWithdrawMember?page=1'">&lt;&lt;</button>
						
						<!-- 이전 페이지로 -->
						<button onclick="location.href='${ path }/admin/member/admin_viewWithdrawMember?page=${ pageInfo.prvePage }'">&lt;</button>
			
						<!--  10개 페이지 목록 -->
						<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
							<c:if test="${ pageInfo.currentPage == status.current}">
								<button disabled><c:out value="${ status.current }"/></button>
							</c:if>
							<c:if test="${ pageInfo.currentPage != status.current}">
								<button onclick="location.href='${ path }/admin/member/admin_viewWithdrawMember?page=${ status.current }'">
									<c:out value="${ status.current }"/>
								</button>
							</c:if>
						</c:forEach>
						
						<!-- 다음 페이지로 -->
						<button onclick="location.href='${ path }/admin/member/admin_viewWithdrawMember?page=${ pageInfo.nextPage }'">&gt;</button>
						
						<!-- 맨 끝으로 -->
						<button onclick="location.href='${ path }/admin/member/admin_viewWithdrawMember?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
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
								$('div#individual').html("<h2>"+secId+" 회원을<br> 복구 하시겠습니까?</h2>");
								
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