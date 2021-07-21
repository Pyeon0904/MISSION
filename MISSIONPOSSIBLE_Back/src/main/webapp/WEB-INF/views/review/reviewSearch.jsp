<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%> 

<c:set var="path" value="${ pageContext.request.contextPath }" />
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
   #box{ background-color:none; width:100%; height:1000px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
         margin-top:auto; margin-bottom:100px; margin-left:-10px; padding:10px;}
   #conbox{ width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/ position:relative; top:20px; margin:auto;}
</style>
</head>
<script>
    $(function() {
    	
        var searchSource = new Array(); // 배열 형태 

        <c:forEach var="review" items="${ title }">        
    	searchSource.push("${review.title}");
	    </c:forEach>
	    <c:forEach var="review" items="${ c_title }">        
			searchSource.push("${review.challengeTitle }");
	    </c:forEach>
	    <c:forEach var="review" items="${ writer }">        
			searchSource.push("${review.writerId }");
		</c:forEach>
	        
        $("#searchInput").autocomplete({      // 오토 컴플릿트 시작
            source : searchSource,    		  // source 는 자동 완성 대상
            select : function(event, ui) {    // 아이템 선택시
                console.log(ui.item);
            },
            focus : function(event, ui) {    // 포커스 가면
                return false;				 // 한글 에러 잡기 용도로 사용됨
            },
            minLength: 1,					// 최소 글자수
            autoFocus: true, 				// 첫번째 항목 자동 포커스 기본값 false
            classes: {    
                "ui-autocomplete": "highlight"
            },
            delay: 500,    					// 검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//          disabled: true,   	   			   자동완성 기능 끄기
            scroll:true,
            position: { my : "right top", at: "right bottom" }, 
            close : function(event){    	// 자동완성창 닫아질 때 호출
                console.log(event);
            }
        });
        
    });
</script>
<div id="box">
	<section id="section">
		<div id="conbox">
			<div id="wrap">
				<div id="container">
					<div class="inner">
						<a><img class="pageTitle" src="${path}/resources/images/pageTitle/후기게시판.png" /></a>
						<!-- 검색 폼 시작--------------------- -->
						<form id="reviewSearch" name="form1" method="GET" action="${path}/review/reviewSearch">
							<div align="right" class="row m-4">
								<select name="key" class="form-control" required>
									<option value="" selected disabled hidden>::검색 유형::</option>
									<option value="1">글제목</option>
									<option value="2">작성자</option>
									<option value="3">글내용</option>
									<option value="4">챌린지이름</option>
									<option value="5">전체</option>
								</select> 
								<input type="text" id="searchInput" name="word" class="form-control" 
									style="width: 200px; padding: 3px 20px 6px 20px" value=${ word }>
								<button type="submit" class="btn btn-warning">검색</button>
							</div>
						</form>
						<!-- 검색 폼 끝------------------------>

						<!-- 게시글 리스트 테이블 ------------------------>
						<br>
						<br>
						<table width="100%" class="table01">
							<colgroup>
								<col width="10%" />
								<col width="25%" />
								<col width="15%" />
								<col width="20%" />
								<col width="10%" />
							</colgroup>
							<thead>
								<tr id="titleTd">
									<th>글번호</th>
									<th>제목</th>
									<th>챌린지</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
								<c:if test="${ list == null }">
									<tr>
										<td colspan="6">조회된 게시글이 없습니다.</td>
									</tr>
								</c:if>
							</thead>
							<tbody id="tbody">
								<c:if test="${ list != null }">
									<c:forEach var="review" items="${ list }">
										<tr>
											<td><c:out value="${ review.no }" /></td>
											<td><a href="${ path }/review/reviewView?no=${review.no}">
												<c:out value="${ review.title } " /> 
													<c:if test="${ review.replyCount != 0 }">
														[${ review.replyCount }]
													</c:if>
												</a>
											</td>
											<td>
											<c:if test="${ review.challengeTitle != null }">
												<c:out value="${ review.challengeTitle }" />
											</c:if>
											<c:if test="${ review.challengeTitle == null }">
												-
											</c:if>			
											</td>
											<td><c:out value="${ review.writerId }" /></td>
											<td><fmt:formatDate type="date" value="${ review.createDate }" /></td>
											<td><c:out value="${ review.viewCount }" /></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<!-- 게시글 리스트 테이블 끝 ------------------------>

						<!-- 로그인 된 회원에게만 글쓰기 버튼 보이기 ------------>
						<div class="btn_right mt15">
							<c:if test="${ loginMember != null }">
								<button type="button" class="button_base b01_simple_rollover" 
									onclick="location.href='${path}/review/reviewWrite'">글쓰기</button>
							</c:if>
						</div>
					</div>

					<!-- 페이징 처리 ------------>
					<div style="align: center; margin-top:10px; text-align:center;">
						<!-- 맨 처음으로 -->
						<button onclick="location.href='${ path }/review/reviewSearch?page=1&key=${key}&word=${word}'">&lt;&lt;</button>
						
						<!-- 이전 페이지로 -->
						<button onclick="location.href='${ path }/review/reviewSearch?page=${  pageInfo.prvePage }&key=${key}&word=${word}'">&lt;</button>
			
						<!--  10개 페이지 목록 -->
						<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
							<c:if test="${ pageInfo.currentPage == status.current }">
								<button disabled><c:out value="${ status.current }" /></button>
							</c:if>
							<c:if test="${ pageInfo.currentPage != status.current }">
								<button onclick="location.href='${ path }/review/reviewSearch?page=${ status.current }&key=${key}&word=${word}'"><c:out value="${ status.current }" /></button>
							</c:if>
						</c:forEach>
						
						<!-- 다음 페이지로 -->
						<button onclick="location.href='${ path }/review/reviewSearch?page=${  pageInfo.nextPage }&key=${key}&word=${word}'">&gt;</button>
						
						<!-- 맨 끝으로 -->
						<button onclick="location.href='${ path }/review/reviewSearch?page=${  pageInfo.maxPage }&key=${key}&word=${word}'">&gt;&gt;</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>