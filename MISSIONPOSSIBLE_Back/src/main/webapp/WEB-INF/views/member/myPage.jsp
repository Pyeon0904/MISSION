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
        background-color:none;
        width:100%;
        height:1500px; 
        margin-top:330px;
        margin-bottom:100px;
        margin-left:-10px;
        padding:10px;
     }
     #conbox{
        width:1600px; 
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
	.title{
		text-align: left;
		font-size: 20px;
	}
</style>
<script type="text/javascript">
	$(document).ready(()=>{
		$("#check").on("click", (e)=>{
			
			const url = "${path}/member/checkIdPw";
			const status="left=500px, top=200px, width=450px; height=300px";
			
			open(url, "", status);
		});	
	});
</script>

<div id="box">
      <section id="section">
         <div id="conbox">
		<br><br><br><br><br><br>
		<h4>마이페이지</h4>
		<br><br>
		<hr>
		<br><br>
		<div id="myPage-container">
			<table class="table table-bordered table-hover"  style="width:900px; height:200px; margin:auto;">
				<tr>
					<td rowspan="4" style="width:400px; height:200px;">
						<c:if test="${ loginMember.renamedFileName == null }">
							<div class="box" style="background: #BDBDBD;">
								<img src="${path}/resources/images/계정프로필기본.png" name="profile" id="profile" alt="My Image" style="width:200px; height:200px;"/>
							</div>	
						</c:if>
						<c:if test="${ loginMember.renamedFileName != null }">
							<div class="box" style="background: #BDBDBD;">
								<img src="${path}/resources/upload/profile/${ loginMember.renamedFileName }" name="profile" id="profile" alt="My Image" style="width:200px; height:200px;"/>
							</div>
						</c:if>
					</td>
					<td>
						<h4 class="title"><b>닉네임</b></h4>
					</td>
					<td>
						<h4>${ loginMember.nickname }</h4>
					</td>
				</tr>
				<tr>
					<td>
						<h4 class="title"><b>이메일</b></h4>
					</td>
					<td>
						<h4>${ loginMember.email }</h4>
					</td>
				</tr>
				<tr>
					<td>
						<h4 class="title"><b>등급</b></h4>
					</td>
					<td>
						<h4>${ loginMember.gradeName }</h4>
					</td>
				</tr>
				<tr>
					<td>
						<h4 class="title"><b>보유 포인트</b></h4>
					</td>
					<td>
						<h4>${ loginMember.point }</h4>
					</td>
				</tr>
			</table>
			<br><br>
			<button class="btn btn-outline-success btn-lg" id="check" style="margin-left: 730px">회원정보수정</button>
			<br><br><br><br>
			<!-- 참여중인 챌린지 리스트 include -->
			<div id="joinList-container">
				<h3>참여중인 챌린지</h3>
				<iframe id="joinList-content" name="joinList-content"
					src="${ path }/member/objectJoinList" 
					width="960px" height="400px" scrolling="no" frameborder="1">
				</iframe>
				<h3>찜한 챌린지</h3>
				<iframe id="zzimList-content" name="zzimList-content"
					src="${ path }/member/objectZzimList" 
					width="960px" height="400px" scrolling="no" frameborder="1">
				</iframe>
			</div>
		 </div>
		</div>
	</section>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>