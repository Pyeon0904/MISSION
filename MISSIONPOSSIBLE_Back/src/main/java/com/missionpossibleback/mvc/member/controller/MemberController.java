package com.missionpossibleback.mvc.member.controller;

import java.util.Date;
import java.util.HashMap;
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
import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.missionpossibleback.mvc.member.model.service.MemberService;
import com.missionpossibleback.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@SessionAttributes("loginMember")
public class MemberController {
	
	@Autowired
	private  MemberService service;

	@GetMapping(value = "/member/login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping(value = "/member/myPage")
	public String myPage() {
		return "member/myPage";
	}
	
	@GetMapping(value = "/member/followPage")
	public String followPage() {
		return "member/followPage";
	}
	
	@GetMapping(value = "/member/followList")
	public String followList() {
		return "member/followList";
	}
	
	@GetMapping(value = "/member/updateMemberInfo")
	public String updateMemberInfo() {
		return "member/updateMemberInfo";
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
	
	@GetMapping(value = "/member/logout")
	public String logout() {
		return "member/logout";
	}
	   
	@GetMapping("/member/enrollCheck")
	   public String enroll2() {
		 log.info("이용약관");
	      
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
	
	@GetMapping("/member/withdrawal")
	   public String withdrawal() {
	      
	      return "member/withdrawal"; 
	}
	
	@GetMapping("/member/report")
	   public String report() {
	      
	      return "member/report"; 
	}
//회원가입
	@GetMapping("/member/enroll")
	   public String enroll() {
	      
	      return "member/enroll";
	}
	
	@RequestMapping(value = "/member/enroll", method = {RequestMethod.POST})
	public ModelAndView enroll(ModelAndView model, @ModelAttribute Member member, HttpServletRequest request, @RequestParam("upfile") MultipartFile upfile) {
		
		if(upfile != null && !upfile.isEmpty()) {
			String rootPath = request.getSession().getServletContext().getRealPath("resources");
			String savePath = rootPath + "/upload/profile";				
			String renameFileName = service.saveFile(upfile, savePath);
						
			if(renameFileName != null) {
				member.setOriginalFileName(upfile.getOriginalFilename());
				member.setRenamedFileName(renameFileName);
			}
		}	
		
		//System.out.println(member); 업로드 콘솔에서 확인

		int result = service.save(member);		
		
		if(result > 0) {
			model.addObject("msg", "회원가입이 정상적으로 완료되었습니다.");
			model.addObject("location", "/");
		} else { 
			model.addObject("msg", "회원가입을 실패하였습니다.");
			model.addObject("location", "/member/enroll");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
//회원가입시 아이디 중복체크
	@GetMapping("/member/idCheck")
	public ResponseEntity<Map<String, Object>> idCheck(@RequestParam("id") String userId) {
		log.info("User ID : {}", userId);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("validate", service.validate(userId));
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
//회원가입시 닉네임 중복체크
	@GetMapping("/member/nicknameCheck")
	public ResponseEntity<Map<String, Object>> nicknameCheck(@RequestParam("nickname") String userNickname) {
		log.info("User Nickname : {}", userNickname);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("validate", service.validateNick(userNickname));
		
		return new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
	}
	
//로그아웃
	@RequestMapping(value = "/member/logout", method = {RequestMethod.POST})
	public String logout(SessionStatus status) {
		
		status.setComplete();
		
		return "redirect:/";
	}
//프로필
	@GetMapping("/member/profile")
	   public String profile() {
	      
	      return "member/profile"; 
	}
	@RequestMapping(value = "/member/profile", method = {RequestMethod.POST})
	public ModelAndView profile(ModelAndView model) {
		
		model.addObject("msg", "등록 성공!");
		model.addObject("location", "/member/profile");
		model.setViewName("common/msg");
		return model;
	}
	
//신고
	@RequestMapping(value = "/member/report", method = {RequestMethod.POST})
	public ModelAndView report(ModelAndView model) {
		
		model.addObject("msg", "신고되었습니다");
		model.addObject("location", "/member/followPage");
		model.setViewName("common/msg_popup");
		return model;
	}
	
//비밀번호 재설정 - 메일 전송
	@GetMapping(value = "/member/sendMail")
	public String sendMail() {
		
		return "member/sendMail";
	}
	
	@RequestMapping(value = "/member/sendMail", method = {RequestMethod.POST})
	public ModelAndView sendMail(ModelAndView model,
			@RequestParam("userId")String userId, @RequestParam("userEmail")String userEmail) {
		
		log.info("{}, {}", userId, userEmail);
		
		Member loginMember =  service.validateIdEm(userId,userEmail);
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.addObject("msg", "인증이 완료되었습니다.");
			model.addObject("location", "/member/sendMail");
			service.updateTempPw(Mail(loginMember), loginMember.getMemberNo());
		} else {
			model.addObject("msg", "인증 실패했습니다. 아이디와 이메일를 다시 확인해주세요.");
			model.addObject("location", "/member/findPassword");
		}
		model.setViewName("common/msg");
		return model;
	}
	
//본인인증(ID, PW)
	@RequestMapping(value = "/member/checkIdPw", method = {RequestMethod.POST})
	public ModelAndView checkIdPw(ModelAndView model,
			@RequestParam("userId")String userId, @RequestParam("userPwd")String userPwd) {
		
		Member loginMember =  service.login(userId, userPwd);
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.addObject("msg", "인증 성공!");
			model.addObject("location", "/member/updateMemberInfo");
		} else {
			model.addObject("msg", "인증 실패");
			model.addObject("location", "/member/myPage");
		}
		model.setViewName("common/msg_popup");
		return model;
	}
//본인인증(NICKNAME, EMAIL)
	@RequestMapping(value = "/member/checkNickEm", method = {RequestMethod.POST})
	public ModelAndView checkNickEm(ModelAndView model,
			@RequestParam("userNickname")String userNickname, @RequestParam("userEmail")String userEmail) {
		
		Member loginMember = service.validateNickEm(userNickname, userEmail);
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.addObject("msg", "인증 성공했습니다.");
			model.addObject("location", "/member/findId");
		}else {
			model.addObject("msg", "인증 실패했습니다. 아이디와 이메일를 다시 확인해주세요.");
			model.addObject("location", "/member/checkNickEm");
		}
		model.setViewName("common/msg");
		
		return model;
	}
//로그인
	@RequestMapping(value = "/member/login", method = {RequestMethod.POST})
	public ModelAndView login(ModelAndView model,
			@RequestParam("userId")String userId, @RequestParam("userPwd")String userPwd) {
		
		log.info("{}, {}", userId, userPwd);
		
		Member loginMember =  service.login(userId, userPwd);
		
//		if(saveId != null) {
//			Cookie cookie = new Cookie("saveId", userId);
//			
//			cookie.setMaxAge(259200);
//			model.addObject(cookie);
//		}else {
//			Cookie cookie = new Cookie("saveId","");
//			
//			cookie.setMaxAge(0);
//			model.addObject(cookie);
//		}
		
		if(loginMember != null) {
			model.addObject("loginMember", loginMember);
			model.addObject("msg", "로그인 성공!");
			model.setViewName("redirect:/");
		} else {
			model.addObject("msg", "아이디나 패스워드가 일치하지 않습니다.");
			model.addObject("location", "/");
		}
		model.setViewName("common/msg");
		return model;
	}
	
//비밀번호 재설정 이메일 보내는 메소드
	public static String Mail(Member loginMember) {
	    // 메일 인코딩
	    final String bodyEncoding = "UTF-8"; //콘텐츠 인코딩
	    
	    String subject = "작전 - 비밀번호 재설정 메일"; 	//메일 제목
	    String fromEmail = "MISSOINPOSSIBLE";		//보낸사람 이메일
	    String fromUsername = "작전";					//보낸사람 이름
	    String toEmail = loginMember.getEmail(); // 보낼 이메일 / 콤마(,)로 여러개 나열		
	    
	    String tempPassword = RandomStringUtils.randomAlphanumeric(10);	//새로운 비밀번호 난수 발생 라이브러리(RandomStringUtils) 사용
	    
	    final String username = "hge4587@gmail.com";         
	    final String password = "pyxryjjbfmcqpthn";	//발급받은 구글앱 비밀번호
	    
	    // 메일에 출력할 텍스트
	    StringBuffer sb = new StringBuffer();
	    sb.append("<h3>안녕하세요 <b>작전<b>입니다.</h3><br><br>"
	    		+ "<h3>비밀번호를 잊어버리셨나요?</h3>"
	    		+ "<h3>임시로 비밀번호를 재발급해드렸습니다</h3>"
	    		+ "<h3>로그인 후 반드시 비밀번호를 재설정 해주세요</h3><br><br>");    
	    sb.append("<h3> 임시 비밀번호 : " + tempPassword + "</h3>");	//재설정되는 비밀번호(랜덤한 값)
	    String html = sb.toString();
	    
	    // 메일 옵션 설정
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
	      // 메일 서버  인증 계정 설정
	      Authenticator auth = new Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	          return new PasswordAuthentication(username, password);
	        }
	      };
	      
	      // 메일 세션 생성
	      Session session = Session.getInstance(props, auth);
	      
	      // 메일 송/수신 옵션 설정
	      Message message = new MimeMessage(session);
	      message.setFrom(new InternetAddress(fromEmail, fromUsername));
	      message.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));
	      message.setSubject(subject);
	      message.setSentDate(new Date());
	      
	      // 메일 콘텐츠 설정
	      Multipart mParts = new MimeMultipart();
	      MimeBodyPart mTextPart = new MimeBodyPart();
	 
	      // 메일 콘텐츠 - 내용
	      mTextPart.setText(html, bodyEncoding, "html");
	      mParts.addBodyPart(mTextPart);
	            
	      // 메일 콘텐츠 설정
	      message.setContent(mParts);
	      
	      // MIME 타입 설정
	      MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
	      MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
	      MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
	      MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
	      MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
	      MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
	      CommandMap.setDefaultCommandMap(MailcapCmdMap);
	 
	      // 메일 발송
	      Transport.send( message );
	      
	    } catch ( Exception e ) {
	      e.printStackTrace();
	    }
	    
	    return tempPassword;
	  }
}
