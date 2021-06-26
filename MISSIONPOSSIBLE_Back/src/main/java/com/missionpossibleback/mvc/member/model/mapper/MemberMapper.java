package com.missionpossibleback.mvc.member.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.missionpossibleback.mvc.member.model.vo.Member;

@Mapper
public interface MemberMapper {
	Member selectMember(@Param("id") String id);

}