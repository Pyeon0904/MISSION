<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	$(function(){
		$("ul.navi a.navA").click(function(){
			$("ul.navi a").removeClass("current");
			$(this).addClass("current");
		});
	});
</script>
<link rel="stylesheet" href="${ path }/resources/css/admin2.css">
<nav>
    <div class="blank"></div>
    <div class="navicon">
        <ul class="navi">
            <li class="item home">
                <a class="navA homeA" href="${ path }/admin">홈</a>
            </li>
            <li class="item">
                <a class="navA memberA" href="${ path }/admin/member">회원 관리</a>
            </li>
            <li class="item">
                <a class="navA challengeA" href="${ path }/admin/challenge">챌린지 관리</a>
            </li>
            <li class="item">
             	<a class="navA boardA" href="${ path }/admin/baord">고객센터 관리</a>
            </li>
            <li class="item">
                <a class="navA reviewA" href="${ path }/admin/review/viewReview">후기게시판 관리</a>
            </li>
            <li class="item">
                <a class="navA reportA" href="${ path }/admin/report/reportReview">신고 관리</a>
            </li>
        </ul>
    </div>
    <div></div>
</nav>