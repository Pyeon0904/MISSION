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

	@Override
	public Member findById(String id) {
		
		return mapper.selectMember(id);
	}

}