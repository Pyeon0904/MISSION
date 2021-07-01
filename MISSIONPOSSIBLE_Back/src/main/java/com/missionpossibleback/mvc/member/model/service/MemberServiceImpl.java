package com.missionpossibleback.mvc.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.missionpossibleback.mvc.member.model.mapper.MemberMapper;
import com.missionpossibleback.mvc.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private com.missionpossibleback.mvc.member.model.mapper.MemberMapper mapper;

	@Override
	public Member login(String id, String pwd) {
		Member member = this.findById(id);

		return member != null && pwd.equals(member.getPassword()) ? member : null;
	}

	@Override
	public boolean validate(String id) {				
		
		return this.findById(id) != null;
	}
	
	//비밀번호 재설정 메소드(id 값으로 Member를 받아와서 email이 일치하는지 비교)
	@Override
	public Member validateIdEm(String id, String userEmail) {
		Member member = this.findById(id);
		
		return member != null && userEmail.equals(member.getEmail()) ? member : null;
	}

	@Override
	public Member findById(String id) {
		
		return mapper.selectMember(id);
	}

	@Override
	public void updateTempPw(String tempPassword, int memberNo) {
		
		mapper.updateTempPw(tempPassword, memberNo);
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

}