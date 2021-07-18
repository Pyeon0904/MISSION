package com.missionpossibleback.mvc.member.model.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.missionpossibleback.mvc.common.util.PageInfo;
import com.missionpossibleback.mvc.member.model.mapper.MemberMapper;
import com.missionpossibleback.mvc.member.model.vo.Follow;
import com.missionpossibleback.mvc.member.model.vo.Grade;
import com.missionpossibleback.mvc.member.model.vo.Member;
import com.missionpossibleback.mvc.member.model.vo.memberReport;

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
	
//회원가입 메소드, 회원 수정 메소드
	@Override
	@Transactional
	public int save(Member member) {
		int result = 0;
		
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		
		if(member.getMemberNo() != 0) {

			result = mapper.updateMember(member);
			
		} else {
		
			result = mapper.insertMember(member);
		}	
		
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
//탈퇴
	@Override
	public int withdrawal(Member loginMember, String reasonWithdrawal) {
		int result = 1;
		
		//member status값 변경
		result *= mapper.deleteMember(loginMember.getMemberNo());
		
		//withdrawal 값 추가
		result *= mapper.saveWithdrawal(loginMember, reasonWithdrawal);
		
		return result;
	}
//팔로우 리스트 
	@Override
	public int getListCount() {
		
		return mapper.selectListCount();
	}

	@Override
	public List<Follow> getFollowList(PageInfo pageInfo, String id) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());	
		
		
		return mapper.selectFollowList(rowBounds, id);
	}
//팔로우 취소
	@Override
	public int deleteFollow(String deleteFollow, String id) {
		
		return mapper.deleteFollow(deleteFollow, id);
	}
//회원 신고
	@Override
	public int reportMember(String id, String reportId, String reportType, String reportContent) {
	
		return mapper.reportMember(id, reportId, reportType, reportContent);
	}
//팔로우하기
	@Override
	public int follow(String id, String followId) {
		
		return mapper.insertFollower(id, followId);
	}
//팔로우 되어있는지 확인 
	@Override
	public int isfollow(String id, String followId) {
		
		return mapper.isFollower(id, followId);
	}
//아이디 검색 자동완성
	@Override
	public List<String> getMemberIdList() {
		
		return mapper.selectMemberIdList();
	}
//admin_viewMember - 신고된 회원 조회
	@Override
	public List<memberReport> admin_reportMember(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectReportMemberList(rowBounds);
	}
	
	@Override
	public int getReportListCount() {
		
		return mapper.selectReportListCount();
	}
//admin- 신고 회원 경고 주기
	@Override
	public int admin_warnMember(String warnMemberId) {
		
		return mapper.addMemberReportCount(warnMemberId);
	}
//admin_viewWithdrawMember- 탈퇴 회원 
	@Override
	public List<memberReport> admin_withdrawalMember(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectWithdrawalMemberList(rowBounds);
	}
//등급테이블 가져오기
	@Override
	public List<Grade> setGradeName(int point) {
		
		return mapper.setGradeName();
	}
//등급 member gradeName에 삽입
	@Override
	public void updateGradename(String gradeName, int no) {
		
		mapper.updateGradename(gradeName, no);
	}
}