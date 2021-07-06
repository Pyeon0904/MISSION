package com.missionpossibleback.mvc.challenge.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.missionpossibleback.mvc.challenge.model.service.ChallengeService;
import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.challenge.model.vo.ChallengeCertify;
import com.missionpossibleback.mvc.challenge.model.vo.MyChallengeList;
import com.missionpossibleback.mvc.common.util.PageInfo;
import com.missionpossibleback.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class challengeController {
	
	@Autowired
	private ChallengeService service; 
	
	//첼린지 등록 GET
	@GetMapping("/challenge/challengeRegister")
	public void challengeRegisterView() {
		log.info("챌린지 등록페이지 요청");
	}
	
	//챌린지 등록 POST
	@PostMapping("/challenge/challengeRegister")
	public ModelAndView challengeRegister(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute Challenge challenge,
			@RequestParam("upfile") MultipartFile upfile,
			@RequestParam("id") String id, 
			@ModelAttribute MyChallengeList myChallengeList) {
		int result = 0;
		
		log.info("챌린지 등록 요청");
		
		// 업로드 X -> ""
		// 업로드 O -> "파일명"
		System.out.println("업로드한 원본파일명 : " + upfile.getOriginalFilename());
		// 업로드 X -> true
		// 업로드 O -> false
		System.out.println(upfile.isEmpty());
		
		if(loginMember.getId().equals(id)) {
			challenge.setId(loginMember.getId());
			
			// 1. 파일업로드 했는지 확인 후 파일 업로드
			if(upfile != null && !upfile.isEmpty()) {
				// 파일저장로직 구현
				String rootPath = request.getSession().getServletContext().getRealPath("resources");
				String savePath = rootPath + "\\upload\\challenge";				
				String renameFileName = service.saveFile(upfile, savePath);
				
				if(renameFileName != null) {
					challenge.setOriginalFilename(upfile.getOriginalFilename());
					challenge.setRenamedFilename(renameFileName);
					challenge.setThumbnailFile(renameFileName);
				}
			}	
			
			
			System.out.println(challenge);
				
			result = service.save(challenge);
				
			if(result > 0) {
				model.addObject("msg", "챌린지가 정상적으로 등록되었습니다.");
				model.addObject("location", "/");
				
				myChallengeList.setId(challenge.getId());
				myChallengeList.setMyChallengeNo(challenge.getChallengeNo());
				myChallengeList.setMyStatus("JOIN");
				
				int value = service.saveMyChallengeList(myChallengeList);
				
				if(value > 0) {
					log.info("내 챌린지 리스트에 추가됨 : " + myChallengeList);
				} else {
					log.info("내 챌린지 리스트에 정상적으로 추가되지 않았습니다.");
				}
				
				
				
			} else {
				model.addObject("msg", "챌린지 등록을 실패하였습니다.");
				model.addObject("location", "/");
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 입력한 모집 마감 날짜가 챌린지 시작일로 값이 넘어가게 하는 메소드 구현(AJAX 통신에 쓰임)
	@GetMapping("/challenge/dateChange.do")
	@ResponseBody
	public String dateChange(@RequestParam(name = "inputDate", required = false) String date) {
		System.out.println("입력한 모집 마감 날짜 : " + date);
		
		return date;
	}
	
	// 카테고리 선택하면 그 text값이 직접입력 칸으로 표현되게끔 하는 메소드 구현(AJAX 통신에 쓰임)
	@GetMapping(value = "/challenge/categoryNameSet.do", produces = "application/text; charset=utf8")
	@ResponseBody
	public String categoryNameSet(@RequestParam(name = "catName", required = false) String catName) {
		System.out.println("선택한 카테고리 이름 : " + catName);
		
		return catName; 
	}
	
	//챌린지 인증 팝업 GET 요청
	@GetMapping("/challenge/signPopup")
	public ModelAndView signPopupView(ModelAndView model,
				@SessionAttribute(name="loginMember", required=false) Member loginMember,
				@RequestParam("no") int challengeNo) {
		log.info("챌린지 인증 팝업페이지 GET 요청");
		
		Challenge challege = service.findByNo(challengeNo);
		
		// id값과 challenge객체를 보냄
		model.addObject("id", loginMember.getId());
		model.addObject("challenge", challege);
		model.setViewName("challenge/signPopup");
		
		return model;
	}
	
	//챌린지 인증 POST 요청
	@PostMapping("/challenge/signPopup")
	public ModelAndView signPopup(ModelAndView model, HttpServletRequest request,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@ModelAttribute ChallengeCertify certify,
			@RequestParam("upfile") MultipartFile upfile,
			@RequestParam("id") String id,
			@RequestParam("challengeNo") int challengeNo) {
		int result = 0;
		
		log.info("챌린지 인증 등록 요청");
		
		// 업로드 X -> ""
		// 업로드 O -> "파일명"
		System.out.println("업로드한 원본파일명 : " + upfile.getOriginalFilename());
		// 업로드 X -> true
		// 업로드 O -> false
		System.out.println("업로드한 파일이 비었나요? "+upfile.isEmpty());
		
		if(loginMember.getId().equals(id)) {
			certify.setId(loginMember.getId());
			certify.setChallengeNo(challengeNo);
			
			// 1. 파일업로드 했는지 확인 후 파일 업로드
			if(upfile != null && !upfile.isEmpty()) {
				// 파일저장로직 구현
				String rootPath = request.getSession().getServletContext().getRealPath("resources");
				String savePath = rootPath + "\\upload\\challenge\\certify";				
				String renameFileName = service.saveFile(upfile, savePath);
				
				if(renameFileName != null) {
					certify.setOriginalFilename(upfile.getOriginalFilename());
					certify.setRenamedFilename(renameFileName);
				}
			}	
			
			System.out.println(certify);
				
			result = service.saveCertify(certify);
				
			if(result > 0) {
				model.addObject("msg", "챌린지 인증이 정상적으로 처리되었습니다. 팝업이 닫힙니다.");
				model.addObject("location", "/challenge/windowClose");
			} else {
				model.addObject("msg", "챌린지 인증을 실패하였습니다. 팝업이 닫힙니다.");
				model.addObject("location", "/challenge/windowClose");
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다. 팝업이 닫힙니다.");
			model.addObject("location", "/challenge/windowClose");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	//팝업창 닫게하는 파일 로드하는 메소드
	@GetMapping("/challenge/windowClose")
	public String winClose() {
		return "challenge/windowClose";
	}
	
	//참여중인 챌린지 VIEW GET
	@GetMapping("/challenge/participate")
	public ModelAndView participate(ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam("no") int challengeNo) {
		
		log.info("참여중인 챌린지뷰 요청");
		
		Challenge challenge = service.findByNo(challengeNo);
		
		if(loginMember != null) {
			
			String id = loginMember.getId();
			
			int successCount = service.getCertCountById(challengeNo, id);
			
			
			model.addObject("loginMember", loginMember);
			model.addObject("challenge", challenge);
			model.addObject("successCount", successCount);
			model.setViewName("challenge/participate");
			
			return model;
		} else {
			model.addObject("msg", "로그인이 필요한 서비스입니다. 로그인 후 다시 시도하여 주십시오.");
			model.addObject("location", "/member/login");
			model.setViewName("common/msg");
			return model;
		}
		
	}
	
	// 참여중인 챌린지 VIEW 페이지에 INCLUDE될 챌린지 인증 페이지!
	// 		챌린지 인증 리스트
	@GetMapping("/challenge/certList")
	public ModelAndView certList(ModelAndView model,
			@RequestParam("no") int no) {
		
		log.info("참여중인 챌린지뷰에서 해당 챌린지 인증 리스트 요청");
		
		int listCount = service.getCertCount(no);
		
		System.out.println("certList의 listCount : " + listCount);
		
		List<ChallengeCertify> list = null;
		PageInfo pageInfo = new PageInfo(1, 10, listCount, listCount);
		
		list = service.getCertList(pageInfo, no);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("challenge/certList");
		
		return model;
	}
	
	//종료된 챌린지 LIST
	@GetMapping("/challenge/endList")
	public ModelAndView endList(ModelAndView model,
			@RequestParam(value="page", required = false, defaultValue = "1") int page) {
		
		int listCount = service.getEndCount();
		
		List<Challenge> list = null;
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 12);
		
		list = service.getEndList(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("challenge/endList");
		
		return model;
	}
	
	//모집중인 챌린지 VIEW
	@GetMapping("/challenge/recruit")
	public ModelAndView recruitView(ModelAndView model, @RequestParam("no") int challengeNo) {
		
		log.info("모집중인 챌린지 View 요청");
		
		Challenge challenge = service.findByNo(challengeNo);
		
		model.addObject("challenge", challenge);
		model.setViewName("challenge/recruit");
		
		return model;
	}
	
	//모집중인 챌린지 LIST
	@GetMapping("/challenge/recruitList")
	public ModelAndView recruitList(ModelAndView model,
			@RequestParam(value="page", required = false, defaultValue = "1") int page) {
		
		int listCount = service.getRecruitCount();
		
		List<Challenge> list = null;
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 12);
		
		list = service.getRecruitList(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("challenge/recruitList");
		
		return model;
	}
	
	//진행중인 챌린지 LIST
	@GetMapping("/challenge/ongoingList")
	public ModelAndView ongoingList(ModelAndView model,
			@RequestParam(value="page", required = false, defaultValue = "1") int page) {
		
		int listCount = service.getOngoingCount();
		
		List<Challenge> list = null;
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 12);
		
		list = service.getOngoingList(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("challenge/ongoingList");
		
		return model;
	}
	
	//진행중인 챌린지 VIEW
	@GetMapping("/challenge/ongoing")
	public ModelAndView ongoingView(ModelAndView model, @RequestParam("no") int challengeNo) {
		
		log.info("진행중인 챌린지 View 요청");
		
		Challenge challenge = service.findByNo(challengeNo);
		
		// 인증 일수의 합
		int sumSuccess = 0;
		// 참여중인 ID list 저장
		List<String> list = service.findCertIdList(challengeNo);
		
		System.out.print("챌린지 참여중인 ID 목록 : ");
		// 참여중인 ID각각의 챌린지 인증 일수를 더한다.
		for(String u_id : list) {
			System.out.print(u_id+", ");
			sumSuccess += service.getCertCountById(challengeNo, u_id);
		}
		System.out.println();
		
		// 더한 값에 ID리스트의 수를 나눈다 = 평균
		double avgSuccess = (double) sumSuccess / list.size();
		log.info("avgSuccess : " + avgSuccess);
		
		model.addObject("challenge", challenge);
		model.addObject("avgSuccess", avgSuccess);
		model.setViewName("challenge/ongoing");
		
		return model;
	}
	
	//진행중인 챌린지 & 참여중인 챌린지 로직
	@GetMapping("/challenge/setViewIO.do")
	public ModelAndView setViewIO(ModelAndView model, @RequestParam("no") int no,
			@SessionAttribute(name="loginMember", required = false) Member loginMember) {
		
		if(loginMember != null) {
			
			int isJoin = service.getJoinListCount(no, loginMember.getId());
			
			log.info("setViewIO.do result값 : " + isJoin);
			
			if(isJoin != 0) {
				//로그인한 상태의 ID가 참여하고 있는 챌린지인 경우 - 참여중인 챌린지 보이기
				model.addObject("msg", "상세 페이지로 이동합니다.");
				model.addObject("location","/challenge/participate?no="+no);
			} else {
				//로그인한 상태의 ID가 참여하고 있지 않은 챌린지인 경우 - 진행중인 챌린지 보이기
				model.addObject("msg", "상세 페이지로 이동합니다.");
				model.addObject("location","/challenge/ongoing?no="+no);
			}
			
		} else {
			//로그인하지 않았을 경우 - 진행중인 챌린지 보이기
			model.addObject("msg", "상세 페이지로 이동합니다.");
			model.addObject("location","/challenge/ongoing?no="+no);
		}
		
		model.setViewName("common/msg");
		return model;
	}	
	
	//찜하기 or 참가신청 버튼 눌렀을 때, 동작하는 메소드
	@GetMapping("/challenge/saveMyChallengeList.do")
	public ModelAndView saveMyChallengeList(ModelAndView model,
			@SessionAttribute(name="loginMember", required = false) Member loginMember,//찜하고 or 참가신청 버튼 누른 Member의 ID값을 받아오기 위함
			@RequestParam(value="myChallengeNo", required=false) int myChallengeNo,//clgNo="챌린지NO"값 받음
			@RequestParam(value="myStatus", required=false) String myStatus,//myStatus="ZZIM" or "JOIN"값 받음
			@ModelAttribute MyChallengeList myChallengeList) {
		int result = 0;
		
		String id = loginMember.getId();// 찜하기 버튼을 누른 Member의 ID값 선언
		
		log.info("\n myStatus : " + myStatus + "\n clgNo : " + myChallengeNo + "\n loginMember.id : "+ id +" 전달받음!");
		
		myChallengeList.setId(id);
		myChallengeList.setMyChallengeNo(myChallengeNo);
		myChallengeList.setMyStatus(myStatus);
		
		System.out.println(myChallengeList);
		
		result = service.saveMyChallengeList(myChallengeList);
		
		if(result > 0) {
			if(myStatus.equals("ZZIM")) {
				model.addObject("msg", "찜 목록에 정상적으로 저장되었습니다.");
			} else if(myStatus.equals("JOIN")) {			
				// 챌린지 참가신청인 경우 챌린지 테이블의 CURRENT_COUNT값이 업데이트됨.
				// 지금 코드가 실행되는 이 시점은 이미 내 챌린지 목록(MY_CHALLENGE_LIST 테이블)에 해당 챌린지가 등록이 돼서 저장이 된 상태임.
				// 현재 참여자 불러오는 메소드
				int participantsCount = service.getCurrentCount(myChallengeNo); 
				
				// 챌린지NO값으로 챌린지 불러오기 
				Challenge challenge = service.findByNo(myChallengeNo);
				
				// 불러온 현재 참여자 수를 불러온 챌린지에 저장
				challenge.setCurrentCount(participantsCount);
				
				// 변경된 챌린지 정보를 업데이트하는 메소드
				int updateCurrCount = service.saveCurrentCount(challenge);
				
				if(updateCurrCount > 0) {
					log.info("현재 인원수 업데이트 완료");
				} else {
					log.info("현재 인원수 업데이트 실패");
				}	
				model.addObject("msg", "챌린지 참가 신청이 정상적으로 완료되었습니다.");
			}
			
		} else {
			if(myStatus.equals("ZZIM")) {
				model.addObject("msg", "이미 찜 목록에 존재하는 챌린지입니다.");
			} else if(myStatus.equals("JOIN")) {
				model.addObject("msg", "이미 참가신청한 챌린지입니다.");
			}
		}
		
		model.addObject("location", "/challenge/recruit?no="+myChallengeNo);
		model.setViewName("common/msg");
		
		return model;
	}
	
	//찜한 챌린지 LIST
	@GetMapping("/challenge/zzimList")
	public ModelAndView zzimListView(ModelAndView model,
			@RequestParam(value="page", required = false, defaultValue = "1") int page,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		
		
		String id = loginMember.getId();
		
		log.info("로그인한 ID : " + id);
		
		int listCount = service.getZzimCount(id);
		
		log.info("찜한 챌린지 수 : " + listCount);
		
		List<Challenge> list = null;
		PageInfo pageInfo = new PageInfo(page, 10, listCount, 12);
		
		list = service.getZzimList(pageInfo, id);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("challenge/zzimList");
		
		return model;
	}
	
	//종료된 챌린지 VIEW
	@GetMapping("/challenge/end")
	public String endView() {
		
		log.info("종료된 챌린지뷰 요청");
		
		//!!주의!! 아래 행 return값 맞음! 틀린게 절대 아님! 확인!! 주의!!
		return "challenge/recruit";
	}
	
	//챌린지 포기 신청 VIEW 
	@GetMapping("/challenge/giveup")
	public String giveup() {
		
		log.info("챌린지 포기 신청뷰 요청");
		
		return "challenge/giveup";
	}
    
	// 챌린지 검색
	@RequestMapping(value="/challenge/search" , method={RequestMethod.GET,RequestMethod.POST})
    public ModelAndView searchList(ModelAndView model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam("key") String key,
			@RequestParam("word") String word
    		) {
		List<Challenge> list = null;
		PageInfo pageInfo = new PageInfo(page, 10, service.getSearchCount(key, word), 12);

		list = service.getSearchList(key, word, pageInfo);
		
		model.addObject("list", list);
		model.addObject("key", key);
		model.addObject("word", word);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("challenge/search");
		
		return model;	
	}
	
	/*
	 * 마이 페이지 - 챌린지 관련 메소드
	 * 
	 * */
	
	// 마이페이지에 삽입될 참여중인 챌린지 목록
	@GetMapping("/member/objectJoinList")
	public ModelAndView myPageJoinList(ModelAndView model,
			@RequestParam(value="page", required = false, defaultValue = "1") int page,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		
		
		String id = loginMember.getId();
		
		log.info("로그인한 ID : " + id);
		
		int listCount = service.getJoinCount(id);
		
		log.info("찜한 챌린지 수 : " + listCount);
		
		List<Challenge> list = null;
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 4);
		
		list = service.getJoinList(pageInfo, id);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("member/objectJoinList");
		
		return model;
	}
	
	// 마이페이지에 삽입될 참여중인 챌린지 목록
		@GetMapping("/member/objectZzimList")
		public ModelAndView myPageZzimList(ModelAndView model,
				@RequestParam(value="page", required = false, defaultValue = "1") int page,
				@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
			
			
			String id = loginMember.getId();
			
			log.info("로그인한 ID : " + id);
			
			int listCount = service.getZzimCount(id);
			
			log.info("찜한 챌린지 수 : " + listCount);
			
			List<Challenge> list = null;
			PageInfo pageInfo = new PageInfo(page, 5, listCount, 4);
			
			list = service.getZzimList(pageInfo, id);
			
			model.addObject("list", list);
			model.addObject("pageInfo", pageInfo);
			model.setViewName("member/objectZzimList");
			
			return model;
		}
	
}
