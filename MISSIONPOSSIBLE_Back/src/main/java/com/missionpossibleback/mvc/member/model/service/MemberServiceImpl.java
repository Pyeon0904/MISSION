package com.missionpossibleback.mvc.member.model.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.missionpossibleback.mvc.member.model.mapper.MemberMapper;
import com.missionpossibleback.mvc.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
//비밀번호 인코더
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

//로그인
	@Override
	public Member login(String id, String pwd) {
		Member member = this.findById(id);

		return member != null && passwordEncoder.matches(pwd, member.getPassword()) ? member : null;
	}

//validate(id), validateIdEm(id, email), validateNick(nickname)
	@Override
	public boolean validate(String id) {				
		
		return this.findById(id) != null;
	}

	@Override
	public Member validateIdEm(String id, String userEmail) {
		Member member = this.findById(id);
		
		return member != null && userEmail.equals(member.getEmail()) ? member : null;
	}
	
	@Override
	public boolean validateNick(String userNickname) {
		
		return this.findByNick(userNickname) != null;
	}

	@Override
	public Member findById(String id) {
		
		return mapper.selectMember(id);
	}

//임시 비밀번호 업데이트
	@Override
	public void updateTempPw(String tempPassword, int memberNo) {
		
		mapper.updateTempPw(passwordEncoder.encode(tempPassword), memberNo);
	}
	
//아이디 찾기 메소드
	@Override
	public Member validateNickEm(String userNickname, String userEmail) {
		Member member = this.findByNick(userNickname);
		
		return member != null && userEmail.equals(member.getEmail()) ? member : null;
	}
	
	@Override
	public Member findByNick(String Nickname) {
		
		return mapper.selectMemberbyNick(Nickname);
	}
	
//회원가입 메소드
	@Override
	@Transactional
	public int save(Member member) {
		int result = 0;
		
		//if(member.getMemberNo() != 0) {
		//	result = mapper.updateMember(member);
		//} else {
			member.setPassword(passwordEncoder.encode(member.getPassword()));
			
			result = mapper.insertMember(member);
		//}	
		
		return result;
	}
//프로필 등록
	@Override
	public String saveFile(MultipartFile upfile, String savePath) {
		String renameFileName = null;
		String renamePath = null;
		String originalFileName = upfile.getOriginalFilename();
		
		// savePath가 실제로 존재하지 않으면 폴더를 생성하는 로직
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdirs();
		}
		
		renameFileName = 
				LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + 
				originalFileName.substring(originalFileName.lastIndexOf("."));
		renamePath = savePath + "/" + renameFileName;
		
		try {
			// 업로드한 파일 데이터를 지정한 파일에 저장한다.
			upfile.transferTo(new File(renamePath));
		} catch (IOException e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return renameFileName;
	}

}