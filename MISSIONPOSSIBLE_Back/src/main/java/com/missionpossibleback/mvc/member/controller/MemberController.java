package com.missionpossibleback.mvc.member.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.missionpossibleback.mvc.challenge.model.service.ChallengeService;
import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.challenge.model.vo.Pointlog;
import com.missionpossibleback.mvc.common.util.PageInfo;
import com.missionpossibleback.mvc.member.model.service.MemberService;
import com.missionpossibleback.mvc.member.model.vo.Follow;
import com.missionpossibleback.mvc.member.model.vo.Grade;
import com.missionpossibleback.mvc.member.model.vo.Member;
import com.missionpossibleback.mvc.member.model.vo.memberReport;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes({"loginMember", "followMember", "isfollow", "confirmMember"})
public class MemberController {
	
	@Autowired
	private  MemberService service;
	
	@Autowired
	private ChallengeService cService;
	
	@RequestMapping(value = "/common/header", method = {RequestMethod.POST})
	public String header() {
		return "common/header";
	}
	
	@GetMapping(value = "/member/findPassword")
	public String findPassword() {
		return "member/findPassword";
	}
	
	@GetMapping(value = "/member/findId")
	public String findId() {
		return "member/findId";
	}
	
	@GetMapping(value = "/member/checkNickEm")
	public String checkNickEm() {
		
		return "member/checkNickEm";
	}
	   
	@GetMapping("/member/enrollCheck")
	   public String enroll2() {
		 log.info("????????????");
	      
	      return "member/enrollCheck"; 
	}
	
	@GetMapping("/member/checkIdPw")
	   public String checkIdPw() {
	      
	      return "member/checkIdPw"; 
	}
	
