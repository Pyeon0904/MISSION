<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 아이콘 라이브러리 link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 제이쿼리 import -->
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>

<style>
	*{margin:0;padding:0;}
	#challengeDisplay{ width:950px; height:auto; float:left; font-size:0.9em;  }
	.challengeListCont{width:100%; height:330px; margin:0 auto;  }
	.challengeListDisplay ul li{list-style-type:none;float:left;}
	.itemCont{ width:auto; height:330px;  }
	.itemCont .itemPhotoBox {width:180px; height:180px; margin:0 auto; margin-top:20px;}
	.itemCont .itemInfoCont {width:180px; height:auto; margin:10px auto 0 auto;}
	.itemCont .itemInfoCont .itemTitle{ font-weight:bold;}
	.itemCont .itemInfoCont .itemSubCont{margin-top:10px;}
	.itemShowMenu{
		width:180px; height:180px; background:rgba(0,0,0,0.5); 
		position:relative; top:-180px; left:0px; 
		font-size:2.5em; color:white; font-weight:bold; text-align:center; line-height:5.75;
	}
	#pageBarContainer{width:950px; height:60px; text-align:center;  }
	#pageBar{
		width:49%; height:50px; margin:0 auto;  
	}
	#pageBar div.pageArrow {
		width:30px; height:30px; margin:10px 10px 0 10px; float:left; 
		color:white; background-color:brown; font-size:2em; 
		border-radius:5px; line-height:0;
	}
	#pageBar div.pageCount{ 
		width:30px; height:30px; border:none; background-color:#61380B;
		border-radius:50%; margin:10px; float:left;
	}
</style>
</head>
<body>
					<div id="challengeDisplay">
						<!-- 상품 리스트 -->
							<div class="challengeListCont">
							<!-- 상품 리스트 내역 -->
								<div class="challengeListDisplay">
									<ul>
									<c:if test="${ (list == null) or (pageInfo.listCount == 0)}">
										<li style="width:25%;">
											<div class="itemCont">
												<div class="itemPhotoBox">
													<img src="${path}/resources/images/file.png" alt="desc" width="200px">
												</div>
												<div class="itemInfoCont">
													<p>
														<span class="itemTitle">등록된 챌린지를 찾을 수 없습니다.</span><br>
														<span class="itemSubCont">NONE!</span>
													</p>
												</div>
											</div>
										</li>
										<script>
										$(document).ready(() => {
											alert("해당 챌린지를 찾을 수 없습니다!");
										});	
										</script>
									</c:if>
									<c:if test="${ list != null }">
										<c:forEach var="challenge" items="${ list }" >
											<!-- D-Day 로직 구현한 파일 include -->
											<%@ include file="../challenge/date.jsp" %>
											<%@ include file="../challenge/objectRecruitMyPage.jsp" %>
										</c:forEach>
									</c:if>
									<script>
										$(document).ready(()=>{
											$("div.itemShowMenu").hide();
											
											$(".itemPhotoBox").hover(
												function(){
													$(this).find(".itemShowMenu").fadeIn(200);
												}, 
												function(){
													$(this).find(".itemShowMenu").fadeOut(200);
												}
											);
											
											$("#categoryBar ul li").hover(
													function(){
														$(this).css("background", "#FFF000");
													}, 
													function(){
														$(this).css("background", "none");
													}
												);
										});
									</script>
									</ul>
								</div>
							</div>
							
					<div id="pageBarContainer">
						<div id="pageBar">
							<!-- 맨 처음으로 -->
							<div class="pageButton pageArrow firstPage" onclick="location.href='${ path }/member/objectZzimList?page=1'">
								 <i class="fa fa-fast-backward" aria-hidden="true"></i>
							</div>
							<!-- 이전 페이지로 -->
							<div class="pageButton pageArrow prevPage" onclick="location.href='${ path }/member/objectZzimList?page=${ pageInfo.prvePage }'">
								 <i class="fa fa-caret-left" aria-hidden="true"></i>
							</div>			
							<!--  10개 페이지 목록 -->
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
					        	<c:if test="${ pageInfo.currentPage == status.current}">
									<div class="pageButton pageCount" style="background-color:yellow;">
					              		<c:out value="${ status.current }"/>
					               	</div>
					            </c:if>
					            <c:if test="${ pageInfo.currentPage != status.current}">
					               	<div class="pageButton pageCount pageNum" onclick="location.href='${ path }/member/objectZzimList?page=${ status.current }'">
					               		<c:out value="${ status.current }"/>
					               	</div>
					            </c:if>
					        </c:forEach>
					        
					        <!-- 맨 끝으로 -->
							<div class="pageButton pageArrow pageMax" style="float:right;"
								onclick="location.href='${ path }/member/objectZzimList?page=${ pageInfo.maxPage}'">
								 <i class="fa fa-fast-forward" aria-hidden="true"></i>
							</div>
							
					        <!-- 다음 페이지로 -->
							<div class="pageButton pageArrow pageNext" style="float:right;"
								onclick="location.href='${ path }/member/objectZzimList?page=${ pageInfo.nextPage }'">
								 <i class="fa fa-caret-right" aria-hidden="true"></i>
							</div>
							
							<script>
							$(document).ready(()=>{
								/*
									pageBar class 지정

									맨처음	.firstPage
									이전		.prevPage
									번호지정	.pageNum
									맨끝		.pageMax
									다음		.pageNext
								*/
								
							});
							</script>		
							
						</div><!-- #pageBar -->
					</div><!-- #pageBarContainer -->
				</div><!-- challengeDisplay -->
</body>
</html>