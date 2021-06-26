<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%> 

<c:set var="path" value="${ pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>

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
            width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
            position:relative; 
            top:20px;
            margin:auto;
         }
             
      /*-----------------------------------------------------------------------------------*/

input, button{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;overflow:visible}
input[type="radio"]{*width:13px;*height:13px;font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;vertical-align:middle}
input[type="checkbox"]{*width:13px;*height:13px;font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;vertical-align:middle}
input[type="text"]{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;color:#666;padding-left:3px;border:1px solid #ABADB3}
input[type="password"]{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;color:#666;padding-left:3px;border:1px solid #cdcdcd}
input[type="file"]{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;height:22px;color:#666;background:#fff;border:1px solid #cdcdcd}
select{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;color:#666;vertical-align:middle;border:none}
textarea{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;color:#666;padding:5px;vertical-align:middle;border:1px solid #cdcdcd}
em, address{font-style:normal}

/* layout */
html, body{padding:0;margin:0;width:100%;height:100%;}

#wrap{position:relative;width:100%;height:100%}
#container .inner{width:1000px; margin:0 auto; padding:10px 0}

/* table */
table.table01 {border-collapse:separate;border-spacing:0;text-align:center;line-height:1.5;border-top:1px solid #ccc;border-left:1px solid #ccc;margin:auto;}
table.table01 th {padding: 10px;font-weight: bold;vertical-align: middle;text-align:center;border-right:1px solid #ccc;border-bottom:1px solid #ccc;border-top:1px solid #fff;border-left:1px solid #fff;background:#eee;}
table.table01 td {padding:10px;vertical-align:middle;text-align:center;border-right:1px solid #ccc;border-bottom:1px solid #ccc;}

table.table02 caption{height:45px;line-height:45px;color:#333;padding-left:35px;border-top:3px solid #464646;border-bottom:1px solid #c9c9c9;background:#ececec}
table.table02 caption.center{padding-top:6px;height:39px;line-height:130%;text-align:center;color:#333;padding-left:0;border-top:3px solid #464646;border-bottom:1px solid #c9c9c9;background:#ececec}
table.table02 tbody th{padding:10px;vertical-align:middle;font-family:'malgunbd';color:#333;border-right:1px solid #c9c9c9;border-bottom:1px solid #c9c9c9;background:#ececec}
table.table02 tbody td{padding:10px;vertical-align:middle;padding-left:15px;background:#fafafa;border-bottom:1px solid #c9c9c9}

/* link_style */


/* button */
.btn {font-family:'malgunbd';display:inline-block;padding:3px 20px 6px 20px;margin:0;border:1px solid #aaa;cursor:pointer;color:#333;border-radius:2px;vertical-align:middle;font-size:13px;letter-spacing:-1px;line-height:normal;background-color:#feffff;text-decoration:none;}
.btn.black {border-color:#191919;color:#fff;background-color:#333;text-decoration:none;}

/* button_align */
.btn_left{clear:both;text-align:left}
.btn_right{clear:both;text-align:right}
.btn_center{clear:both;text-align:center}

/* select_style */
.selbox{*margin-top:2px;height:28px;*height:18px;padding:3px 4px 4px 3px;border:solid 1px #abadb3;vertical-align:middle}

/* textbox_style */
input.tbox01{width:200px;height:26px;line-height:26px}

/* textarea */
textarea.textarea01{width:410px;height:95px;margin:10px 0}

/* text_color_style */
.t_blue{color:#004fa8}
.t_red{color:#f55500}

/* margin & padding */
.ml5{margin-left:5px}
.ml10{margin-left:10px}
.ml15{margin-left:15px}
.mr5{margin-right:5px}
.mr15{margin-right:15px}
.mr30{margin-right:30px}
.mt15{margin-top:15px}
.mb10{margin-bottom:10px}
.mb25{margin-bottom:25px}

/* page_option */
.page_info{margin-bottom:10px;text-align:right}
.page_info span.total_count{font-size:12px;color:#333}

/* pagination */
.pagination{display:block;margin-top:15px;text-align:center;line-height:normal;color:#666}
.pagination *{display:inline-block;text-decoration:none;vertical-align:top}
.pagination a{text-decoration:none;padding:0 5px;line-height:20px}
.pagination a.onpage{font-family:'malgunbd';color:#0460a5}
.pagination .direction_left01{margin:0 6px 0 3px}
.pagination .direction_right01{margin:0 3px 0 6px}

div#pageBar{margin-top:10px; text-align:center; background-color: white;}
</style>


<script type="text/javascript">
	var check = function() {
		if (!sf.findType.value) {
			alert('검색 유형을 선택하세요');
			sf.findType.focus();
			return false;
		}

		if (!sf.findKeyword.value) {
			alert('검색어를 입력하세요');
			sf.findKeyword.focus();
			return false;
		}
		sf.submit();
	}
</script>
</head>
<body>
<div id="box">
<section id="section">
<div id="conbox">

<div id="wrap">
	<div id="container">
		<div class="inner">		
			<h2>고객센터</h2>			
			
			<!-- 검색 폼 시작--------------------- -->
         <form name="sf" action="find" onsubmit="return check()">
            <div align="right" class="row m-4">

               <select name="findType" class="form-control">
                  <option value="">::검색 유형::</option>
                  <option value="1">글제목</option>
                  <option value="2">작성자</option>
                  <option value="3">글내용</option>
               </select> 
               <input type="text" name="findKeyword" class="form-control"
                  placeholder="검색어를 입력하세요" style="padding: 3px 20px 6px 20px">


               <button type="button" onclick="check()" class="btn btn-warning" >검색</button>

            </div>
            <!--  row end -->
         </form>
         <!-- 검색 폼 끝---------------------- -->
         <br><br>
			<form id="boardForm" name="boardForm">
				<input type="hidden" id="function_name" name="function_name" value="getBoardList" />
				<input type="hidden" id="current_page_no" name="current_page_no" value="1" />
				
			
				<table width="100%" class="table01">
					<colgroup>
						<col width="10%" />
						<col width="25%" />
						<col width="15%" />
						<col width="20%" />
						<col width="10%" />
					</colgroup>
					<thead>		
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					<c:if test="${ list == null }">
						<tr>
                  			<td colspan="6">조회된 게시글이 없습니다.</td>
               			</tr>
					</c:if>	
					</thead>
					<tbody id="tbody">
						<c:if test="${ list != null }">
					      	 <c:forEach var="board" items="${ list }">
					      	 	<tr>
					      	 		<td><c:out value="${ board.no }"/></td>
					      	 		<td><c:out value="${ board.title }"/></td>
					      	 		<td><c:out value="${ board.writerId }"/></td>
					      	 		<td><fmt:formatDate type="both" value="${ board.createDate }"/></td>
					      	 		<td><c:out value="${ board.readCount }"/></td>
					      	 	</tr>
					      	 </c:forEach>
                         </c:if>
					</tbody>	
				</table>
			</form>			
			<div class="btn_right mt15">
				<c:if test="${ loginMember != null }">
					<button type="button" class="btn black mr5" onclick="location.href='${path}/board/boardWrite'">글쓰기</button>
				</c:if>
			</div>
		</div>
		
		<div id="pageBar" style="align:center;">
         <!-- 맨 처음으로 -->
         <button onclick="location.href='${ path }/board/list?page=1'">&lt;&lt;</button>
         
         <!-- 이전 페이지로 -->
         <button onclick="location.href='${ path }/board/list?page=${ pageInfo.prvePage }'">&lt;</button>

         <!--  10개 페이지 목록 -->
         <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status"> <!-- status는 반복될 때 해당하는 페이지 -->
          	<c:if test="${ pageInfo.currentPage == status.current }">
          		<button disabled><c:out value="${ status.current }" /></button>
          	</c:if>
          	<c:if test="${ pageInfo.currentPage != status.current }">
          		<button onclick="location.href='${ path }/board/list?page=${ status.current }'"><c:out value="${ status.current }" /></button>
          	</c:if>
         </c:forEach>
         
         <!-- 다음 페이지로 -->
         <button onclick="location.href='${ path }/board/list?page=${ pageInfo.nextPage }'">&gt;</button>
         
         <!-- 맨 끝으로 -->
         <button onclick="location.href='${ path }/board/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
      </div>
			
	</div>
</div>

</div>
</section>
</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>