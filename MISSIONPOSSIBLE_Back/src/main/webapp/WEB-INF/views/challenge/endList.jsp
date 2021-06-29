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

<!-- 아이콘 라이브러리 link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 제이쿼리 import -->
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>

<style>
		/* 전체 영역--------------------------------------------------------------------------*/
				
			/*---------------제일 바깥 영역 설정-----------------*/
			#box{ 
			   background-color:rgb(224, 239, 132);
			   width:100%;
			   height:1200px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
			   margin-top:330px;
			   margin-bottom:100px;
			   margin-left:-10px;
			   padding:10px;
			}
			/*-------------------컨텐츠 영역---------------------*/
			#conbox{
				width:1200px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
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
					<h2>종료된 챌린지 목록</h2>
					<!-- 챌린지 검색 바... 이거도 구현해야함...ㅠ.ㅠ -->
					<div class="searchArea">
						<form action="#" method="GET" class="" id="challengeSearchForm">
							<input type="hidden" name="" value="" />
							<div class="inputGroup">
								<input type="text" class="searchBox" name="term" placeholder="챌린지 검색" />
								<span class="inputGroupBtn">
									<button class="btn btnSearch" type="submit">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
						</form>
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
					
					<!-- 챌린지 진열 구역 -->
					<div id="challengeDisplay">
						<div class="categoryArea">
							<h3>종료된 챌린지</h3>
							<!-- 조회된 챌린지의 개수 -->
							<p>총 <c:out value="${ pageInfo.listCount }"/>개</p>
						</div>
						<hr>
						<div class="challengeList">
						<!-- 상품 리스트 -->
							<div class="challengeListCont">
							<!-- 상품 리스트 내역 -->
								<div class="challengeListDisplay">
									<ul>
									<c:if test="${ list == null }">
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
									</c:if>
									<c:if test="${ list != null }">
										<c:forEach var="challenge" items="${ list }">
											<li style="width:25%;">
												<div class="itemCont">
													<div class="itemPhotoBox">
														<c:if test="${ challenge.thumbnailFile == null }">
															<img src="${path}/resources/images/file.png" alt="기본 이미지" width="180px" height="180px"/>
														</c:if>
														<c:if test="${ challenge.thumbnailFile != null }">
															<img src="${path}/resources/upload/challenge/${ challenge.thumbnailFile }" alt="챌린지 썸네일" 
																width="180px" height="180px" onerror="this.src='${path}/resources/images/file.png'"/>
														</c:if>
														<div class="itemShowMenu" onclick="location.href='${ path }/challenge/recruit?no=${ challenge.challengeNo }'">
															<span class="details">상세보기</span>
														</div>
													</div>
													<div class="itemInfoCont">
														<p>
															<span class="itemTitle">
																<c:out value="${ challenge.title }"/>
															</span>
															
															<!-- 
																D-Day / 오늘날짜 / startDate / deadline 값 사용하기 위한 로직 구현 
																D-Day / 오늘날짜 / startDate / deadline 값 사용하기 위한 로직 구현
																D-Day / 오늘날짜 / startDate / deadline 값 사용하기 위한 로직 구현
																D-Day / 오늘날짜 / startDate / deadline 값 사용하기 위한 로직 구현
																D-Day / 오늘날짜 / startDate / deadline 값 사용하기 위한 로직 구현
															-->
															
															<!-- 챌린지 모집기간 마감 D-Day 구하기 위해 오늘 날짜 구하기 시작 -->
															<c:set var="today" value="<%= new java.util.Date()%>"/>
															<fmt:formatDate var="todayDate" value="${ today }" pattern="yyyyMMdd"/>
															<!-- 챌린지 모집기간 마감 D-Day 구하기 위해 오늘 날짜 구하기 끝 -->
															
															<!-- D-Day 구하기 시작(Date객체를 숫자로 형변환) -->
															<!-- 챌린지 시작일을 날짜로 형변환 -->
															<fmt:formatDate var="startstartDate" value="${ challenge.startDate }" pattern="yyyyMMdd"/>
															<!-- 챌린지 수료일을 날짜로 형변환 -->
															<fmt:formatDate var="endDate" value="${ challenge.deadline }" pattern="yyyyMMdd"/>
															<!-- 
																오늘 날짜 및 데이터베이스에 저장된 날짜를 숫자로 형변환 
															-->
															<fmt:parseDate value="${ todayDate }" var="tDate" pattern = "yyyyMMdd"/>
															<fmt:parseDate value="${ startstartDate }" var="sDate" pattern = "yyyyMMdd"/>
															<fmt:parseDate value="${ endDate }" var="eDate" pattern = "yyyyMMdd"/>
															<fmt:parseNumber value="${tDate.time / (1000*60*60*24)}" integerOnly="true" var="todayNum" scope="request" />
															<fmt:parseNumber value="${sDate.time / (1000*60*60*24)}" integerOnly="true" var="startNum" scope="request" />
															<fmt:parseNumber value="${eDate.time / (1000*60*60*24)}" integerOnly="true" var="endNum" scope="request" />
															
														</p>
													</div>
												</div>
											</li>
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
											
											$(".itemShowMenu").on("click",function(event){
												alert("해당 챌린지 상세 페이지로 이동합니다!");
											});
											
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
								맨 처음으로 
								<button class="pageArrow" onclick="<%--location.href='<%= request.getContextPath() %>/board/list?page=1'--%>"><i class="fa fa-fast-backward" aria-hidden="true"></i></button>
							-->
							
							<!-- 이전 페이지로 -->
							<div class="pageArrow" onclick="location.href='${ path }/challenge/endList?page=${ pageInfo.prvePage }'">
								 <i class="fa fa-caret-left" aria-hidden="true"></i>
							</div>			
							<!--  10개 페이지 목록 -->
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
					        	<c:if test="${ pageInfo.currentPage == status.current}">
									<div class="pageCount" style="background-color:yellow;">
					              		<c:out value="${ status.current }"/>
					               	</div>
					            </c:if>
					            <c:if test="${ pageInfo.currentPage != status.current}">
					               	<div class="pageCount" onclick="location.href='${ path }/challenge/endList?page=${ status.current }'">
					               		<c:out value="${ status.current }"/>
					               	</div>
					            </c:if>
					        </c:forEach>
					        <!-- 다음 페이지로 -->
							<div class="pageArrow" onclick="location.href='${ path }/challenge/endList?page=${ pageInfo.nextPage }'">
								 <i class="fa fa-caret-right" aria-hidden="true"></i>
							</div>
									
							<!-- 맨 끝으로 
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