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
     #tbl-board{
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
     .btn {font-family:'malgunbd';display:inline-block;padding:3px 20px 6px 20px;margin:0;border:1px solid #aaa;cursor:pointer;color:#333;border-radius:2px;vertical-align:middle;font-size:13px;letter-spacing:-1px;line-height:normal;background-color:#feffff;text-decoration:none;}
</style>

<div id="box">
      <section id="section">
         <div id="conbox">
			<br><br><br><br><br><br>
			<h4>팔로우 리스트</h4>
			   <form id="followSearch" name="followSearch" method="GET" action="followPage">
		            <div align="right" class="row m-4">
		               <input type="text" name="ID" id="searchID" class="form-control" style="padding: 3px 20px 6px 20px" value="" placeholder="아이디 검색" >
		               <button type="submit" class="btn btn-warning" >검색</button>
		            </div>
		            <table width="100%" class="table01">
						<c:if test="${ list == null }">
							<tr>
		                  		<td colspan="6"></td>
		               		</tr>
						</c:if>
					</table>
		        </form>
				<br>
				<hr>
				<br><br>
			<div id="board-list-container">
					<table id="tbl-board" style="width: 700px">
						<c:if test="${ list == null }">
							<tr>
								<td colspan="6">
									조회된 게시글이 없습니다.
								</td>
							</tr>
						</c:if>
							<c:if test="${ list != null }">
								<c:forEach var="follow" items="${ list }">
									<form name="followList" action="${path}/member/followList" method="post" >
										<tr>
											<td style="width: 200px; height: 200px;">
												<c:if test="${ follow.profile == null }">
													<div class="box" style="background: #BDBDBD;">
														<img src="${path}/resources/images/계정프로필기본.png" name="profile" id="profile" alt="My Image" style="width:200px; height:200px;"/>
													</div>	
												</c:if>
												<c:if test="${ follow.profile != null }">
													<div class="box" style="background: #BDBDBD;">
														<img src="${path}/resources/upload/profile/${ follow.profile }" name="profile" id="profile" alt="My Image" style="width:200px; height:200px;"/>
													</div>
												</c:if>
											</td>
											<td style="text-align: center; font-size: 25px">
									<a href="${path}/member/followPage?ID=${ follow.followId }" >${ follow.followId }</a>
											</td>
											<td><button class="btn btn-warning" id="btDelete">팔로우 취소</button></td>
										</tr>		
											<input style="visibility: hidden;" name ="deleteFollow" id="deleteFollow" value="${ follow.followId }">
									</form>
								</c:forEach>
							</c:if>
					</table>
			</div>
		
		   <!-- 페이지바 -->
			<div id="pageBar">
				<button onclick="location.href='${ path }/member/followList?page=1'">&lt;&lt;</button>
				
				<!-- 이전 페이지로 -->
				<button onclick="location.href='${ path }/member/followList?page=${ pageInfo.prvePage }'">&lt;</button>
	
				<!--  10개 페이지 목록 -->
				<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status">
					<c:if test="${ pageInfo.currentPage == status.current}">
						<button disabled><c:out value="${ status.current }"/></button>
					</c:if>
					<c:if test="${ pageInfo.currentPage != status.current}">
						<button onclick="location.href='${ path }/member/followList?page=${ status.current }'">
							<c:out value="${ status.current }"/>
						</button>
					</c:if>
				</c:forEach>
				
				<!-- 다음 페이지로 -->
				<button onclick="location.href='${ path }/member/followList?page=${ pageInfo.nextPage }'">&gt;</button>
				
				<!-- 맨 끝으로 -->
				<button onclick="location.href='${ path }/member/followList?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
			</div>
	  </div>
	</section>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>