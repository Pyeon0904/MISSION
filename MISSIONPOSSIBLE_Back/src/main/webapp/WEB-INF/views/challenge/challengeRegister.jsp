<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<%@ include file="../common/header.jsp"%> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>챌린지 등록</title>
	<script src="${ path }/resources/js/jquery-3.6.0.min.js"></script>
	
	<style>
	/* 전체 영역--------------------------------------------------------------------------*/
				
			/*---------------제일 바깥 영역 설정-----------------*/
			#box{ 
			   background-color:rgb(224, 239, 132);
			   width:100%;
			   height:1000px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
			   margin-top:330px;
			   margin-bottom:100px;
			   margin-left:-10px;
			   padding:10px;
			}
			/*-------------------컨텐츠 영역---------------------*/
			#conbox{
				width:800px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
				position:relative; 
				top:20px;
				margin:auto;
			}
			
			    
		/*-----------------------------------------------------------------------------------*/
			
	
	#registerArea{
		clear: both;
		border: 1px solid rgb(224, 239, 132);	
	}
	
	#tb{
	clear: both;
	align:center;
	}
	
	</style>
</head>
	
<body>
	<div id="box">
	<section id="section">
	<div id="conbox">
		<h1>챌린지 등록</h1>
		<hr>	
			<div id="registerArea">
				<!-- 
						열린 form 태그 추가  
						열린 form 태그 추가
						열린 form 태그 추가
						열린 form 태그 추가
						열린 form 태그 추가
				-->
				<form action="${path}/challenge/challengeRegister" method="POST" enctype="multipart/form-data">
				<table id="tb">
					<tr><!-- &nbsp; : 스페이스 / &ensp; : 스페이스 / &emsp; : 큰스페이스 -->
						<th>챌린지 제목</th>
						<td>
							<input type="text" name="title" style="width:300px" placeholder="사용하실 챌린지명을 적어주세요." required />
							<input type="button" id="checkDuplicate" value="중복검사" />
						</td>
					</tr>
					<tr>
						<th>챌린지 등록자</th>
						<td><input type="text" name="id" value="${loginMember.id}" readonly></td>
					</tr>
					<tr>
						<th>챌린지 유형</th>
						<td>
			            	<select name="attendStatus">
								<option value="" selected>챌린지 유형 선택</option>
								<option value="PUBLIC">타인 참여가능(단체)</option>
								<option value="PRIVATE">타인 참여불가능(개인)</option>
							</select>	
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<select id="category" name="categoryNo">
								<option value="default" selected>카테고리 선택</option>
							    <option value="EXERCISE">운동</option>
							    <option value="STUDY">공부</option>
							    <option value="HOBBY">취미</option>
							    <option value="HABIT">습관만들기</option>
							    <option value="ETC">직접작성(기타)</option>&nbsp;
							</select>
							<input type="text" id="categoryName" name="categoryName" placeholder="직접 입력시 작성해주세요."/>
							<!-- 
								AJAX 이용해서 카테고리 클릭시 option태그의 text()값을 categoryName값에 저장하게끔 구현해보자
							 -->
							<script>
								$(function(){
									$("#category").on("change", () => {
										
										let catName = $("#category option:selected").text();
										
										console.log("AJAX 들어가기 전 : " + catName);
										
										$.ajax({
											type : "GET",
											url : "categoryNameSet.do",
											data : {
												catName : catName
											},
											success : function(result){
												console.log("AJAX 통신 성공 : " + result);
												$("#categoryName").val(result);
											},
											error : function(e){
												console.log(e);
											},
											complete: function() {
												console.log("complete");
											}
										});
									});
								});
							</script>
						</td>
					</tr>
					<tr>
						<th>모집인원</th>
						<td>
							<select name="maxCount">
							   <option value="workout" selected>모집인원 선택</option>
							   <option value="5">5</option>
							   <option value="10">10</option>
							   <option value="15">15</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td>
							<c:set var="today" value="<%= new java.util.Date() %>"/>
							<c:set var="date">
								<fmt:formatDate value="${ today }" pattern="yyyy-MM-dd"/>
							</c:set>
								
							<input type="hidden" name="enrollDate" value="${ date }"/>
							
							<c:out value="${ date }"/>
						</td>
					</tr>
					<tr>
						<th>모집기간</th>
						<td>
							<input type="date" name="recruitStart" value="${ date }"/> ~ <input type="date" name="recruitEnd" id="recruitEnd"/> 까지 모집함 (선택 날짜에 챌린지 자동 진행)
						</td>
					</tr>
					<!-- 
						recruitEnd의 값이 설정되자마자 startDate로 넘어오게끔 구현해보고 싶음
						AJAX이용하면 될 듯? -> 성공 ~ ^오^b
					 -->
					<script>
						$(function (){
							$("#recruitEnd").on("change", () => {
								
								let inputDate = $("#recruitEnd").val();
								
								console.log("AJAX 들어가기 전 : "+inputDate);
								
								
								
								$.ajax({	
									type : "GET",
									url : "dateChange.do",
									data : {
										inputDate : inputDate
									},
									success : function(result){
										console.log("AJAX GET 통신 성공 : " + result);
										
										$("#startDate").val(result);
									},
									error : function(e){
										console.log(e);
									},
									complete: function() {
										console.log("complete");
									}
								});
								
							});
						});
					</script>
					<tr>
						<th>진행기간</th>
						<td>
							<input type="date" name="startDate" id="startDate"/> ~ <input type="date" name="deadline"/> 까지 챌린지 진행
						</td>
					</tr>
					<tr>
						<th>참여시 차감 포인트</th>
						<td>
							<select name="minusPoint">
								<option value="" selected>참여시 차감될 포인트 양</option>
								<option value="100">100 포인트</option>
								<option value="500">500 포인트</option>
								<option value="1000">1000 포인트</option>
								<option value="3000">3000 포인트</option>
								<option value="5000">5000 포인트</option>
							</select>	
						</td>
					</tr>
					<tr>
						<th>(선택) 오픈 카톡 링크</th>
						<td>
							<input type="text" name="opentalkLink" style="width:300px" placeholder="오픈 카톡방이 있다면 링크를 함께 적어주세요."/>
						</td>
					</tr>
					<tr>
						<th>(선택) 챌린지 썸네일 이미지 첨부</th>
						<td>
							<input type="file" id="upfile" name="upfile">
							<input type="button" id="deletefile" name="deletefile" value="삭제">
						</td>
					</tr>
					<tr>
						<th>챌린지에 대한 부가설명</th>
						<td>
							<textarea name="content" rows="15" cols="60" style="resize:none" required
							placeholder=" 챌린지에 대한 상세한 설명을 작성해주세요.&#13;&#10;&#13;&#10;  
											&#13;&#10 작성시 아래와 같은 사항을 주의해 주세요!
											&#13;&#10; 1. 작성 에티켓 문화를 실천해주세요.
											&#13;&#10; 2. 남을 비방하는 내용이나 저속한 표현은 예고없이 삭제됩니다.
											&#13;&#10; 3. 광고성, 상업성 내용이 포함되면 예고 없이 삭제됩니다.
											&#13;&#10; 4. 궁금한 사항은 '고객센터'를 이용해 주시기 바랍니다. "></textarea><br>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="submit" value="등록" /> 
							<input type="reset"  value="취소" />
						</th>
					</tr>
				</table>
				<!-- 
						닫힌 form 태그 추가  
						닫힌 form 태그 추가  
						닫힌 form 태그 추가  
						닫힌 form 태그 추가  
						닫힌 form 태그 추가  
				-->
				</form>
			</div>
	</div>
	</section>
	</div>
</body>
</html>

<%@ include file="../common/footer.jsp"%>