	@GetMapping("/member/checkNickname")
	   public String checkNickname() {
	      
	      return "member/checkNickname";
	}
//??????????????? (?????? ??????)
	@GetMapping(value = "/member/myPage")
	public ModelAndView myPage(ModelAndView model, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		List<Grade> gradeName = service.setGradeName(loginMember.getPoint());
		
		int point = loginMember.getPoint();
		int no = loginMember.getMemberNo();
		
		//gradename ?????????
		service.updateGradename(grade(gradeName, point), no);
		
		//???????????? ???????????? ????????????
		loginMember =  service.findById(loginMember.getId());
		model.addObject("loginMember", loginMember);

		return model;
	}
//????????? ????????? (?????? ??????)
	@GetMapping(value = "/member/followPage")
	public ModelAndView followPage(ModelAndView model, @RequestParam("ID")String followID, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		
		Member followMember = service.findById(followID);
			
		if(followMember != null) {
			List<Grade> gradeName = service.setGradeName(loginMember.getPoint());
			int point = followMember.getPoint();
			int no = followMember.getMemberNo();
			
			//gradename ????????? ??? ????????????
			service.updateGradename(grade(gradeName, point), no);
				
			//????????? ?????? ????????????
			followMember = service.findById(followID);
				
			model.addObject("followMember", followMember);
			model.setViewName("member/followPage");
				
			int isfollow = service.isfollow(loginMember.getId(), followMember.getId());
				
			model.addObject("isfollow", isfollow);	//???????????? ??????????????? isfollow ????????? ?????? ??????(0 or 1)
			model.setViewName("member/followPage");
		}else {
			model.addObject("msg", "ID??? ???????????? ????????????");
			model.addObject("location", "/member/followList");
			model.setViewName("common/msg");
		}
			
		return model;
	}
	@RequestMapping(value = "/member/followPage", method = {RequestMethod.POST})
	public ModelAndView followPage(ModelAndView model, @RequestParam("btnFollow")String btnFollow,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@SessionAttribute(name = "followMember", required = false) Member followMember ) {
			
		int result = 0;
		
		if(btnFollow.equals("?????????")) {
			result = service.follow(loginMember.getId(), followMember.getId());
		}else {
			result = service.deleteFollow(followMember.getId(), loginMember.getId())*-1;
		}

		if(result > 0) {
			model.addObject("msg", "????????? ???????????????");
		}else if(result < 0){
			model.addObject("msg", "????????? ?????????????????????");
		}else {
			model.addObject("msg", "??????????????? ???????????? ???????????????");
		}
		model.addObject("location", "/member/followPage?ID="+followMember.getId());
		model.setViewName("common/msg");
			
		return model;
	}
//?????? ?????? ?????????
	public static String grade(List<Grade> gradeName, int point) {
		String grade = null;
		for(int i=0; i<gradeName.size(); i++) {
			if(point>gradeName.get(i).getMin() && point<=gradeName.get(i).getMax()) {
				grade = gradeName.get(i).getGradeName();
			}
		}
		return grade;
	}
//????????????	
	@GetMapping("/member/reportMember")
	   public String report() {
	      
	      return "member/reportMember"; 
	}
	@RequestMapping(value = "/member/reportMember", method = {RequestMethod.POST})
	public ModelAndView report(ModelAndView model,
			@RequestParam("reportId") String reportId,
			@RequestParam("reportType")String reportType,
			@RequestParam("reportContent")String reportContent,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			SessionStatus status ) {
		
		int result = 0;
		
		result = service.reportMember(loginMember.getId(), reportId, reportType, reportContent);
		
		if(result > 0) {
			model.addObject("msg", "????????? ?????????????????????");
		}else {
			model.addObject("msg", "????????? ??????????????? ???????????? ???????????????");
		}
		model.addObject("location", "/member/followPage?ID="+reportId);
		model.setViewName("common/msg_popup");
		
		return model;
	}
// ????????????????????? ????????? ???????????? ????????? ??????
	@GetMapping("/member/objectJoinList_follow")
	public ModelAndView followJoinList(ModelAndView model,
			@RequestParam(value="page", required = false, defaultValue = "1") int page,
			@SessionAttribute(name = "followMember", required = false) Member followMember,
			@ModelAttribute Challenge challege) {
		
		String id = followMember.getId();
		
		int listCount = cService.getJoinCount(id);
		
		
		List<Challenge> list = null;
		PageInfo pageInfo = new PageInfo(page, 5, listCount, 4);
		
		list = cService.getJoinList(pageInfo, id);
		
		ArrayList<Integer> cNoList = new ArrayList<>();
		
		for(Challenge challenge : list) {
			cNoList.add(challenge.getChallengeNo());
		}
		
		ArrayList<Integer> successCount = new ArrayList<>();
		
		for(Integer i : cNoList) {
			successCount.add(cService.getCertCountById(i, id));
		}
		
		System.out.println("???????????? ???????????? NO??? LIST : " + cNoList);
		System.out.println("???????????? ????????? ?????? ????????? ????????? ?????? : " + successCount);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.addObject("successCount", successCount);
		model.setViewName("member/objectJoinList_follow");
		
		return model;
	}
//????????? ?????????
	@GetMapping(value = "/member/followList")
	public ModelAndView followList(ModelAndView model, @RequestParam(value = "page", required = false, defaultValue = "1") int page, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		
		List<Follow> list = null;
		PageInfo pageInfo = new PageInfo(page, 10, service.getFollowListCount(), 10); 
		
		list = service.getFollowList(pageInfo, loginMember.getId());
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("member/followList");
		
		//????????? ????????????
		List<String> listMemberId = service.getMemberIdList();
		
		System.out.println(listMemberId);
		model.addObject("listMemberId", listMemberId);
		model.setViewName("member/followList");
		
		return model;
	}
	@RequestMapping(value = "/member/followList", method = {RequestMethod.POST})
	public ModelAndView followList(ModelAndView model, @RequestParam("deleteFollow")String deleteFollow, @SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		
		int result = 0;
	
		result = service.deleteFollow(deleteFollow, loginMember.getId());
			
		if(result > 0) {
			model.addObject("msg", "????????? ?????????????????????");
				
		}else {
			model.addObject("msg", "????????? ????????? ?????????????????????");
		}
		model.addObject("location", "/member/followList");
		model.setViewName("common/msg");
		
		return model;
	}
	
//??????	
	@GetMapping("/member/withdrawal")
	   public String withdrawal() {
	      
	      return "member/withdrawal"; 
	}
	
