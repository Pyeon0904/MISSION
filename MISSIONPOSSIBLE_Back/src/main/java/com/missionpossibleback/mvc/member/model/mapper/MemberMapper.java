package com.missionpossibleback.mvc.member.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Repository;

import com.missionpossibleback.mvc.member.model.vo.Follow;
import com.missionpossibleback.mvc.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	Member selectMember(@Param("id") String id);
	
	int updateTempPw(@Param("tempPassword") String tempPassword, @Param("memberNo") int memberNo);

	Member selectMemberbyNick(@Param("Nickname") String nickname);

	int updateMember(Member member);

	int insertMember(Member member);

	int deleteMember(@Param("memberNo") int memberNo);

	int saveWithdrawal(@Param("id") String id, @Param("reasonWithdrawal") String reasonWithdrawal);

	int selectListCount();

	List<Follow> selectFollowList(RowBounds rowBounds, @Param("id") String id);

	int deleteFollow(@Param("deleteFollow") String deleteFollow, @Param("id") String id);

	int reportMember(@Param("id")String id, @Param("reportId")String reportId, @Param("reportType")String reportType, @Param("reportContent")String reportContent);

	int insertFollower(@Param("id")String id, @Param("followId")String followId);

	int isFollower(@Param("id")String id, @Param("followId")String followId);

}