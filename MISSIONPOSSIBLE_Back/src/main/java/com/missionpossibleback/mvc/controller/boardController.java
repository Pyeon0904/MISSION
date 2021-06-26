package com.missionpossibleback.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.missionpossibleback.mvc.member.controller.MemberController;
import com.missionpossibleback.mvc.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class boardController {
	
@GetMapping("/board/boardList")
      public String boardList() {
         
         log.info("게시판 목록");
            
         return "board/boardList"; // 뷰 이름 리턴
      }
      
      @GetMapping("/board/boardDetail")
      public String boardDetail() {
         
         log.info("게시판 상세보기");
            
         return "board/boardDetail"; // 뷰 이름 리턴
      }
      
      @GetMapping("/board/boardWrite")
      public String boardWrite() {
         
         log.info("게시판 글쓰기");
            
         return "board/boardWrite"; // 뷰 이름 리턴
      }
      
      @GetMapping("/board/boardModify")
      public String boardModify() {
         
         log.info("게시판 수정");
            
         return "board/boardModify"; // 뷰 이름 리턴
      }
      
      @GetMapping("/board/boardReply")
      public String boardReply() {
         
         log.info("게시판 답글");
            
         return "board/boardReply"; // 뷰 이름 리턴
      }
}
