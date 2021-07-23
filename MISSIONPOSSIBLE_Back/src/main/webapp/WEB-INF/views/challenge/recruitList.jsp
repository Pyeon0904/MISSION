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

<!-- view 페이지용 테스트 CSS link -->
<link rel="stylesheet" href="${ path }/resources/css/btn-view.css">

<!-- 제이쿼리 import -->
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
		/* 전체 영역--------------------------------------------------------------------------*/
				
			/*---------------제일 바깥 영역 설정-----------------*/
			#box{ 
			   background-color:none;
			   width:100%;
			   height:auto; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
			   margin-top:50px;
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
/*	.test{border:1px solid gray}*/
    #subHeaderContainer{width:100%; height:100px; float:left;}
    #subHeaderContainer .subHeaderImg{width:300px; height:70px; float:left;position:relative;left:-35px;}
	#subHeaderContainer .searchArea{
		width:400px; height:80px;
		float:right; margin-top:20px;
	}
	#searchInput{
		border-top:none;
		border-right:none; 
		border-bottom:3px solid #64b564; 
		border-left:none; 
		width:150px;height:25px; 
		margin-right:-5px;
		padding: 0 5px 0 5px;
	}
	.selectBox{
		width:110px;
		height:27px;
		border-top:none;
		border-right:none; 
		border-bottom:3px solid #64b564; 
		border-left:none;
	}
	#subHeaderContainer .listCountArea{width:70px; height:30px; float:right; margin-top:15px; text-align:right;}
    
	#categoryBar{ width:200px; height:1000px; float:left;}
	#categoryBar ul{ list-style-type : none;}
	#categoryBar ul li{ width:200px; height:50px; border-bottom:1px solid #62bf6e; line-height:3; position:relative;left:-40px; top:-18px; font-size:1em;font-weight:bold;transition : 0.3s;}
	#categoryBar ul li:hover{background:#8df08d; color:#fff;}
		
	#challengeDisplay{ width:995px; height:auto; float:right; font-size:0.9em;}
	.notFound{width:980px; height:200px;background-color:#edffed; border-radius:10px;text-align:center;margin:10px 0 0 50px;line-height:200px;}
	.challengeListDisplay {margin-left:-40px; margin-top:-15px;}
	.challengeListDisplay ul li{width:22.5%; height:30%;margin:1%;list-style-type:none;float:left;border-radius:8px; background-color:#edffed;}
	.itemCont{ width:auto; height:275px;}
	.itemCont .itemPhotoBox {width:180px; height:180px; margin:0 auto; margin-top:20px;}
	.itemCont .itemInfoCont {width:180px; height:auto; margin:10px auto 0 auto;}
	.itemCont .itemInfoCont .itemTitle{ font-weight:bold;}
	.itemCont .itemInfoCont .itemSubCont{margin-top:10px;}
	.itemShowMenu{
		width:180px; height:180px; background:rgba(0,0,0,0.5); 
		position:relative; top:-233px; left:0px; 
		font-size:2.5em; color:white; font-weight:bold; text-align:center; line-height:5;
		opacity : 0; transition : 0.3s;
	}
	.itemShowMenu:hover{opacity:1}
	
	/*페이지 바 CSS 구현*/
	.pagination-container { width:1015px; height:60px;float:right;margin:0 auto;text-align: center;}
	.pagination { position: relative;}
	.pagination a {position: relative;display: inline-block;color: black;text-decoration: none;font-size: 1.2rem;padding: 8px 16px 10px;}
	.pagination a:before { z-index: -1; position: absolute;height: 100%;width: 100%;content: "";top: 0;left: 0;background-color: #1afc1a;border-radius: 24px;transform: scale(0);transition: all 0.2s;}
	.pagination a:hover,.pagination a .pagination-active {color: #fff;}
	.pagination a:hover:before,.pagination a .pagination-active:before {transform: scale(1);}
	.pagination .pagination-active {color: #fff;}
	.pagination .pagination-active:before {transform: scale(1);}
	.pagination-newer {margin-right: 50px;}
	.pagination-older {margin-left: 50px;}
	
	/*오른쪽 위 input 버튼 추가 CSS 수정*/
	.btn.green {background-color: #6fde7e;}/*버튼 윗부분*/
	.btn.green {box-shadow: 0px 4px 0px #62bf6e;}/*버튼 아랫부분*/
	.btn.green:active {box-shadow: 0 0 #62bf6e; background-color: #62bf6e;}/*버튼 아랫부분*/
	
	footer{width:100%; height:100px; position:absolute; bottom:-800px;}
</style>
<script>
    $(function() {
    	
        var searchSource = new Array(); // 배열 형태 

	        <c:forEach var="challenge" items="${ mmcTitle }">        
	        	searchSource.push("${challenge.title}");
	        </c:forEach>
	        <c:forEach var="challenge" items="${ mmcId }">        
        		searchSource.push("${challenge.id }");
	        </c:forEach>
	        <c:forEach var="challenge" items="${ mmcatName }">        
	    		searchSource.push("${challenge.categoryName }");
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
</head>
<body>
	<div id="box">
		<section id="section">
			<div id="conbox">
				<div id="subHeaderContainer" class="test">
					<!--modify-->
					<div class="subHeaderImg test">
						<img alt="" src="${path}/resources/images/pageTitle/모집중인챌린지목록.png">
					</div>
					<div class="searchArea test">
						 <!-- 검색 폼 시작--------------------- -->
				         <form id="challengeSearch" name="form1" method="GET" action="${path}/challenge/search">
				            <div align="right" class="row m-4">
				               <select name="key" class="selectBox" required>
				                  <option value="" selected disabled hidden>::검색 유형::</option>
				                  <option value="1">챌린지 제목</option>
				                  <option value="2">챌린지 등록자 ID</option>
				                  <option value="3">챌린지 내용</option>
				                  <option value="4">카테고리 이름</option>
				                  <option value="5">전체</option>
				               </select>
				          
				               <input type="text" name="word" class="form-control" id="searchInput" value=${ word }>
				               <button type="submit" class="btn green mini" >검색</button>
				            </div>
				         </form>
				         <!-- 검색 폼 끝---------------------- -->
				         <div class="listCountArea test">
							총 <c:out value="${ pageInfo.listCount }"/>개
						</div>
					</div>
					
				</div><!-- #subHeaderContainer -->
				<div id="productContainer" class="test">
					<!-- 카테고리 바 -->
					<div id="categoryBar" class="test">
						<ul id="categoryList">
						    <li class="btn-category btn-3" onclick="location.href='${recruitListViewPath}'">모집중인 챌린지</li>
						    <li class="btn-category btn-3" onclick="location.href='${ongoingListViewPath}'">진행중인 챌린지</li>
						    <li class="btn-category btn-3" onclick="location.href='${endListViewPath}'">종료된 챌린지</li>
						</ul>
					</div><!-- categoryBar -->
					
					<!-- 챌린지 진열 구역 -->
					<div id="challengeDisplay" class="test">
						<div class="challengeListDisplay">
							<c:if test="${ (list == null) or (pageInfo.listCount == 0)}">
								<div class="notFound">
									<h2>조건에 일치하는 챌린지를 찾을 수 없습니다.</h2>
								</div>
							</c:if>
							<c:if test="${ list != null }">
							<ul class="test">
								<c:forEach var="challenge" items="${ list }">
									<li class="test">
										<div class="itemCont">
											<div class="itemPhotoBox">
												<c:if test="${ challenge.thumbnailFile == null }">
													<img src="${path}/resources/images/c_img/chall02.png" alt="기본 이미지" width="180px" height="180px"/>
												</c:if>
												<c:if test="${ challenge.thumbnailFile != null }">
													<img src="${path}/resources/upload/challenge/${ challenge.thumbnailFile }" alt="챌린지 썸네일" 
														width="180px" height="180px" onerror="this.src='${path}/resources/images/c_img/chall02.png'"/>
												</c:if>
												<div class="viewPoint" style="width:100px;height:50px;position:relative;top:-170px;left:10px">
													<img src="${path}/resources/images/point/${challenge.minusPoint}p.png" width="50px" height="25px"/>
												</div>
												<div class="itemShowMenu" onclick="location.href='${ path }/challenge/recruit?no=${ challenge.challengeNo }'" style="z-index:2">
													<span class="details">상세보기</span>
												</div>
												<div class="viewStatus" style="width:100px;height:50px;position:relative;top:-370px;left:10px; z-index:1">
													<img src="${path}/resources/images/point/icon_recruit.png" width="50px" height="25px"/>
												</div>
											</div>
											<div class="itemInfoCont">
												<p>
													<span class="itemTitle">
														<c:out value="${ challenge.title }"/>
													</span>
													<br>
													<span class="itemSubCont">챌린지 모집기간</span>
													<br>
													
													<!-- D-Day 로직 구현한 파일 include -->
													<%@ include file="date.jsp" %>															
																							
													<!-- 
														챌린지 시작일에서 오늘 날짜를 뺌 D-Day 완성! 
													-->
													<span class="itemProgressStatus">
														D-<c:out value="${ startNum - todayNum }"></c:out>
													</span>
												</p>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
							</c:if>
						</div>
					</div><!-- #challengeDisplay -->
					<div class="pagination-container">
						<div class="pagination">
							<!-- 이전 페이지로 -->
							<a class="pagination-newer" href="${ path }/challenge/recruitList?page=${ pageInfo.prvePage }">PREV</a>			
							<!--  10개 페이지 목록 -->
							<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
					        	<c:if test="${ pageInfo.currentPage == status.current}">
					               	<a class="pagination-active"><c:out value="${ status.current }"/></a>
					            </c:if>
					            <c:if test="${ pageInfo.currentPage != status.current}">
					               	<a href="${ path }/challenge/recruitList?page=${ status.current }"><c:out value="${ status.current }"/></a>
					            </c:if>
					        </c:forEach>
					        <!-- 다음 페이지로 -->
							<a class="pagination-older" href="${ path }/challenge/recruitList?page=${ pageInfo.nextPage }">NEXT</a>		
						</div><!-- #pageBar -->
					</div><!-- .pagination-container -->
				</div><!-- #productContainer -->
				<div id="popup" style="width:880px; height:500px;
						background-image:url('${ path }/resources/images/point/챌린지포인트안내.PNG'); 
						background-repeat:no-repeat; background-size:cover;position:fixed;top:0px;left:0px; z-index:1000;
						display:none;box-shadow:5px 5px 5px gray;">
					<div id="closePop" style="font-size:2em;color:#b5645b;width:30px; height:30px; text-align:center;
							position:relative; top:10px;left:830px;">
						<i class="fa fa-times" aria-hidden="true"></i>
					</div>
				</div>
				<div id="question" style="width:80px; height:80px; font-size:2em; position:fixed;bottom:0;right:0;">
					<i class="fa fa-question-circle" aria-hidden="true"></i>
				</div>
				<script>
					$(document).ready(()=>{
						$("#question").on("click", ()=>{
							$("#popup").fadeIn(200);
						});
						$("#closePop").on("click", ()=>{
							$("#popup").fadeOut(200);
						});
					});
				</script>
			</div>
		</section>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>