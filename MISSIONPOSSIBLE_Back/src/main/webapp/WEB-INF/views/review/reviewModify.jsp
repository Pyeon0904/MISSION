<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ path }/resources/css/review.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${path}/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<script src="${path}/resources/summernote/summernote-lite.js"></script>
<script src="${path}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${path}/resources/summernote/summernote-lite.css">
<style>
   #box{ background-color:none; width:100%; height:1000px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
         margin-top:330px; margin-bottom:100px; margin-left:-10px; padding:10px;}
   #conbox{ width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/ position:relative; top:20px; margin:auto;}
</style>

</head>
<body>

<div id="box">
      <section id="section">
         <div id="conbox">
         
<div id="wrap">
   <div id="container">
      <div class="inner">   
         <h2 style="padding-bottom:20px;">게시글 수정</h2>
         <form action="${ path }/review/reviewModify" enctype="multipart/form-data" method="POST">   
         	<input type="hidden" name="no" value="${ review.no }" />
         	<input type="hidden" name="originalFileName" value="${ review.originalFileName }" />
			<input type="hidden" name="renamedFileName" value="${ review.renamedFileName }" />
            <table width="100%" class="table02">
            <caption><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></caption>
                <colgroup>
                     <col width="20%">
                    <col width="*">
                </colgroup>
                <tbody id="tbody">
                   <tr>
                     <th>제목<span class="t_red">*</span></th>
                     <td><input type="text" class="tbox01" name="title" id="title" value="${ review.title }"></td>
                  </tr>
                   <tr>
                     <th>작성자</th>
                     <td><input type="text" name="writerId" value="${ review.writerId }" readonly></td>
                  </tr>
                  <tr>
                     <th>챌린지</th>
                     <td>         
                        <input type="text" name="challengeTitle" value="${ review.challengeTitle }" class="tbox01" id="challangeSearch" placeholder="내가 참여한&마감된 챌린지에만 후기를 작성할 수 있습니다."/>
                  </tr>
                  <tr>
                  <tr>
                     <th>내용<span class="t_red">*</span></th>
                     <td>
                     	<textarea id="summernote" name="content" rows="10" cols="100" style="width:700px; height:412px;"><c:out value="${ review.content }"></c:out></textarea>
                     </td>
                  </tr>
                  <tr>
                     <th>첨부파일</th>
                     <td>
						<input type="file" name="reloadFile"><br>
						<c:if test="${ !empty review.originalFileName }">
							현재 업로드한 파일 : 
							<a>
								<c:out value="${ review.originalFileName }"></c:out>
							</a>
						</c:if>
					</td>
                  </tr>
                </tbody>
            </table>   
            <div class="btn_right mt15">
	            <input type="button" class="btn black mr5" onclick="location.replace('${ path }/review/reviewList')" value="목록으로">
	            <input type="submit" class="btn black" value="수정하기">
	         </div>
         </form>
      </div>
   </div>
</div>

<script type="text/javascript">
$("#challangeSearch").on("click", (e)=>{
   // 챌린지 검색 창 띄우기
   const url = "${path}/review/challengeSearch";
   const status="left=500px, top=200px, width=500px; height=400px";
   
   open(url, "", status);
});   


$(document).ready(function() {
	$('#summernote').summernote({
		  height: 300,                 	// 에디터 높이
		  minHeight: null,             	// 최소 높이
		  maxHeight: 400,             	// 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",				// 한글 설정
		  placeholder: '',				//placeholder 설정
		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	});
});

</script>
</div>
</section>
</div>

</body>
</html>
<%@ include file="../common/footer.jsp"%>