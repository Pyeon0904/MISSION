<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%> 

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 답글</title>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>

<script src="${path}/resources/summernote/summernote-lite.js"></script>
<script src="${path}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${path}/resources/summernote/summernote-lite.css">

<style>
#box{background-color:none;width:100%;height:auto; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
     margin-top:50px;margin-bottom:100px;margin-left:-10px;padding:10px;}

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

.button_base:hover {cursor: pointer;}
.b01_simple_rollover {color: #000000; border: #97FD97 solid 1px; padding:6px 20px 6px 20px; background-color: #97FD97;}
.b01_simple_rollover:hover {color: #000000;background-color: #ffffff;}
.pageTitle{margin-left: -34px;}
</style>

<script type="text/javascript">
	$(function() {
		$('#btnWrite').click(function() {
			if (!$('#board_subject').val()) {
				alert('글제목을 입력하세요');
				$('#board_subject').focus();
				return false;
			}
			
			var text = $('#board_content').val();
			
			if (text.replace(/\s|　/gi, "").length == 0) {
			    alert("내용을 입력해주세요.");
			    $("#board_content").focus();
			    return false;
			}
			
			$('#boardForm').submit();
		});
	});
</script>
</head>
<body>
<div id="box">
      <section id="section">
         <div id="conbox">
	<div id="wrap">
	<div id="container">
		<div class="inner">		
         	<a><img class="pageTitle" src="${path}/resources/images/pageTitle/게시글작성.png" /></a>
			<form id="boardForm" name="boardForm" action="${ path }/board/boardReply" enctype="multipart/form-data" method="POST">
				<input type="hidden" id="parent_groupno"	name="groupno"	value="${board.groupno}"/> <!-- 부모 게시글 번호 -->
				<input type="hidden" id="parent_groupord"	name="groupord"	value="${board.groupord}"/> <!-- 부모 groupno -->
				<input type="hidden" id="parent_dept"	name="dept"	value="${board.dept}"/>	   <!-- 부모 dept -->
				<table width="100%" class="table02">
				<caption><strong><span class="t_red">*</span> 표시는 필수입력 항목입니다.</strong></caption>
				    <colgroup>
				        <col width="20%">
				        <col width="*">
				    </colgroup>
				    <tbody id="tbody">
						<tr>
							<th>제목<span class="t_red">*</span></th>
							<c:if test="${loginMember.id eq 'admin' }">
								<td><input id="board_subject" name="title" value="답변드립니다:)" class="tbox01"/></td>
							</c:if>
							<c:if test="${loginMember.id ne 'admin' }">
								<td><input id="board_subject" name="title" value="" class="tbox01"/></td>
							</c:if>
						</tr>
						<tr>
							<th>작성자<span class="t_red">*</span></th>
							<td><input id="board_writer" name="writer" value="${ loginMember.id }" class="tbox01" readonly/></td>
						</tr>
						<tr>
							<th>내용<span class="t_red">*</span></th>
							<td><textarea class="summernote" name="content" id="board_content"></textarea></td>
						</tr>
						<tr>
							<th scope="row">비밀번호</th>
							<td><input type="password" class="tbox01" name="pass" value="${ board.pass }" readonly></td>
						</tr>
				    </tbody>
				</table>
				<div class="btn_right mt15">
					<button type="button" class="button_base b01_simple_rollover" onclick="location.href='${path}/board/boardList'">목록으로</button>
					<input type="submit" class="button_base b01_simple_rollover" id="btnWrite" value="등록하기">
				</div>
			</form>
		</div>
	</div>
</div>
</div>
</section>
</div>

<script>
$('.summernote').summernote({
	  height: 410,                 // 에디터 높이
	  minHeight: null,             // 최소 높이
	  maxHeight: 400,             // 최대 높이
	  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	  lang: "ko-KR",					// 한글 설정
	  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
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
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			
			onImageUpload : function(files, editor, welEditable) {
		    		  sendFile(files[i], editor, welEditable);
		    },
});

/* summernote에서 이미지 업로드시 실행할 함수 */
function sendFile(file, el) {
	// 파일 전송을 위한 폼생성
    var form_data = new FormData();
    form_data.append('file', file);
    
    $.ajax({ // ajax를 통해 파일 업로드 처리
    	data: form_data,
        type: "POST",
        url: '/image',
        cache : false,
        enctype: 'multipart/form-data',
        contentType : false,
        processData : false,
        success: function(data) { // 처리가 성공할 경우
        	 // 에디터에 이미지 출력
            editor.insertImage(welEditable, data.url)
          }
    });
}


</script>

</body>
</html>
<%@ include file="../common/footer.jsp"%> 
