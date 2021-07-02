<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 상세</title>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<style>
   #box{ 
            background-color:rgb(224, 239, 132);
            width:100%;
            height:1000px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
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
</style>

</head>
<body>
	<div id="box">
		<section id="section">
			<div id="conbox">
				<div id="wrap">
					<div id="container">
						<div class="inner">
							<h2 style="padding-bottom:20px;">후기 게시판</h2>
							<form id="boardForm" name="boardForm">
								<input type="hidden" name="no" value="${ review.no }" />
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
											<td><fmt:formatDate type="date" value="${ review.createDate }"/></td>
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
											<td colspan="3"><c:if
													test="${ !empty review.originalFileName }">
													<a
														href="javascript:fileDownload('${ review.originalFileName }', '${ review.renamedFileName }')">
														<img src="${ path }/images/file.png" width="20"
														height="20" /> <c:out value="${ review.originalFileName }"></c:out>
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
							</form>
							
							
							
							<br>
							<table id="tbl-comment" width="800" class="table01">
								<colgroup>
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="40%">
									<col width="10%">
									<col width="10%">
									<col width="*">
								</colgroup>
							    <c:forEach var="reply" items="${ list }">
							    <tr>
											<th>작성자</th>
											<td>${ reply.writerId }</td>
											<th>내용</th>
											<td>${ reply.content }</td>
											<th>날짜</th>
											<td>${ reply.createDate }</td>
											<td>
							    			<c:if test="${ !empty loginMember && loginMember.id == reply.writerId }">
						    					<button id="Replyx">삭제</button>
						    				</c:if>
							    		</td>
										</tr>
							    	</c:forEach>
						    </table>
							
							<br>
							<c:if test="${ !empty loginMember }">
							<form action="${ path }/review/reviewReply" method="POST">
								<input type="hidden" name="reviewNo" value="${ review.no }">
	    						<input type="hidden" name="writerId" value="${loginMember.id}">
							<table width="800" class="table01">
								<tr>
									<td width="95" height="30" bgcolor="#eeeeee" align="center">댓글
										내용</td>
									<td width="380" style="padding-left: 10px;">
										<textarea rows="2" cols="55" class="boxTA" style="width: 500px; height: 50px" id="replyContent" name="content"></textarea>
									</td>
									<td width="100" rowspan="3" height="30" align="right" style="padding-right: 15px;">
										<input type="submit" value="등록" class="btn2" style="width: 50pt; height: 50pt;">
									</td>
								</tr>
							</table>
							</form>
							</c:if>
							<br /> <span id="listData" style="display: none;"></span>

							<div class="btn_right mt15">
								<c:if test="${ !empty loginMember && (loginMember.id != review.writerId )}">
									<input type="button" class="btn black" id="btn-report"
										value="신고하기">
								</c:if>
								<button type="button" class="btn black mr5"
									onclick="location.href='${path}/review/reviewList'">목록으로</button>
								<c:if
									test="${ !empty loginMember && (loginMember.id == review.writerId )}">
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
	$("#btn-report").on("click", (e)=>{
		// 신고하기 창 띄우기
		const url = "${path}/review/reviewReport?id=${loginMember.getId()}&reviewNo=${ review.no }&reviewTitle=${ review.title }";
		const status="left=500px, top=200px, width=500px; height=400px";
		
		open(url, "", status);
});	


	$(document).ready(() => {
		
		$("#update").on("click", (e) => {
			location.href = "${ path }/review/reviewModify?no=${ review.no }";
		});
		
		$("#delete").on("click", (e) => {
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				location.replace("${ path }/review/reviewDelete?reviewNo=${ review.no }");
			}
		});
	
	$("#replyContent").on("focus", (e)=>{
		if(${!empty loginMember}){
		alert("로그인 후 작성해주세요");
		$("#userId").focus();
		}
	});
});
	
	$("#Replyx").on("click", (e) => {
		if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
			location.replace("${ path }/review/reviewDelete?reviewNo=${ review.no }");
		}
	});

</script>
</body>
</html>
<%@ include file="../common/footer.jsp"%>