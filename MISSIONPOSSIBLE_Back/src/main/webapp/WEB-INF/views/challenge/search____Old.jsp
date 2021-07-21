<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%>
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

<!-- ������ ���̺귯�� link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- �������� import -->
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>

<style>
		/* ---------------------------------------------------------------------*/
				
			/*--------------------------------*/
			#box{ 
			   background-color:none;
			   width:100%;
			   height:1200px; 
			   margin-top:330px;
			   margin-bottom:100px;
			   margin-left:-10px;
			   padding:10px;
			}
			/*----------------------------------------*/
			#conbox{
				width:1200px; 
				position:relative; 
				top:20px;
				margin:auto;
			}
			    
		/*-----------------------------------------------------------------------------------*/
    	
    #subHeaderContainer{width:100%; height:70px; }
    #subHeaderContainer h2{float:left; margin-top:20px;}
	#subHeaderContainer .searchArea{
		width:310px; height:40px; 
		float:right; margin-right:26px;
		margin-top:20px;
	}    
	#subHeaderContainer .searchArea .inputGroup .searchBox{
		width:243px; height:40px; border:4px solid #61380B;
		margin-left:7.2px; float:left; padding:5px;
	}
	#subHeaderContainer .searchArea .inputGroup .inputGroupBtn .btnSearch{
		width:55px; height:40px; 
		border:1px solid gray;
		/*border-left-style:none;
		border-right-style:1px solid gray;
		border-top-style:none;
		border-bottom-style:1px solid gray;*/
		border-style:none;
		border-radius:0;
		background-color:#61380B;
		color:white;
		margin-left:-2px;
	}
    
	#categoryBar{ width:200px; height:150px; float:left;}
	#categoryBar ul{ list-style-type : none;}
	#categoryBar ul li{ width:200px; height:50px; border-bottom:1px solid gray; line-height:3;}
	
	#challengeDisplay{ width:950px; height:auto; float:left; font-size:0.9em; margin-left:20px;}
	.categoryArea {width:890px; height:auto; margin:0 auto; padding:10px 0;}
	.categoryArea p {float:right; margin-top:-10px;}
	.challengeListCont{width:890px; height:auto; margin:0 auto;}
	.challengeListDisplay ul li{list-style-type:none;float:left;}
	.itemCont{ width:auto; height:275px;}
	.itemCont .itemPhotoBox {width:180px; height:180px; margin:0 auto; margin-top:20px;}
	.itemCont .itemInfoCont {width:180px; height:auto; margin:10px auto 0 auto;}
	.itemCont .itemInfoCont .itemTitle{ font-weight:bold;}
	.itemCont .itemInfoCont .itemSubCont{margin-top:10px;}
	.itemShowMenu{
		width:180px; height:180px; background:rgba(0,0,0,0.5); 
		position:relative; top:-180px; left:0px; 
		font-size:2.5em; color:white; font-weight:bold; text-align:center; line-height:5.75;
	}
	#pageBarContainer{width:950px; height:60px; text-align:center; float:right; margin-right:30px;}
	#pageBar{
		width:255px; height:50px; margin:0 auto;
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
	<div id="box">
		<section id="section">
			<div id="conbox">
			
				
				
				<div id="subHeaderContainer">
					<h2>검색 결과</h2>
					<div class="searchArea">
						 <!-- 검색 폼 시작--------------------- -->
				         <form id="challengeSearch" name="form1" method="GET" action="${path}/challenge/search">
				            <div align="right" class="row m-4">
				               <select name="key" class="form-control" required>
				                  <option value="" selected disabled hidden>::검색 유형::</option>
				                  <option value="1">챌린지 제목</option>
				                  <option value="2">챌린지 등록자 ID</option>
				                  <option value="3">챌린지 내용</option>
				                  <option value="4">카테고리 이름</option>
				                  <option value="5">전체</option>
				               </select>
				          
				               <input type="text" name="word" class="form-control" style="padding: 3px 20px 6px 20px" value=${ word }>
				               <button type="submit" class="btn btn-warning" >검색</button>
				            </div>
				         </form>
				         <!-- 검색 폼 끝---------------------- -->
					</div>
				</div><!-- #subHeaderContainer -->
				
				<div id="productContainer">
					<!-- 카테고리 바 -->
					<div id="categoryBar">
						<ul id="categoryList">
						    <li onclick="location.href='${recruitListViewPath}'">모집중인 챌린지</li>
						    <li onclick="location.href='${ongoingListViewPath}'">진행중인 챌린지</li>
						    <li onclick="location.href='${endListViewPath}'">종료된 챌린지</li>
						</ul>
					</div><!-- categoryBar -->
					
					<!-- ç���� ���� ���� -->
					<div id="challengeDisplay">
						<div class="categoryArea">
							<h3>검색 결과</h3>
							<!-- ��ȸ�� ç������ ���� -->
							<p>총 <c:out value="${ pageInfo.listCount }"/>개</p>
						</div>
						<hr>
						<div class="challengeList">
						<!-- ��ǰ ����Ʈ -->
							<div class="challengeListCont">
							<!-- ��ǰ ����Ʈ ���� -->
								<div class="challengeListDisplay">
									<ul>
									<c:if test="${ (list == null) or (pageInfo.listCount == 0)}">
										<li style="width:25%;">
											<div class="itemCont">
												<div class="itemPhotoBox">
													<img src="${path}/resources/images/file.png" alt="desc" width="200px">
												</div>
												<div class="itemInfoCont" style="margin-top:30px;">
													<p>
														<span class="itemTitle">챌린지를 찾을 수 없음</span><br>
														<span class="itemSubCont">NONE!</span>
													</p>
												</div>
											</div>
										</li>
									</c:if>
									<c:if test="${ list != null }">
										<c:forEach var="challenge" items="${ list }">
										<!-- D-Day ���� ������ ���� include -->
										<%@ include file="date.jsp" %>
											<c:choose>
												<c:when test="${ todayNum < startNum && todayNum < endNum }">
													<%@ include file="objectRecruit.jsp" %>
												</c:when>
												<c:when test="${ todayNum >= startNum && todayNum < endNum }">
													<%@ include file="objectOngoing.jsp" %>
												</c:when>
												<c:when test="${ todayNum >= startNum && todayNum >= endNum }">
													<%@ include file="objectEnd.jsp" %>
												</c:when>
												<c:otherwise>
													<li style="width:25%;">
														<div class="itemCont">
															<div class="itemPhotoBox">
																<img src="${path}/resources/images/file.png" alt="desc" width="200px">
															</div>
															<div class="itemInfoCont">
																<p>
																	<span class="itemTitle">챌린지를 찾을 수 없음</span><br>
																	<span class="itemSubCont">NONE!</span>
																</p>
															</div>
														</div>
													</li>
												</c:otherwise>
											</c:choose>
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
						</div>
					</div><!-- #challengeDisplay -->
					<div id="pageBarContainer">
						<div id="pageBar">
							<!-- 
								�� ó������ 
								<button class="pageArrow" onclick="<%--location.href='<%= request.getContextPath() %>/board/list?page=1'--%>"><i class="fa fa-fast-backward" aria-hidden="true"></i></button>
							-->
							
							<!-- ���� �������� -->
							<div class="pageArrow" onclick="location.href='${ path }/challenge/search?page=${  pageInfo.prvePage }&key=${key}&word=${word}'">
								 <i class="fa fa-caret-left" aria-hidden="true"></i>
							</div>			
							<!--  10�� ������ ��� -->
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
					        	<c:if test="${ pageInfo.currentPage == status.current}">
									<div class="pageCount" style="background-color:yellow;">
					              		<c:out value="${ status.current }"/>
					               	</div>
					            </c:if>
					            <c:if test="${ pageInfo.currentPage != status.current}">
					               	<div class="pageCount" onclick="location.href='${ path }/challenge/search?page=${ status.current }&key=${key}&word=${word}'">
					               		<c:out value="${ status.current }"/>
					               	</div>
					            </c:if>
					        </c:forEach>
					        <!-- ���� �������� -->
							<div class="pageArrow" onclick="location.href='${ path }/challenge/search?page=${ pageInfo.nextPage }&key=${key}&word=${word}'">
								 <i class="fa fa-caret-right" aria-hidden="true"></i>
							</div>
									
							<!-- �� ������ 
							<button class="pageArrow" onclick="<%-- location.href='<%= request.getContextPath() %>/board/list?page=<%= pageInfo.getMaxPage() %>'--%>"><i class="fa fa-fast-forward" aria-hidden="true"></i></button>'
							-->
						</div><!-- #pageBar -->
					</div><!-- #pageBarContainer -->
				</div><!-- #productContainer -->
				
			</div>
		</section>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>