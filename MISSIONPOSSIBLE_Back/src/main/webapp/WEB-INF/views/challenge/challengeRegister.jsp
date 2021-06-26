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
	<script src="${ path }/js/jquery-3.6.0.min.js"></script>
	
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
				width:3000px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
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
		<h1>
			챌린지 등록
			<hr>
		</h1>	
			<div id="registerArea">
				<table id="tb">
					<tr><!-- &nbsp; : 스페이스 / &ensp; : 스페이스 / &emsp; : 큰스페이스 -->
						<th>챌린지 제목</th>
						<td>
							<input type="text"  style="width:300px" placeholder="사용하실 챌린지명을 적어주세요." required />
							<input type="button" id="checkDuplicate" value="중복검사" />
						</td>
					</tr>
					<tr>
						<th>챌린지 유형</th>
						<td>
			            	<select name="challengeType">
								<option value="" selected>챌린지 유형 선택</option>
								<option>타인 참여가능(단체)</option>
								<option>타인 참여불가능(개인)</option>
							</select>	
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<select name="category">
								<option value="default" selected>카테고리 선택</option>
							    <option value="">운동</option>
							    <option value="">공부</option>
							    <option value="">취미</option>
							    <option value="">습관만들기</option>
							    <option value="">직접작성(기타)</option>&nbsp;
							</select>
							<input type="text" placeholder="직접 입력시 작성해주세요."/>
						</td>
					</tr>
					<tr>
						<th>모집인원</th>
						<td>
							<select name="">
							   <option value="workout" selected>모집인원 선택</option>
							   <option>5</option>
							   <option>10</option>
							   <option>15</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>등록일</th>
						<td>
							sysdate로 오늘 날짜 가져오기
						</td>
					</tr>
					<tr>
						<th>모집기간</th>
						<td>
							<input type="date"/> ~ <input type="date"/> 까지 모집함 (선택 날짜에 챌린지 자동 진행)
						</td>
					</tr>
					<tr>
						<th>진행기간</th>
						<td>
							<input type="date"/> ~ <input type="date"/> 까지 챌린지 진행
						</td>
					</tr>
					<tr>
						<th>기본 인증 방법</th>
						<td>
							<select name="signRule">
								<option value="" selected>인증방법 선택</option>
								<option>사진 등록 인증</option>
								<option>인증2</option>
								<option>인증3</option>
							</select>	
						</td>
					</tr>
					<tr>
						<th>참여시 차감 포인트</th>
						<td>
							<select name="minusPoint">
								<option value="" selected>참여시 차감될 포인트 양</option>
								<option>100 포인트</option>
								<option>500 포인트</option>
								<option>1000 포인트</option>
								<option>3000 포인트</option>
								<option>5000 포인트</option>
							</select>	
						</td>
					</tr>
					<tr>
						<th>(선택) 오픈 카톡 링크</th>
						<td>
							<input type="text" style="width:300px" placeholder="오픈 카톡방이 있다면 링크를 함께 적어주세요."/>
						</td>
					</tr>
					<tr>
						<th>(선택) 이미지 첨부</th>
						<td>
							<input type="file" multiple="mutiple" id="upfile" name="upfile">
										<input type="button" id="deletefile" name="deletefile" value="삭제">
						</td>
					</tr>
					<tr>
						<th>챌린지에 대한 부가설명</th>
						<td>
							<textarea rows="15" cols="60" style="resize:none" required
							placeholder=" 챌린지에 대한 상세한 설명을 작성해주세요.&#13;&#10;&#13;&#10;  
											&#13;&#10 작성시 아래와 같은 사항을 주의해 주세요!
											&#13;&#10; 1. 작성 에티켓 문화를 실천해주세요.
											&#13;&#10; 2. 남을 비방하는 내용이나 저속한 표현은 예고없이 삭제됩니다.
											&#13;&#10; 3. 광고성, 상업성 내용이 포함되면 예고 없이 삭제됩니다.
											&#13;&#10; 4. 궁금한 사항은 '고객센터'를 이용해 주시기 바랍니다. "></textarea><br>
						</td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="등록"> 
						<input type="reset"  value="취소" />
					</tr>
				</table>
			</div>
	</div>
	</section>
	</div>
</body>
</html>

<%@ include file="../common/footer.jsp"%>