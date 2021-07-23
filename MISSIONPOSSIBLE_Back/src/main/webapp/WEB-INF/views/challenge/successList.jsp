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
   #box{ background-color:none; width:100%; height:auto; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
         margin-top:50px; margin-bottom:100px; margin-left:-10px; padding:10px;}
   #conbox{ width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/ position:relative; top:20px; margin:auto;}
   /* 물방울 이미지 위치 */
   .pageTitle{margin-left: -32px;}
   
</style>
</head>

<div id="box">
	<section id="section">
		<div id="conbox">
			<div id="wrap">
				<div id="container">
					<div class="inner">
						<a> 
							<img class="pageTitle" src="${path}/resources/images/pageTitle/painting.png" style="width:70px;"/>
							<div style="width:200px; height:30px; position:relative; top:-70px;"><h2 style="color:black; font-size:1.5em;">작전 성공 챌린지</h2></div>
						</a>

						<!-- 챌린지 리스트 테이블 ------------------------>
						<br>
						<br>
						<table width="100%" class="table01" style="position:relative;top:-70px;">
							<colgroup>
								<col width="10%" />
								<col width="15%" />
								<col width="15%" />
								<col width="40%" />
								<col width="20%" />
							</colgroup>
							<thead>
								<tr id="titleTd">
									<th>번호</th>
									<th>유형</th>
									<th>카테고리</th>
									<th>제목</th>
									<th>달성일</th>
								</tr>
								<c:if test="${ list == null }">
									<tr>
										<td colspan="5">해당하는 챌린지가 없습니다.</td>
									</tr>
								</c:if>
							</thead>
							<tbody id="tbody">
								<c:if test="${ list != null }">
									<c:forEach var="challenge" items="${ list }">
										<tr>
											<td><c:out value="${ challenge.challengeNo }" /></td>
											<td>
												<c:if test="${ challenge.attendStatus == 'PUBLIC' }">
													단체
												</c:if>
												<c:if test="${ challenge.attendStatus != 'PUBLIC' }">
													개인
												</c:if>
											</td>
											<td>
												<c:out value="${ challenge.categoryName }"/>										
											</td>
											<td><a href="${ path }/challenge/recruit?no=${challenge.challengeNo}" style="text-decoration:none; color:#666;">
												<c:out value="${ challenge.title } " /> 
												</a>
											</td>
											<td><fmt:formatDate type="both" value="${ challenge.deadline }" pattern="yyyy-MM-dd"/></td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						<!-- 챌린지 리스트 테이블 끝 ------------------------>
					</div>

					<!-- 페이징 처리 ------------>
					<div style="align: center; margin-top:10px; text-align:center;">
						<!-- 맨 처음으로 -->
						<button onclick="location.href='${ path }/challenge/successList?page=1'">&lt;&lt;</button>

						<!-- 이전 페이지로 -->
						<button onclick="location.href='${ path }/challenge/successList?page=${  pageInfo.prvePage }'">&lt;</button>

						<!--  10개 페이지 목록 -->
						<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
							<c:if test="${ pageInfo.currentPage == status.current }">
								<button disabled>
									<c:out value="${ status.current }" />
								</button>
							</c:if>
							<c:if test="${ pageInfo.currentPage != status.current }">
								<button onclick="location.href='${ path }/challenge/successList?page=${ status.current }'">
									<c:out value="${ status.current }" />
								</button>
							</c:if>
						</c:forEach>

						<!-- 다음 페이지로 -->
						<button onclick="location.href='${ path }/challenge/successList?page=${  pageInfo.nextPage }'">&gt;</button>

						<!-- 맨 끝으로 -->
						<button onclick="location.href='${ path }/challenge/successList?page=${  pageInfo.maxPage }'">&gt;&gt;</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>