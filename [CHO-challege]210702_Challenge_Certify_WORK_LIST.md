### + ) CHALLENGE_CERTIFY 테이블 생성
	-> 구글 DB 공유 문서에 작성 완료

### + ) certList.jsp 생성

### = ) participate.jsp 인증 리스트 부분
	jsp:include (certList페이지(챌린지 인증 LIST 게시물 보이는 거))
	- jsp페이지 내에서 파라미터값은 no, 해당 챌린지NO값만 보냄

### = ) participate.jsp 인증하기 버튼 부분
	ㅇ 전체적으로 수정
	* button onclick할 때 챌린지NO값을 파라미터로 보냄

### = ) signPopup.jsp
	ㅇ 인증하는 ID 값 출력 되게끔 추가
	ㅇ 챌린지 제목 출력 되게끔 추가 
	ㅇ form 태그(POST요청)에 table요소 및 submit,reset요소 삽입

### + ) windowClose.jsp 추가 
	-> 팝업창에서 챌린지 인증 완료하면 이 페이지로 리로드 되는데,
	     이 파일은 그냥 페이지가 닫히는 스크립트만 적혀있음
	-> 그래서 이 링크로 리로드 되면 팝업창이 닫힘!

### = ) ChallengeController -> 
	+) certList - 메소드추가 및 @GetMapping 추가
	= ) signPopup ->@GetMapping 메소드 수정 (챌린지NO파라미터를 통해 
	challenge객체를 보내고, loginMember를 통해 id값을 보냄
	+ ) signPopup POST 메소드 추가(service.saveCertify 메소드 추가)

### = ) ChallengeService/impl
	+ ) saveCertify() 메소드추가

### = ) ChallengeMapper
	+ ) insertCertify() 메소드 추가
	
### + ) vo/ChallengeCertify.java : 챌린지 인증 테이블 VO 객체 생성

### = ) challenge-mapper.xml 
	+ ) CHALLENGE_CERTIFY의 resultMap 추가
	+ ) insert태그(id="insertCertify" 추가)