	@RequestMapping(value = "/member/withdrawal", method = {RequestMethod.POST})
	public ModelAndView withdrawal(ModelAndView model,
			@RequestParam("reasonWithdrawal") String reasonWithdrawal,
			@RequestParam("userPW")String userPW,
			@RequestParam("selboxDirect")String selboxDirect,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			SessionStatus status ) {
		
		//????????????
		Member valiMember = service.login(loginMember.getId(), userPW);
		
		if(valiMember != null) {
			//?????? ?????? ????????? ??????
			int result = 0;
			
			//???????????? ?????????, ??????????????? ????????? ??????
			if(reasonWithdrawal.equals("direct")) {
				result = service.withdrawal(loginMember, selboxDirect);
			}else {
				result = service.withdrawal(loginMember, reasonWithdrawal);
			}
			
			if(result > 0) {
				//?????? ??? ????????????
				model.addObject("msg", "?????????????????????.");
				status.setComplete();
				model.addObject("location", "/");
			}else {
				model.addObject("msg", "?????? ??????????????????");
				model.addObject("location", "/member/withdrawal");
			}
		} else {
			model.addObject("msg", "??????????????? ???????????? ????????????.");
			model.addObject("location", "/member/withdrawal");
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
//????????????
	@GetMapping("/member/enroll")
	   public String enroll(@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
	      if(loginMember != null) return "redirect:/";
	      
	      return "member/enroll";
	}
	@RequestMapping(value = "/member/enroll", method = {RequestMethod.POST})
	public ModelAndView enroll(@ModelAttribute Pointlog pointlog,ModelAndView model, @ModelAttribute Member member, HttpServletRequest request, @RequestParam("upfile") MultipartFile upfile) {
		
		if(upfile != null && !upfile.isEmpty()) {
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/profile";				
			String renameFileName = service.saveFile(upfile, savePath);
						
			if(renameFileName != null) {
				member.setOriginalFileName(upfile.getOriginalFilename());
				member.setRenamedFileName(renameFileName);
			}
		}	
		
		//System.out.println(member); ????????? ???????????? ??????

		int result = service.save(member);		
		
		if(result > 0) {
			pointlog.setId(member.getId());
			pointlog.setCno(0);
			pointlog.setValue(10000);
			pointlog.setHistory("PLUS_CREATE");
			
			int saveLog = cService.savePointlog(pointlog);
			
			if(saveLog > 0) {
				log.info("????????? ?????? ?????? ?????? ??????");
			} else {
				log.info("????????? ?????? ?????? ?????? ??????");
			}
		
			model.addObject("msg", "??????????????? ??????????????? ?????????????????????.");
			model.addObject("location", "/");
		} else { 
			model.addObject("msg", "??????????????? ?????????????????????.");
			model.addObject("location", "/member/enroll");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
//??????????????? ????????? ????????????
	@GetMapping("/member/idCheck")
	public ResponseEntity<Map<String, Object>> idCheck(@RequestParam("id") String userId) {
		log.info("User ID : {}", userId);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("validate", service.validate(userId));
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
//??????????????? ????????? ????????????
	@GetMapping("/member/nicknameCheck")
	public ResponseEntity<Map<String, Object>> nicknameCheck(@RequestParam("nickname") String userNickname) {
		log.info("User Nickname : {}", userNickname);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("validate", service.validateNick(userNickname));
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
//????????????
	@GetMapping(value = "/member/logout")
	public String logout() {
		return "member/logout";
	}
	
	@RequestMapping(value = "/member/logout", method = {RequestMethod.POST})
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}
//?????? ?????? ??????
	@GetMapping(value = "/member/updateMemberInfo")
	public String updateMemberInfo() {
		return "member/updateMemberInfo";
	}
	
	@RequestMapping(value = "/member/updateMemberInfo", method = {RequestMethod.POST})
	public ModelAndView update(ModelAndView model, 
			HttpServletRequest request,
			@ModelAttribute Member member,
			@SessionAttribute(name = "loginMember", required = false) Member loginMember,
			@RequestParam("upfile") MultipartFile upfile ) {
		
		int result = 0;
		
		if(loginMember.getId().equals(member.getId())) {
			member.setMemberNo(loginMember.getMemberNo());
			
			if(upfile != null && !upfile.isEmpty()) {
				String rootPath = request.getSession().getServletContext().getRealPath("resources");
				String savePath = rootPath + "/upload/profile";				
				String renameFileName = service.saveFile(upfile, savePath);
							
				if(renameFileName != null) {
					member.setOriginalFileName(upfile.getOriginalFilename());
					member.setRenamedFileName(renameFileName);
				}
				
			}else {
				member.setOriginalFileName(loginMember.getOriginalFileName());
				member.setRenamedFileName(loginMember.getRenamedFileName());
			}
			
			result = service.save(member);		
			
			if(result > 0) {
				model.addObject("loginMember" , service.findById(loginMember.getId()));
				model.addObject("msg", "???????????? ????????? ??????????????????.");
				model.addObject("location", "/member/myPage");
			} else {
				model.addObject("msg", "???????????? ????????? ??????????????????.");
				model.addObject("location", "/member/myPage");
			}			
		} else {
			model.addObject("msg", "????????? ???????????????");
			model.addObject("location", "/");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
//?????????
	@GetMapping("/member/profile")
	   public String profile() {
	      
	      return "member/profile"; 
	}
	@RequestMapping(value = "/member/profile", method = {RequestMethod.POST})
	public ModelAndView profile(ModelAndView model) {
		
		model.addObject("msg", "?????? ??????!");
		model.addObject("location", "/member/profile");
		model.setViewName("common/msg");
		return model;
	}
	
//??????
	@RequestMapping(value = "/member/report", method = {RequestMethod.POST})
	public ModelAndView report(ModelAndView model) {
		
		model.addObject("msg", "?????????????????????");
		model.addObject("location", "/member/followPage");
		model.setViewName("common/msg_popup");
		return model;
	}
	
//???????????? ????????? - ?????? ??????
	@GetMapping(value = "/member/sendMail")
	public String sendMail() {
		
		return "member/sendMail";
	}
	
	@RequestMapping(value = "/member/sendMail", method = {RequestMethod.POST})
	public ModelAndView sendMail(ModelAndView model,
			@RequestParam("userId")String userId, @RequestParam("userEmail")String userEmail) {
		
		log.info("{}, {}", userId, userEmail);
		
		Member confirmMember =  service.validateIdEm(userId,userEmail);
		
		if(confirmMember != null) {
			model.addObject("confirmMember", confirmMember);
			model.addObject("msg", "????????? ?????????????????????.");
			model.addObject("location", "/member/sendMail");
			service.updateTempPw(Mail(confirmMember), confirmMember.getMemberNo());
		} else {
			model.addObject("msg", "?????? ??????????????????. ???????????? ???????????? ?????? ??????????????????.");
			model.addObject("location", "/member/findPassword");
		}
		model.setViewName("common/msg");
		return model;
	}
	
//????????????(ID, PW)
	@RequestMapping(value = "/member/checkIdPw", method = {RequestMethod.POST})
	public ModelAndView checkIdPw(ModelAndView model,
			@RequestParam("userId")String userId, @RequestParam("userPwd")String userPwd) {
		
		Member confirmMember =  service.login(userId, userPwd);
		
		if(confirmMember != null) {
			model.addObject("confirmMember", confirmMember);
			model.addObject("msg", "?????? ??????!");
			model.addObject("location", "/member/updateMemberInfo");
		} else {
			model.addObject("msg", "?????? ??????");
			model.addObject("location", "/member/myPage");
		}
		model.setViewName("common/msg_popup");
		return model;
	}
//????????????(NICKNAME, EMAIL)
	@RequestMapping(value = "/member/checkNickEm", method = {RequestMethod.POST})
	public ModelAndView checkNickEm(ModelAndView model,
			@RequestParam("userNickname")String userNickname, @RequestParam("userEmail")String userEmail) {
		
		Member confirmMember = service.validateNickEm(userNickname, userEmail);
		
		if(confirmMember!= null) {
			model.addObject("confirmMember", confirmMember);
			model.addObject("msg", "?????? ??????????????????.");
			model.addObject("location", "/member/findId");
		}else {
			model.addObject("msg", "?????? ??????????????????. ???????????? ???????????? ?????? ??????????????????.");
			model.addObject("location", "/member/checkNickEm");
		}
		model.setViewName("common/msg");
		
		return model;
	}
//?????????
	@GetMapping(value = "/member/login")
	public String login(@SessionAttribute(name = "loginMember", required = false) Member loginMember) {
		if(loginMember != null) 
			return "redirect:/";
		else
			return "member/login";
	}
	
	@RequestMapping(value = "/member/login", method = {RequestMethod.POST})
	public ModelAndView login(ModelAndView model, HttpServletResponse response, HttpSession session,
			@RequestParam("userId")String userId, @RequestParam("userPwd")String userPwd, @RequestParam(value="saveId", required=false) String saveId) {
		
		log.info("{}, {}", userId, userPwd);
		
		Member loginMember =  service.login(userId, userPwd);
		
		if(saveId != null) {
			Cookie cookie = new Cookie("saveId", userId);
			cookie.setMaxAge(259200);
			response.addCookie(cookie);
		}else {
			Cookie cookie = new Cookie("saveId","");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		if(loginMember != null) {
			
			int joinCount = cService.getJoinCount(loginMember.getId());// ???????????? ????????? ???????????? ????????? ?????? ??????
			int finishCount = cService.getEndJoinCount(loginMember.getId());// ???????????? ????????? ????????? ????????? ?????? ??????
			int createCount = cService.getChallengeCountById(loginMember.getId());// ???????????? ????????? ????????? ????????? ?????? ??????
			int[] achievements = {joinCount, finishCount, createCount};// ????????? ??? ?????? ????????? ????????? ??????
			session.setAttribute("achievements", achievements);
			
			model.addObject("loginMember", loginMember);
			model.setViewName("redirect:/");
		} else {
			model.addObject("msg", "???????????? ??????????????? ???????????? ????????????.");
			model.addObject("location", "/");
			model.setViewName("common/msg");
		}
		return model;
	}
	
//???????????? ????????? ????????? ????????? ?????????
	public static String Mail(Member loginMember) {
	    // ?????? ?????????
	    final String bodyEncoding = "UTF-8"; //????????? ?????????
	    
	    String subject = "?????? - ???????????? ????????? ??????"; 	//?????? ??????
	    String fromEmail = "MISSOINPOSSIBLE";		//???????????? ?????????
	    String fromUsername = "??????";					//???????????? ??????
	    String toEmail = loginMember.getEmail(); // ?????? ????????? / ??????(,)??? ????????? ??????		
	    
	    String tempPassword = RandomStringUtils.randomAlphanumeric(10);	//????????? ???????????? ?????? ?????? ???????????????(RandomStringUtils) ??????
	    
	    final String username = "hge4587@gmail.com";         
	    final String password = "pyxryjjbfmcqpthn";	//???????????? ????????? ????????????
	    
	    // ????????? ????????? ?????????
	    StringBuffer sb = new StringBuffer();
	    sb.append("<h3>??????????????? <b>??????<b>?????????.</h3><br><br>"
	    		+ "<h3>??????????????? ??????????????????????</h3>"
	    		+ "<h3>????????? ??????????????? ???????????????????????????</h3>"
	    		+ "<h3>????????? ??? ????????? ??????????????? ????????? ????????????</h3><br><br>");    
	    sb.append("<h3> ?????? ???????????? : " + tempPassword + "</h3>");	//??????????????? ????????????(????????? ???)
	    sb.append("<h3> ????????? ?????? : ????????? -> ??????????????? -> ???????????? ?????? -> ???????????? ??????</h3>");
	    String html = sb.toString();
	    
	    // ?????? ?????? ??????
	    Properties props = new Properties();    
	    props.put("mail.transport.protocol", "smtp");
	    props.put("mail.smtp.host", "smtp.gmail.com");
	    props.put("mail.smtp.port", "465");
	    props.put("mail.smtp.auth", "true");
	 
	    props.put("mail.smtp.quitwait", "false");
	    props.put("mail.smtp.socketFactory.port", "465");
	    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	    props.put("mail.smtp.socketFactory.fallback", "false");
	    
	    try {
	      // ?????? ??????  ?????? ?????? ??????
	      Authenticator auth = new Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	          return new PasswordAuthentication(username, password);
	        }
	      };
	      
	      // ?????? ?????? ??????
	      Session session = Session.getInstance(props, auth);
	      
	      // ?????? ???/?????? ?????? ??????
	      Message message = new MimeMessage(session);
	      message.setFrom(new InternetAddress(fromEmail, fromUsername));
	      message.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));
	      message.setSubject(subject);
	      message.setSentDate(new Date());
	      
	      // ?????? ????????? ??????
	      Multipart mParts = new MimeMultipart();
	      MimeBodyPart mTextPart = new MimeBodyPart();
	 
	      // ?????? ????????? - ??????
	      mTextPart.setText(html, bodyEncoding, "html");
	      mParts.addBodyPart(mTextPart);
	            
	      // ?????? ????????? ??????
	      message.setContent(mParts);
	      
	      // MIME ?????? ??????
	      MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
	      MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
	      MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
	      MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
	      MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
	      MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
	      CommandMap.setDefaultCommandMap(MailcapCmdMap);
	 
	      // ?????? ??????
	      Transport.send( message );
	      
	    } catch ( Exception e ) {
	      e.printStackTrace();
	    }
	    
	    return tempPassword;
	  }
}
