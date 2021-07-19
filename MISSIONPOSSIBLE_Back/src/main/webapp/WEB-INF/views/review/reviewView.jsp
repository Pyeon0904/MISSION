<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ path }/resources/css/admin.css">
<link rel="stylesheet" href="${ path }/resources/css/review.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 상세</title>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="/resources/demos/style.css">
<style>
   #box{ background-color:none; width:100%; height:1500px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
         margin-top:330px; margin-bottom:100px; margin-left:-10px; padding:10px;}
   #conbox{ width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/ position:relative; top:20px; margin:auto;}
   .imgButton { width : 35px; height : 35px; }
</style>
</head>
<body>
	<div id="box">
		<section id="section">
			<div id="conbox">
				<div id="wrap">
					<div id="container">
						<div class="inner">
							<h2 style="padding-bottom: 20px;">후기 게시판</h2>
								<input type="hidden" name="no" value="${ review.no }" />
								<!-- 게시판 상세보기 테이블 ----------------------->
								<table width="100%" class="table01">
									<colgroup>
										<col width="15%">
										<col width="35%">
										<col width="15%">
										<col width="*">
									</colgroup>
									<tbody id="tbody">
										<tr>
											<th>글번호</th>
											<td class="noTd td-2">${ review.no }</td>
											<th>조회수</th>
											<td>${ review.viewCount }</td>
										</tr>
										<tr>
											<th>작성자</th>
											<td>${ review.writerId }</td>
											<th>작성일</th>
											<td><fmt:formatDate type="date" value="${ review.createDate }" /></td>
										</tr>
										<tr>
											<th>챌린지 이름</th>
											<td colspan="3">${ review.challengeTitle }</td>
										</tr>
										<tr>
											<th>제목</th>
											<td colspan="3">${ review.title }</td>
										</tr>
										<tr>
											<th>첨부파일</th>
											<td colspan="3">
												<c:if test="${ !empty review.originalFileName }">
													<a style="text-decoration:none; color:#666;" href="javascript:fileDownload('${ review.originalFileName }', '${ review.renamedFileName }')">
														<img src="${ path }/images/file.png" width="20" height="20" /> 
															<c:out value="${ review.originalFileName }"></c:out>
													</a>
													<script>
														function fileDownload(oriname, rename) {
															const url = "${ path }/review/fileDown";
							
															let oName = encodeURIComponent(oriname);
															let rName = encodeURIComponent(rename);
															
															location.assign(url + "?oriname=" + oName + "&rename=" + rName);
														}
													</script>
												</c:if> 
												<c:if test="${ empty review.originalFileName }">
													<span> - </span>
												</c:if></td>
										</tr>
										<tr>
											<th>글 내용</th>
											<td colspan="3">${ review.content }</td>
										</tr>
									</tbody>
								</table>
								<!-- 게시판 상세보기 테이블 끝 ----------------------->		
								<!-- 하트 버튼 클릭시 추천수 +1 ----------------------->
								<c:if test="${ !empty loginMember}">
										<div style="margin-left: 990px;"><b>${ count }</b></div>
									<div style="margin-left: 950px;">
										<c:if test="${ Heartlist.isEmpty() }">
											<form action="${ path }/review/reviewLike" method="POST">
												<c:if test="${ (heart.m_id != loginMember.id )}">
													<input type="hidden" name="r_no" value="${ review.no }">
													<input type="hidden" name="m_id" value="${loginMember.id}">
													<button id="like" style="border:0; background-color:white;"><img class="imgButton" src="${ path }/resources/images/unheart.png"></button>
												</c:if>
											</form>
										</c:if>
										<c:forEach var="heart" items="${ Heartlist }">
										<form action="${ path }/review/reviewUnlike" method="POST">
											<c:if test="${heart.m_id == loginMember.id}">
												<input type="hidden" name="r_no" value="${ review.no }">
												<input type="hidden" name="m_id" value="${loginMember.id}">
												<button id="unlike" style="border:0; background-color:white;"><img class="imgButton" src="${ path }/resources/images/heart.png"></button>
											</c:if>	
										</form>	
										</c:forEach>
									</div>
								</c:if>
								<!-- 하트 버튼 끝 ----------------------->
							<!-- 댓글 테이블 : 작성 ----------------------->
							<table class="type04">
								<colgroup>
										<col width="14%">
								</colgroup>
								<tbody>
								<form action="${ path }/review/reviewReply" method="POST">
								<tr>
									<th style="vertical-align: middle;">${ loginMember.id }</th>
									<td>
										<input type="hidden" name="reviewNo" value="${ review.no }">
										<input type="hidden" name="writerId" value="${loginMember.id}">
										<textarea rows="2" cols="55" class="boxTA" style="width: 500px; height: 50px" id="replyContent"
											name="content" <c:if test="${ empty loginMember}">placeholder="댓글을 작성하려면 로그인이 필요합니다."</c:if> required ></textarea>
									</td>
									<td>&emsp;</td>
									<td style="vertical-align: middle;">
										<c:if test="${ !empty loginMember}">
											<input type="submit" value="등록" class="btn2" />
											<input type="reset" value="취소" class="btn2" />
										</c:if>
									</td>
								</tr>
								</form>	
								<!-- 댓글 테이블 : 등록된 댓글 불러오기----------------------->
								<c:forEach var="reply" items="${ list }">
									<tr>
										<th id="replyWriterId" scope="row">${ reply.writerId }</th>
										<td id="replyContent">${ reply.content }</td>
										<td id="replyCreateDate">
										<c:if test="${ reply.modifyDate != null}">
											<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${ reply.modifyDate }" />
										</c:if>
										<c:if test="${ reply.modifyDate == null}">
											<fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${ reply.createDate }" />
										</c:if>
										</td>
										<td>
											<c:if test="${ !empty loginMember && (loginMember.id == reply.writerId )}">
												<button id="replyModify" data-no="${ reply.no }">수정</button>
												<button id="replyDelete" data-no="${ reply.no }">삭제</button>
											</c:if>
										</td>
									</tr>
								</c:forEach>
								</tbody>									
							</table>
							<!-- 로그인X : 목록으로 / 로그인O : 신고하기 / 작성자 로그인 : 수정하기, 삭제하기 -->
							<div class="btn_right mt15">
								<c:if test="${ !empty loginMember && (loginMember.id != review.writerId )}">
									<input type="button" class="btn black" id="btn-report" value="신고하기">
								</c:if>
								<button type="button" class="btn black mr5" onclick="location.href='${path}/review/reviewList'">목록으로</button>
								<c:if test="${ !empty loginMember && (loginMember.id == review.writerId )}">
									<button type="button" class="btn black mr5" id="update">수정하기</button>
									<button type="button" class="btn black" id="delete">삭제하기</button>
								</c:if>
							</div>
							<!-- 이전글/다음글 -->
							<table class="type04">
								<colgroup>
									<col width="14%">
								</colgroup>
								<tbody>
								<tr>
									<th style="vertical-align: middle;">이전글</th>
									<c:if test="${ !empty prevReview }">
									<td><a style="text-decoration:none; color:#666;" href="${ path }/review/reviewView?no=${prevReview.no}">${ prevReview.title }								
										<c:if test="${ prevReview.replyCount != 0 }">
											[${ prevReview.replyCount }]
										</c:if>
									</a></td>
									</c:if>
									<c:if test="${ empty prevReview }">
									<td>이전 글이 없습니다.</td>
									</c:if>
								</tr>
								<tr>
									<th style="vertical-align: middle;">다음글</th>
									<c:if test="${ !empty nextReview }">
									<td><a style="text-decoration:none; color:#666;" href="${ path }/review/reviewView?no=${nextReview.no}">${ nextReview.title }
										<c:if test="${ nextReview.replyCount != 0 }">
											[${ nextReview.replyCount }]
										</c:if>									
									</a></td>
									</c:if>
									<c:if test="${ empty nextReview }">
									<td>다음 글이 없습니다.</td>
									</c:if>
								</tr>
	  							</tbody>
  							</table>
  							<!-- 이전글/다음글 끝 -->
							<!-- 후기 게시글 신고 모달 -->
							<div class="cateUpdArea" id="cateDelArea">
								<div class="newWrapper">
									<div class="titleArea">
										<h2>후기 게시글 신고</h2>
									</div>
									<div class="contentArea">
										<div class="div-inf" id="individual">
										</div>
										<form id="report" action="${path}/review/reviewReport" method="POST">
								            <table>
								            	<tr>
								                    <td></td>
								                    <td> <!-- 현재 페이지에 담긴 게시글 제목, 게시글 번호, 작성자ID, 신고자ID -->
								                        신고 후기 게시글 : 
								                        <input type="text" name="title" id="title" value=" ${ review.title }" readonly><br>
								                        <input type="hidden" name="r_no" id="r_no" value="${ review.no }"readonly>
								                        <input type="hidden" name="reportedId" id="reportedId" value="${ review.writerId }"readonly>
								                        <input type="hidden" name="sendId" id="sendId" value="${ loginMember.id }"readonly>
								                        <input type="hidden" name="a" id="a" value=""readonly>
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
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

