<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- LIST PATH -->
<!-- 모집중인 챌린지 리스트 페이지 path -->
<c:set var="recruitListViewPath" value="${ path }/challenge/recruitList"/>
<!-- 진행중인 챌린지 리스트 페이지 path -->
<c:set var="ongoingListViewPath" value="${ path }/challenge/ongoingList"/>
<!-- 종료된 챌린지 리스트 페이지 path -->
<c:set var="endListViewPath" value="${ path }/challenge/endList"/>

<!-- VIEW PATH -->
<!-- 모집중인 챌린지뷰 페이지 path -->
<c:set var="recruitViewPath" value="${ path }/challenge/recruit"/>
<!-- 진행중인 챌린지뷰 페이지 path -->
<c:set var="ongoingViewPath" value="${ path }/challenge/ongoing"/>
<!-- 참여중인 챌린지뷰 페이지 path -->
<c:set var="ongoingViewPath" value="${ path }/challenge/participate"/>
<!-- 종료된 챌린지뷰 페이지 path -->
<c:set var="endViewPath" value="${ path }/challenge/end"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>s</title>

<!-- 아이콘 라이브러리 link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 제이쿼리 import -->
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>

<style>
/*	.test{border:1px solid gray}*/	
	#challengeDisplay{ width:950px; height:auto; float:left; font-size:0.9em;}
	.notFound{width:980px; height:200px;background-color:#edffed; border-radius:10px;text-align:center;margin:10px 0 0 50px;line-height:200px;}
	.challengeListDisplay {margin-left:-40px; margin-top:-15px;}
	.challengeListDisplay ul li{width:25%; height:290px;list-style-type:none;float:left;border-radius:8px; background-color:#edffed;}
	.itemCont{ width:auto; height:275px;}
	.itemCont .itemPhotoBox {width:180px; height:180px; margin:0 auto; margin-top:20px;}
	.itemCont .itemInfoCont {width:180px; height:auto; margin:10px auto 0 auto;}
	.itemCont .itemInfoCont .itemTitle{ font-weight:bold;}
	.itemCont .itemInfoCont .itemSubCont{margin-top:10px;}
	.itemShowMenu{
		width:180px; height:180px; background:rgba(0,0,0,0.5); 
		position:relative; top:-36px; left:0px; 
		font-size:2.5em; color:white; font-weight:bold; text-align:center; line-height:5.75;
		opacity : 0; transition : 0.3s;
	}
	.itemShowMenu:hover{opacity:1}
	.itemOpacCont{
		width:180px; height:180px;
		position:relative; top:-198px;
		opacity:0; transition : 0.3s;
	}
	.itemOpacCont:hover{opacity:1}
	.itemDelete{
		width:30px; height:30px; background:rgba(255,0,0,0.5);
		position:relative; top:-238px; left:150px;
		font-size:1.5em; color:white; font-weight:bold; text-align:center;
	}
	
	/*페이지 바 CSS 구현*/
	.pagination-container { width:1015px; height:60px;float:right;margin:0 auto;text-align: center; position:absolute; top:300px;}
	.pagination { position: relative;}
	.pagination a {position: relative;display: inline-block;color: #0b520b;text-decoration: none;font-size: 1.2rem;padding: 8px 16px 10px;}
	.pagination a:before { z-index: -1; position: absolute;height: 100%;width: 100%;content: "";top: 0;left: 0;background-color: #0b520b;border-radius: 24px;transform: scale(0);transition: all 0.2s;}
	.pagination a:hover,.pagination a .pagination-active {color: #fff;}
	.pagination a:hover:before,.pagination a .pagination-active:before {transform: scale(1);}
	.pagination .pagination-active {color: #fff;}
	.pagination .pagination-active:before {transform: scale(1);}
	.pagination-newer {margin-right: 50px;}
	.pagination-older {margin-left: 50px;}
	
	footer{width:100%; height:100px; position:absolute; bottom:-650px;}
</style>
</head>
<body>
					<div id="challengeDisplay" class="test">
						<div class="challengeListDisplay">
							<c:if test="${ (list == null) or (pageInfo.listCount == 0)}">
								<div class="notFound">
									<h2>조건에 일치하는 챌린지를 찾을 수 없습니다.</h2>
								</div>
							</c:if>
							<c:if test="${ list != null }">
							<ul class="test">
										<c:forEach var="challenge" items="${ list }" >
											<!-- D-Day 로직 구현한 파일 include -->
											<%@ include file="../challenge/date.jsp" %>
											<%@ include file="../challenge/objectRecruitMyPage.jsp" %>
										</c:forEach>
							</ul>
							</c:if>
							<script>
								function zzimDelete(no){
									if(confirm("해당 챌린지를 찜 목록에서 삭제하시겠습니까?")){
										location.href="${path}/challenge/zzimDelete.do?cNo="+no;
									} else {
										alert("사용자에 의해 찜 목록 삭제 요청이 취소되었습니다.");
									}
								}
							</script>
						</div>
					</div><!-- #challengeDisplay -->
					<div class="pagination-container">
						<div class="pagination">
							<!-- 이전 페이지로 -->
							<a class="pagination-newer" href="${ path }/member/objectZzimList?page=${ pageInfo.prvePage }">PREV</a>			
							<!--  10개 페이지 목록 -->
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
					        	<c:if test="${ pageInfo.currentPage == status.current}">
					               	<a class="pagination-active"><c:out value="${ status.current }"/></a>
					            </c:if>
					            <c:if test="${ pageInfo.currentPage != status.current}">
					               	<a href="${ path }/member/objectZzimList?page=${ status.current }"><c:out value="${ status.current }"/></a>
					            </c:if>
					        </c:forEach>
					        <!-- 다음 페이지로 -->
							<a class="pagination-older" href="${ path }/member/objectZzimList?page=${ pageInfo.nextPage }">NEXT</a>		
						</div><!-- #pageBar -->
					</div><!-- .pagination-container -->
</body>
</html>
<%@ include file="../common/footer.jsp"%>