<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${ path }/resources/css/review.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 상세</title>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<style>
   #box{ background-color:rgb(224, 239, 132); width:100%; height:1500px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
         margin-top:330px; margin-bottom:100px; margin-left:-10px; padding:10px;}
   #conbox{ width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/ position:relative; top:20px; margin:auto;}
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
											<td>${ review.no }</td>
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
													<a href="javascript:fileDownload('${ review.originalFileName }', '${ review.renamedFileName }')">
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

							<!-- 댓글 테이블 : 작성 ----------------------->
							<table class="type04">
								<colgroup>
										<col width="14%">
								</colgroup>
								<tbody>
								<tr>
									<th style="vertical-align: middle;">${ loginMember.id }</th>
									<td>
										<textarea rows="2" cols="55" class="boxTA" style="width: 500px; height: 50px" id="replyContent"
											name="content" placeholder="댓글을 작성하려면 로그인이 필요합니다." required></textarea>
									</td>
									<td>&emsp;</td>
									<td style="vertical-align: middle;">
										<c:if test="${ !empty loginMember}">
											<input type="submit" value="등록" class="btn2" />
											<input type="reset" value="취소" class="btn2" />
										</c:if>
									</td>
								</tr>
								<!-- 댓글 테이블 : 등록된 댓글 불러오기----------------------->
								<c:forEach var="reply" items="${ list }">
									<c:choose>
										<c:when test="${ reply.no ==  test }">
											<form action="${ path }/review/replyModify" method="POST">
												<input type="hidden" name="reviewNo" value="${ review.no }">
												<input type="hidden" name="no" value="${ reply.no }">
												<input type="hidden" name="writerId" value="${ reply.writerId }">
												<tr>
													<th scope="row"><p>${ reply.writerId }</p></th>
													<td colspan="2"><textarea name="content" style="width: 500px; height: 50px"><c:out value="${ reply.content }"></c:out></textarea></td>
													<td>
														<c:if test="${ !empty loginMember && (loginMember.id == reply.writerId )}">
															<button type="submit">완료</button>
											</form>
															<button onclick="location.href='${ path }/review/reviewView?no=${ review.no }'">취소</button>
														</c:if>
													</td>
												</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<th id="replyWriterId" scope="row">${ reply.writerId }</th>
												<td id="replyContent">${ reply.content }</td>
												<td id="replyCreateDate"><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${ reply.createDate }" /></td>
												<td>
													<c:if test="${ !empty loginMember && (loginMember.id == reply.writerId )}">
														<button id="replyModify" data-no="${ reply.no }">수정</button>
														<button id="replyDelete" data-no="${ reply.no }">삭제</button>
													</c:if>
												</td>
											</tr>
										</c:otherwise>
									</c:choose>
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
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

<script type="text/javascript">
	$(document).on("click","#replyModify",function(){ 
		var replyNo = $(this).attr("data-no")
		location.replace("${ path }/review/replyModify?replyNo="+replyNo+"&reviewNo=${ review.no }");
	});		

	// 댓글 삭제 버튼 클릭시 삭제
	$(document).on("click","#replyDelete",function(){ 
				var replyNo = $(this).attr("data-no")
				if(confirm("정말로 댓글을 삭제 하시겠습니까?")) {
		 		location.replace("${ path }/review/replyDelete?replyNo="+replyNo+"&reviewNo=${ review.no }");
		    	}
	});	
	


	// 신고하기 버튼 클릭시 팝업 띄우기
	$("#btn-report").on("click", (e)=>{
		const url = "${path}/review/reviewReport?id=${loginMember.getId()}&reviewNo=${ review.no }";
		const status="left=500px, top=200px, width=510px; height=320px";
		
		open(url, "", status);
	});	

	// 게시글 수정&삭제 버튼 클릭시
	$(document).ready(() => {
		
		$("#update").on("click", (e) => {
			location.href = "${ path }/review/reviewModify?no=${ review.no }";
		});
		
		$("#delete").on("click", (e) => {
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				location.replace("${ path }/review/reviewDelete?reviewNo=${ review.no }");
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