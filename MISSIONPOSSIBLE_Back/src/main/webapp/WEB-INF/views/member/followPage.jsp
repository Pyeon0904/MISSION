<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	section{
		text-align:center;
	}
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
	.box {
     	width: 200px;
     	height: 200px;
	    border-radius: 70%;
	    overflow: hidden;
	    margin:auto;
	}
	.profile {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
</style>
<script type="text/javascript">
	$(document).ready(()=>{
		$("#btnBan").on("click", (e)=>{
			
			const url = "${path}/member/reportMember";
			const status="left=500px, top=200px, width=450px; height=300px";
			
			open(url, "", status);
		});	
	});
</script>
<div id="box">
      <section id="section">
         <div id="conbox">
			<br><br><br><br><br><br>
			<h4>팔로우 페이지</h4>
			<br><br>
			<hr>
			<br><br>
			<form name="followPage" action="followPage" method="post" >
				<div style="margin-left: 730px">
					<c:if test="${ isfollow > 0}">
						<input type="submit" value="팔로우" id="btnFollow" class="btn btn-default"  disabled />
					</c:if>
					<c:if test="${ isfollow == 0}">
						<input type="submit" value="팔로우" id="btnFollow" class="btn btn-default" />
					</c:if>
					<input type="button" value="신고하기" id="btnBan" class="btn btn-default"/>
				</div>
				<div id="myPage-container">
					<table class="table table-bordered table-hover" style="width:900px; height:200px; margin:auto;">
						<tr>
							<td rowspan="2" style="width:400px; height:200px;">
								<c:if test="${ followMember.renamedFileName == null }">
									<div class="box" style="background: #BDBDBD;">
										<img src="${path}/resources/images/계정프로필기본.png" name="profile" id="profile" alt="My Image" style="width:200px; height:200px;"/>
									</div>
								</c:if>
								<c:if test="${ followMember.renamedFileName != null }">
									<div class="box" style="background: #BDBDBD;">
										<img src="${path}/resources/upload/profile/${ followMember.renamedFileName }" name="profile" id="profile" alt="My Image" style="width:200px; height:200px;"/>
									</div>
								</c:if>
							</td>
							<td class="title">
								<h4><b>닉네임</b></h4>
							</td>
							<td class="title">
								<h4><b>회원등급</b></h4>
							</td >
							<td class="title">
								<h4><b>포인트</b></h4>
							</td>
						</tr>
						<tr class="content">
							<td>
								<h4>${ followMember.nickname }</h4>
							</td>
							<td>
								<h4>${ followMember.gradeName }</h4>
							</td>
							<td>
								<h4>${ followMember.point }</h4>
							</td>
						</tr>
					</table>
					<br><br><br><br>
					<c:if test="${ isfollow > 0}">
						<!-- 참여중인 챌린지 리스트 include -->
						<div id="joinList-container">
							<h3>참여중인 챌린지</h3>
							<iframe id="joinList-content" name="joinList-content"
								src="${ path }/member/objectJoinList" 
								width="960px" height="400px" scrolling="no" frameborder="1">
							</iframe>
						</div>
					</c:if>
					<c:if test="${ isfollow == 0}">
						<br><br>
						<h3>참여중인 챌린지를 보려면 계정을 팔로우 하세요.</h3>
					</c:if>
				</div>
			</form>
		</div>
	</section>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>