<script type="text/javascript">
	// 댓글 수정 버튼 클릭시
	$(document).on("click","#replyModify",function(){ 
		var replyNo = $(this).attr("data-no")
		location.replace("${ path }/review/replyModify?replyNo="+replyNo+"&reviewNo=${ review.no }&id=${loginMember.getId()}");
	});		

	// 댓글 삭제 버튼 클릭시
	$(document).on("click","#replyDelete",function(){ 
				var replyNo = $(this).attr("data-no")
				if(confirm("정말로 댓글을 삭제 하시겠습니까?")) {
		 		location.replace("${ path }/review/replyDelete?replyNo="+replyNo+"&reviewNo=${ review.no }&id=${loginMember.getId()}");
		    	}
	});	
	

	// 신고하기 버튼 클릭시 팝업 띄우기
	$().on("click", (e)=>{
		const url = "${path}/review/reviewReport?id=${loginMember.getId()}&reviewNo=${ review.no }";
		const status="left=500px, top=200px, width=510px; height=320px";
		
		open(url, "", status);
	});	

	// 게시글 수정&삭제 버튼 클릭시
	$(document).ready(() => {
		
		$("#update").on("click", (e) => {
			location.href = "${ path }/review/reviewModify?no=${ review.no }&id=${loginMember.getId()}";
		});
		
		$("#delete").on("click", (e) => {
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				location.replace("${ path }/review/reviewDelete?reviewNo=${ review.no }&id=${loginMember.getId()}");
			}
		});
	});
	
	// 댓글창 focus시 입력창 배경색 바꾸기
	$("#replyContent").on({
		focus : function(){
			$(this).css("background-color","#eee");
		},
		blur : function(){
			$(this).css("background-color","white");
		}
	});
	
	// 댓글창 클릭시 alert창 띄우기
	$("#replyContent").on("click", (e) => {
	if(${ empty loginMember}){
		alert("로그인 후 사용하세요")
	}
	});
	
</script>
</body>
</html>
<%@ include file="../common/footer.jsp"%>