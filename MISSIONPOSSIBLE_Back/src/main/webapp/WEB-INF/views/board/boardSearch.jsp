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

<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<style>
#box{background-color:none;width:100%;height:1000px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
     margin-top:auto;margin-bottom:100px;margin-left:-10px;padding:10px;}

#conbox{width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/position:relative; top:20px;margin:auto;}

h2{font-size:20px;color:#666;letter-spacing:0px}

td,th,caption{font-size:13px;color:#666;letter-spacing:0px}

input, button{font-size:12px;overflow:visible}
input[type="radio"]{*width:13px;*height:13px;}
input[type="checkbox"]{*width:13px;*height:13px;vertical-align:middle}
input[type="text"]{font-size:12px;color:#666;padding-left:3px;border:1px solid #ABADB3}
input[type="password"]{font-size:12px;color:#666;padding-left:3px;border:1px solid #cdcdcd}
input[type="file"]{font-size:12px;height:22px;color:#666;background:#fff;border:1px solid #cdcdcd}
select{font-size:12px;color:#666;vertical-align:middle;border:none}
textarea{font-size:12px;color:#666;padding:5px;vertical-align:middle;border:1px solid #cdcdcd}
em, address{font-style:normal}


/* layout */
html, body{padding:0;margin:0;width:100%;height:100%;}

#wrap{position:relative;width:100%;height:100%}
#container .inner{width:1000px; margin:0 auto; padding:10px 0}
 
/* table */
table.table01 {border-collapse:separate;border-spacing:0;text-align:center;line-height:1.5;border-top:1px solid #ccc;border-left:1px solid #ccc;margin:auto;}
table.table01 th {padding: 10px;font-weight: bold;vertical-align: middle;text-align:center;border-right:1px solid #ccc;border-bottom:1px solid #ccc;border-top:1px solid #fff;border-left:1px solid #fff;background:#eee;}
table.table01 td {padding:10px;vertical-align:middle;text-align:center;border-right:1px solid #ccc;border-bottom:1px solid #ccc;}

table.table02 caption{height:45px;line-height:45px;color:#333;padding-left:35px;border-top:1px solid #464646;border-bottom:1px solid #c9c9c9;background:#ececec}
table.table02 caption.center{padding-top:6px;height:39px;line-height:130%;text-align:center;color:#333;padding-left:0;border-top:3px solid #464646;border-bottom:1px solid #c9c9c9;background:#ececec}
table.table02 tbody th{padding:10px;vertical-align:middle;font-family:'malgunbd';color:#333;border-right:1px solid #c9c9c9;border-bottom:1px solid #c9c9c9;background:#ececec}
table.table02 tbody td{padding:10px;vertical-align:middle;padding-left:15px;background:#fafafa;border-bottom:1px solid #c9c9c9}

/* link_style 
a:link, a:visited, a:hover, a:active{color:#666;text-decoration:underline}
a:hover{color:#0076c8} */

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

div#pageBar{margin-top:10px; text-align:center; background-color: none;}

.button_base:hover {cursor: pointer;}
.b01_simple_rollover {color: #000000; border: #97FD97 solid 1px; padding:6px 20px 6px 20px; background-color: #97FD97;}
.b01_simple_rollover:hover {color: #000000;background-color: #ffffff;}

.notice{background-color: #F7F8E0;}

td#title{text-align:left; padding-left:30px;}

a.titlea{text-decoration:none; color:#666;}
</style>
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
         <form id="searchForm" name="form1" method="GET" action="${path}/board/boardSearch">
            <div align="right" class="row m-4">

			   <p>조회기간을 선택해주세요 
                  <input type="text" id="datepicker1" name="startdate" style="padding-top: 5px; padding-bottom: 6px;"><img src="${path}/resources/images/calendar-icon.png" id="startDt" style="margin-left:-24px; margin-bottom:-7px;">~
                  <input type="text" id="datepicker2" name="enddate" style="padding-top: 5px; padding-bottom: 6px;"><img src="${path}/resources/images/calendar-icon.png" id="endDt" style="margin-left:-24px; margin-bottom:-7px;">
               </p>
				
               <select name="type" class="form-control" id="type" required>
                  <option value="" selected disabled hidden>::검색 유형::</option>
                  <option value="1">글제목</option>
                  <option value="2">작성자</option>
                  <option value="3">글내용</option>
                  <option value="4">전체</option>
               </select> 
               
               <input type="text" name="keyword" class="form-control" id="keyword" placeholder="검색어를 입력하세요" style="padding: 3px 20px 6px 20px" value=${ keyword } />
               <button type="submit" class="btn btn-warning" id="search">검색</button>

            </div>
         </form>
         <!-- 검색 폼 끝---------------------- -->
         <br><br>
         <form id="boardForm" name="boardForm">
            <input type="hidden" id="function_name" name="function_name" value="getBoardList" />
            <input type="hidden" id="current_page_no" name="current_page_no" value="1" />
            
         
            <table width="100%" class="table01">
               <colgroup>
                  <col width="10%" />
                  <col width="30%" />
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
                               <c:if test="${ board.sort == 1 }">
                               		<td class="notice"><c:out value="공지"/></td>
                               </c:if>
                               <c:if test="${ board.sort == 0 }">
                               		<td><c:out value="${ board.qna_no }"/></td> <!-- 브라우저 자체에 값을 찍어줄 땐 c:out 사용 -->
                               </c:if>
               
                            
                               <c:if test="${ board.pass != null }"> <!-- 비밀글이면 -->
                                 <%-- 비밀글 && admin 계정이면 --%>
                                 <c:if test="${loginMember.status eq 'A' }">
                                        <%-- 답글이면 --%>
                                        <c:if test="${ board.groupord > 0 }">
                                              <td id="title"><a href="${ path }/board/boardDetail?qna_no=${ board.qna_no }" class="titlea"><img src="${path}/resources/images/reicon.png" name="re" id="profile" alt="My Image" style="margin:0 4px 0 0; padding-left:${board.dept * 20 }px;"/><c:out value="${ board.title }"/><img src="${path}/resources/images/lock.gif" name="lock" alt="비밀글" style="margin:0 5px;"/></a></td>
                                        </c:if>
                                        <%-- 원글이면 --%>
                                        <c:if test="${ board.groupord == 0 }">
                                              <td id="title"><a href="${ path }/board/boardDetail?qna_no=${ board.qna_no }" class="titlea"><c:out value="${ board.title }"/><img src="${path}/resources/images/lock.gif" name="lock" alt="비밀글" style="margin:0 5px;"/></a></td>
                                        </c:if>
                                </c:if>
                                 <%-- 비밀글 && admin 계정이 아니면 --%>
                                <c:if test="${loginMember.status ne 'A' }">
                                        <%-- 답글이면 --%>
                                        <c:if test="${ board.groupord > 0 }">
                                              <td id="title"><a href="${ path }/board/password?qna_no=${ board.qna_no }" class="titlea"><img src="${path}/resources/images/reicon.png" name="re" id="profile" alt="My Image" style="margin:0 4px 0 0; padding-left:${board.dept * 20 }px;"/><c:out value="${ board.title }"/><img src="${path}/resources/images/lock.gif" name="lock" alt="비밀글" style="margin:0 5px;"/></a></td>
                                        </c:if>
                                        <%-- 원글이면 --%>
                                        <c:if test="${ board.groupord == 0 }">
                                              <td id="title"><a href="${ path }/board/password?qna_no=${ board.qna_no }" class="titlea"><c:out value="${ board.title }"/><img src="${path}/resources/images/lock.gif" name="lock" alt="비밀글" style="margin:0 5px;"/></a></td>
                                        </c:if>
                                </c:if>
                              </c:if>
                                 
                                <c:if test="${ board.pass == null }"> <!-- 비밀글이 아니면 -->
                                        <%-- 답글이면 --%>
                                        <c:if test="${ board.groupord > 0 }">
                                              <td id="title"><a href="${ path }/board/boardDetail?qna_no=${ board.qna_no }" class="titlea"><img src="${path}/resources/images/reicon.png" name="re" id="profile" alt="My Image" style="margin:0 4px 0 0; padding-left:${board.dept * 20 }px;"/><c:out value="${ board.title }"/></a></td>
                                        </c:if>
                                        <%-- 원글 && 질문글이면 --%>
                                        <c:if test="${ board.groupord == 0 && board.sort == 0}">
                                           <td id="title"><a href="${ path }/board/boardDetail?qna_no=${ board.qna_no }" class="titlea"><c:out value="${ board.title }"/></a></td>
                                        </c:if>
                                        <%-- 원글 && 공지글이면 --%>
                                        <c:if test="${ board.groupord == 0 && board.sort == 1}">
                                           <td id="title" class="notice"><a href="${ path }/board/boardDetail?qna_no=${ board.qna_no }" class="titlea"><b><c:out value="${ board.title }" /></b></a></td>
                                        </c:if>
                                  </c:if>
                             
                               <c:if test="${ board.sort == 1 }">
                               		<td class="notice"><c:out value="${ board.writer }"/></td>
                               		<td class="notice"><fmt:formatDate type="both" value="${ board.createDate }"/></td>
                               		<td class="notice"><c:out value="${ board.readCount }"/></td>
                               </c:if>
                               <c:if test="${ board.sort == 0 }">
                               		<td><c:out value="${ board.writer }"/></td>
                               		<td><fmt:formatDate type="both" value="${ board.createDate }"/></td>
                               		<td><c:out value="${ board.readCount }"/></td>
                               </c:if>
                            </tr>
                         </c:forEach>
                     </c:if>
               </tbody>   
            </table>
         </form>         
         <div class="btn_right mt15">
            <c:if test="${ loginMember != null }">
               <button type="button" class="button_base b01_simple_rollover" onclick="location.href='${path}/board/boardWrite'">글쓰기</button>
            </c:if>
         </div>
      </div>
      
      <div style="align: center; margin-top:10px; text-align:center;">
         <!-- 맨 처음으로 -->
         <button onclick="location.href='${ path }/board/boardSearch?page=1&startdate=${ startdate }&enddate=${enddate}&type=${type}&keyword=${keyword}'">&lt;&lt;</button>
         
         <!-- 이전 페이지로 -->
         <button onclick="location.href='${ path }/board/boardSearch?page=${ pageInfo.prvePage }&startdate=${ startdate }&enddate=${enddate}&type=${type}&keyword=${keyword}'">&lt;</button>

         <!--  10개 페이지 목록 -->
         <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" step="1" varStatus="status"> <!-- status는 반복될 때 해당하는 페이지 -->
             <c:if test="${ pageInfo.currentPage == status.current }"> <!-- 현재 페이지와 현재 반복하는 숫자가 같으면 -->
                <button disabled><c:out value="${ status.current }" /></button>
             </c:if>
             <c:if test="${ pageInfo.currentPage != status.current }">
                <button onclick="location.href='${ path }/board/boardSearch?page=${ status.current }&startdate=${ startdate }&enddate=${enddate}&type=${type}&keyword=${keyword}'"><c:out value="${ status.current }" /></button>
             </c:if>
         </c:forEach>
         
         <!-- 다음 페이지로 -->
         <button onclick="location.href='${ path }/board/boardSearch?page=${ pageInfo.nextPage }&startdate=${ startdate }&enddate=${enddate}&type=${type}&keyword=${keyword}'">&gt;</button>
         
         <!-- 맨 끝으로 -->
         <button onclick="location.href='${ path }/board/boardSearch?page=${ pageInfo.maxPage }&startdate=${ startdate }&enddate=${enddate}&type=${type}&keyword=${keyword}'">&gt;&gt;</button>
      </div>
         
   </div>
</div>

</div>
</section>
</div>
<script>
   $(function() {
       //input을 datepicker로 선언
       $("#datepicker1,#datepicker2").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           //,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           //,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-5Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+5y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)  
       });                    
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $("#datepicker1,#datepicker2").datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)   
   });
</script>
</body>
</html>
<%@ include file="../common/footer.jsp"%>