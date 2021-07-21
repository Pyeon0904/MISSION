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
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<script src="${path}/resources/summernote/summernote-lite.js"></script>
<script src="${path}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${path}/resources/summernote/summernote-lite.css">
<style>
   #box{ background-color:none; width:100%; height:1000px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
         margin-top:auto; margin-bottom:100px; margin-left:-10px; padding:10px;}
   #conbox{ width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/ position:relative; top:20px; margin:auto;}
   .pageTitle{ margin-bottom : 50px; }
</style>
</head>
<body>

<div id="box">
      <section id="section">
         <div id="conbox">
<div id="wrap">
	<div id="container">
		<div class="inner">		
			<a><img class="pageTitle" src="${path}/resources/images/pageTitle/게시글작성.png" /></a>
			<form action="${ path }/review/reviewWrite" enctype="multipart/form-data" method="POST">
				<table width="100%" class="table02">
				<caption><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></caption>
				    <colgroup>
				        <col width="20%">
				        <col width="*">
				    </colgroup>
				    <tbody id="tbody">
						<tr>
							<th>제목<span class="t_red">*</span></th>
							<td><input type="text" name="title" class="tbox01" placeholder="제목을 입력해주세요." style="width:350px" required/></td>
						</tr>
						<tr>
							<th>작성자</th>
							<td><input type="text" name="writerId" class="tbox01" value="${ loginMember.id }" style="width:350px" readonly></td>
						</tr>
						<tr>
							<th>챌린지</th>
							<td>			
								<input type="text" name="challengeTitle" class="tbox01" id="challangeSearch" placeholder="내가 참여한&완료된 챌린지에만 후기를 작성할 수 있습니다." style="width:350px" readonly/>
						</tr>
						<tr>
							<th>내용<span class="t_red">*</span></th>
							<td><textarea id="summernote" name="content" style="width:700" required></textarea></td>
						</tr>
						<tr>
							<th scope="row">첨부파일</th>
							<td><input type="file" name="upfile"></td>
						</tr>
				    </tbody>
				</table>
			<div class="btn_right mt15">
				<input type="submit" class="button_base b01_simple_rollover"  value="등록하기">
				<button type="button" class="button_base b01_simple_rollover"  onclick="location.href='${path}/review/reviewList'">목록으로</button>
			</div>
			</form>
		</div>
	</div>
</div>
</div>
</section>
</div>

<script type="text/javascript">

$("#challangeSearch").on("click", (e)=>{
	// 챌린지 검색 창 띄우기
	const url = "${path}/review/challengeSearch?id=${loginMember.getId()}";
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
	      onImageUpload : function(files, editor, welEditable) {
	    		  sendFile(files[i], editor, welEditable);
	      },
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

function sendFile(file, editor, welEditable) {
    var data = new FormData();
    data.append('file', file);
    $.ajax({
    	data: form_data,
        type: "POST",
        url: '/image',
        cache : false,
        enctype: 'multipart/form-data',
        contentType : false,
        processData : false,
        success: function(data) {
        	editor.insertImage(welEditable, data.url);
          }
    });
}
</script>
</body>
</html>
<%@ include file="../common/footer.jsp"%> 