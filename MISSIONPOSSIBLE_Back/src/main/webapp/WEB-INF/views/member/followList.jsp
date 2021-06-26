<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	//List<Post> list = (ArrayList) request.getAttribute("list");
	//PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");

%>

<style>
	section{
		text-align:center;
	}
	#box{ 
        background-color:rgb(224, 239, 132);
        width:100%;
        height:1000px; 
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
</style>
<div id="box">
      <section id="section">
         <div id="conbox">
		<br><br><br><br><br><br>
		<h4>팔로우 리스트</h4>
		<div class="col-lg-6" style="width: 200px; margin-left: 1300px;">
		    <div class="input-group">
		      <input type="text" class="form-control" placeholder="Search">
		      <span class="input-group-btn">
		        <button class="btn btn-default" type="button">Go!</button>
		      </span>
		    </div>
		 </div><br>
		<hr>
		<form name ="followList" action="followList" method="get">
			<table id="tbl-board" class ="table table-striped" style="width: 500px; margin-left: 550px">
				<tr>
					<th>닉네임</th>
					<th style="width: 100px;">친구 끊기</th>
				</tr>
				<tr>
					<td><a href="${path}/member/followPage">친구 닉네임</a></td>
					<td><button onclick="#">친구 끊기</button></td>
				</tr>
				<!--
				<c:choose>  
					<c:when test="${list eq null || list.isEmpty()}">
						<tr>
							<td colspan="5">조회된 게시글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="post" items="${list}">
				
						<tr>
							<td><a href="${path}/member/followList">친구 닉네임</a></td>
							<!-- 친구 리스트 받기 -->
							<!--  
							<c:choose>
								<c:when test="${post.board_Num eq 1}">
									<td><a href="${root}/board/newsview?boardNo=${post.post_Num}">${ post.post_Title }</a></td>
								</c:when>
							</c:choose>
							
							<td><button onclick="#">친구 끊기</button></td>
						</tr>
						<!--  
						</c:forEach>
					</c:otherwise>
				</c:choose>
				-->
			</table>
		  </form>
		  <nav>
		  <!-- 페이지바 -->
			<ul class="pagination" id="pageBar">
				<li><a href="${root}/mypage/mypost/list?page=1">&laquo;</a></li>
				<li><a href="${root}/mypage/mypost/list?page=${pageInfo.getPrvePage()}">&lt;</a></li>
				<c:forEach var="p" begin="${pageInfo.getStartPage()}" end="${pageInfo.getEndPage()}">
					<c:choose>
						<c:when test="${p eq pageInfo.getCurrentPage()}">
							<li class="active"><a href="">${p}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="${root}/mypage/mypost/list?page=${p}">${p}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<li><a href="${root}/mypage/mypost/list?page=${pageInfo.getNextPage()}">&gt;</a></li>
				<li><a href="${root}/mypage/mypost/list?page=${pageInfo.getMaxPage()}">&raquo;</a></li>
			</ul>
		</nav>
	  </div>
	</section>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>