package com.missionpossibleback.mvc.challenge.model.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.missionpossibleback.mvc.challenge.model.mapper.ChallengeMapper;
import com.missionpossibleback.mvc.challenge.model.vo.Category;
import com.missionpossibleback.mvc.challenge.model.vo.Challenge;
import com.missionpossibleback.mvc.challenge.model.vo.ChallengeCertify;
import com.missionpossibleback.mvc.challenge.model.vo.Giveup;
import com.missionpossibleback.mvc.challenge.model.vo.MyChallengeList;
import com.missionpossibleback.mvc.challenge.model.vo.Pointlog;
import com.missionpossibleback.mvc.common.util.PageInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ChallengeServiceImpl implements ChallengeService {

	@Autowired
	private ChallengeMapper mapper;
	
	//챌린지 등록 OR 수정 로직
	@Override
	@Transactional
	public int save(Challenge challenge) {
		
		int result = 0;
		
		if(challenge.getChallengeNo() != 0) {
			result = mapper.updateChallenge(challenge);
		} else {
			result = mapper.insertChallenge(challenge);
		}
		
		return result;
	}
	
	// 첼린지 인증 게시물 저장 로직
	@Override
	public int saveCertify(ChallengeCertify certify) {
		
		int result = 0;
		
		if(certify.getNo() != 0) {
//			result = mapper.updateChallenge(challenge);
		} else {
			result = mapper.insertCertify(certify);
		}
		
		return result;
	}
	
	// 찜하기 / 참여중 상태를 MY_CHALLENGE_LIST에 저장하는 로직
	@Override
	@Transactional //선언적 트랜잭션 - RuntimeException에 대해서만 롤백처리가 가능하게끔 해주는 어노테이션 / 인터페이스를 사용하는 클래스에서만 활용가능
	public int saveMyChallengeList(MyChallengeList myChallengeList) {
		int result = 0;
		
		if(myChallengeList.getNo() != 0) {
			
		} else {
			result = mapper.insertMyChallengeList(myChallengeList);
		}
		return result;
	}	
	
	// 챌린지 현재 참여 인원 수정
	@Override
	@Transactional
	public int saveCurrentCount(Challenge challenge) {
		return mapper.updateCurrentCount(challenge);
	}
	
	// 파일 저장하는 로직
	@Override
	public String saveFile(MultipartFile upfile, String savePath) {
		String renameFileName = null;
		String renamePath = null;
		String originalFileName = upfile.getOriginalFilename();
		
		log.info("SAVE PATH : {}", savePath);
		
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
			upfile.transferTo(new File(renamePath));
		} catch (IOException e) {
			System.out.println("파일 전송 에러 : " + e.getMessage());
			e.printStackTrace();
		}
		
		return renameFileName;
	}
	
	// 파일 삭제 로직
	@Override
	public void deleteFile(String filePath) {
		
		log.info("FILE PATH : {}", filePath );
		
		File file = new File(filePath);
		
		if(file.exists()) file.delete();
	}
	
	// 전체 챌린지 조회
	@Override
	public List<Challenge> getChallengeList(PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectChallengeList(rowBounds);
	}
	
	// 전체 챌린지 조회(페이징 X)
	@Override
	public List<Challenge> getChallengeList() {
		
		return mapper.selectChallengeList();
	}

	
	// 모집중인 챌린지 조회
	@Override
	public List<Challenge> getRecruitList(PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectRecruitList(rowBounds);
	}

	// 진행중인 챌린지 조회
	@Override
	public List<Challenge> getOngoingList(PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectOngoingList(rowBounds);
	}
	
	// 종료된 챌린지 조회
	@Override
	public List<Challenge> getEndList(PageInfo pageInfo) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectEndList(rowBounds);
	}
	
	// 찜한 챌린지 조회
	@Override
	public List<Challenge> getZzimList(PageInfo pageInfo, String id) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectZzimList(rowBounds, id);
	}	
	
	// 챌린지 인증 리스트 조회
	@Override
	public List<ChallengeCertify> getCertList(PageInfo pageInfo, int no) {
		
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectCertList(rowBounds, no);
	}
	
	// 챌린지 전체 개수 출력
	@Override
	public int getChallengeCount() {
			
		return mapper.selectChallengeCount();
	}	
	
	// 챌린지 전체 개수 출력
	@Override
	public int getChallengeCountById(String id) {
			
		return mapper.selectChallengeCountById(id);
	}

	// 모집중인 챌린지 개수 출력 
	@Override
	public int getRecruitCount() {
		
		return mapper.selectRecruitCount();
	}

	// 진행중인 챌린지 개수 출력
	@Override
	public int getOngoingCount() {
		
		return mapper.selectOngoingCount();
	}

	// 종료된 챌린지 개수 출력
	@Override
	public int getEndCount() {
		
		return mapper.selectEndCount();
	}
	
	//찜한 챌린지 개수 출력
	@Override
	public int getZzimCount(String id) {
		
		log.info("getZzimCount 요청한 ID : " + id);
		
		return mapper.selectZzimCount(id);
	}
	
	//해당 챌린지가 로그인한 유저가 참여하고 있으면 1리턴, 참여하지 않고 있으면 0리턴
	@Override
	public int getJoinListCount(int no, String id) {
		
		log.info("getJoinListCount 요청 - 챌린지NO : " + no + ", 요청한 ID : " + id);
		
		return mapper.selectJoinListCount(no, id);
	}	
	
	// 참여하고 있는 챌린지에서 현재 참여하고 있는 참가자 수를 리턴하는 메소드
	@Override
	public int getCurrentCount(int no) {
		
		return mapper.selectCurrentCount(no);
	}	

	// 챌린지NO를 이용해 해당 챌린지 인증 LIST의 수를 알려주는 메소드
	@Override
	public int getCertCount(int no) {
		
		return mapper.selectCertCount(no);
	}	
	
	// 챌린지 인증 개수 출력 (ID값을 통해 로그인한 유저의 진행도 파악 가능)
	@Override
	public int getCertCountById(int no, String id) {
		
		return mapper.selectCertCountById(no, id);
	}
	
	
	// 챌린지NO를 이용해 게시물 객체 접근하기(View 불러오기 위함)
	@Override
	public Challenge findByNo(int challengeNo) {
		
		return mapper.selectChallengeByNo(challengeNo);
	}
	
	// 챌린지 NO를 이용해 인증게시물등록한 ID리스트 출력
	@Override
	public List<String> findCertIdList(int no) {
		
		return mapper.selectCertIdList(no);
	}
	
	// 참여중인 챌린지뷰에서 인증 날짜 리스트 조회
	@Override
	public List<String> getCertDateById(int no, String id) {
		
		return mapper.selectCertDateById(no, id);
	}

	/*
	 ============= 검색 기능 =============
	 */ 
	// 챌린지 검색 페이징 처리를 위한 개수 세기
	@Override
	public int getSearchCount(String key, String word) {
		
		return mapper.selectSearchCount(key, word);
	}

	// 키워드 통해 챌린지 검색 및 페이징
	@Override
	public List<Challenge> getSearchList(String key, String word, PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());	
		
		return mapper.selectSearchList(key, word, rowBounds);
	}

	//============ 마이페이지 관련 ==============
	// 참여중인 챌린지 수 조회
	@Override
	public int getJoinCount(String id) {
		
		return mapper.selectJoinCount(id);
	}
	
	@Override
	public int getEndJoinCount(String id) {
		return mapper.selectEndJoinCount(id);
	}

	// 참여중인 챌린지 리스트 조회
	@Override
	public List<Challenge> getJoinList(PageInfo pageInfo, String id) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, pageInfo.getListLimit());
		
		return mapper.selectJoinList(rowBounds, id);
	}

	// MyChallengeList 삭제 (찜 삭제 or 챌린지 참여 포기)
	@Override
	public int deleteMyChallengeList(String id, int cNo, String myStatus) {
		
		return mapper.deleteMyChallengeList(id, cNo, myStatus);
	}

	// 챌린지 참가 신청 시 포인트 차감하는 메소드
	@Override
	public int saveMemberPoint(String id, int resultPoint) {
		
		return mapper.updateMemberPoint(id, resultPoint);
	}

	// 포인트 증감 로그 저장하는 로직
	@Override
	public int savePointlog(Pointlog pointlog) {
		
		return mapper.insertPointlog(pointlog);
	}

	// 포인트 증감 로그 조회(BY ID)
	@Override
	public List<Pointlog> findPointlogById(String id) {
		
		return mapper.selectPointlogById(id);
	}
	
	//
	@Override
	public Pointlog findPointlogByObject(String id, int cno, String history) {
		
		return mapper.selectPointlogByObject(id, cno, history);
	}

	//  관리자 페이지 - 여러개의 챌린지 선택 후 삭제 메소드
	@Override
	public int selectDelete(int[] intNo) {
		
		return mapper.selectDelete(intNo);
	}

	// 관리자 페이지 - 한 개의 챌린지 선택 후 삭제 메소드
	@Override
	public int selectOneDelete(String str) {
		
		return mapper.selectOneDelete(str);
	}

	// 관리자 페이지 - 삭제된 챌린지 전체 조회
	@Override
	public List<Challenge> getDeleteChallengeAllList() {
		
		return mapper.selectDeleteChallengeList();
	}

	// 관리자 페이지 - 여러개의 삭제된 챌린지 복구
	@Override
	public int selectRestore(int[] intNo) {
		
		return mapper.selectRestore(intNo);
	}

	// 관리자 페이지 - 한 개의 삭제된 챌린지 복구
	@Override
	public int selectOneRestore(String str) {
		
		return mapper.selectOneRestore(str);
	}

	// 관리자 페이지 - 챌린지 포기 사유 리스트 조회
	@Override
	public List<Giveup> getGiveupList() {
		
		return mapper.selectGiveup();
	}

	// 챌린지 포기 시 사유 저장
	@Override
	public int saveGiveup(Giveup giveup) {
		
		return mapper.insertGiveup(giveup);
	}

	// 관리자 페이지 - 챌린지 포기 사유 한 개 확인 후 삭제
	@Override
	public int selectOneReasonDelete(String str) {
		
		return mapper.selectOneReasonDelete(str);
	}

	// 관리자 페이지 - 챌린지 포기 사유 여러 개 확인 후 삭제
	@Override
	public int selectReasonDelete(int[] intNo) {
		
		return mapper.selectReasonDelete(intNo);
	}

	@Override
	public List<Category> getCategoryList() {
		
		return mapper.selectCategory();
	}

	@Override
	public int selectOneCateDelete(String str) {
		
		return mapper.selectOneCateDelete(str);
	}

	@Override
	public int selectCateDelete(String[] strNo) {
		
		return mapper.selectCateDelete(strNo);
	}

	@Override
	public int cateAdd(String str1, String str2) {
		
		return mapper.insertCategory(str1, str2);
	}
	
}
