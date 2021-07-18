package com.missionpossibleback.mvc.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.weaver.ast.Call;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.missionpossibleback.mvc.member.model.vo.Member;


/*
 인터셉터(Interceptor)
    - 컨트롤러에 들어오는 요청(HttpRequest)과 응답(HttpResponse)을 가로채는 역할을 한다.
    - 인터셉터를 구현하기 위해서는 HandlerInterceptorAdapter 클래스를 상속하는 방법으로 구현해야한다.
    
 필터와의 차이점
    - 필터는 Servlet 수행 전에 실행된다.(web.xml에 설정)
    - 인터셉터는 DispatcherServlet 수행 후 컨트롤라에 요청을 넘기기 전에 실행된다. (servlet-context.xml에 설정)
 */
public class AdminCheckInterceptor extends HandlerInterceptorAdapter {

   @Override
   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      // 컨트롤러가 실행되기 전에 필요한 작업을 할 수 있는 메소드
      // 반환값이 false일 경우 컨트롤러를 실행하지 않는다.
      
      
      System.out.println("preHandle() call...");
      Member loginMember = (Member)request.getSession().getAttribute("loginMember");
      String admin = "admin";
            
      if(loginMember == null ) {
         request.setAttribute("msg", "관리자만 이용이 가능합니다.");
         request.setAttribute("location", "/");
         request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
         
         return false;
      }
      
      if(!loginMember.getStatus().equals("A")) {
         request.setAttribute("msg", "관리자만 이용이 가능합니다.");
         request.setAttribute("location", "/");
         request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
         
         return false;
      }
      
      return super.preHandle(request, response, handler);
   }

   @Override
   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
         ModelAndView modelAndView) throws Exception {
      // 컨트롤러가 실행된 후에 필요한 작업을 할 수 있는 메소드
      System.out.println("postHandle() call...");
      
      super.postHandle(request, response, handler, modelAndView);
   }

   @Override
   public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
         throws Exception {
      // 컨트롤러의 처리가 끝나고 화면처리(View)까지 모두 끝나면 실행되는 메소드
      System.out.println("afterCompletion() call...");
      
      super.afterCompletion(request, response, handler, ex);
   }

   @Override
   public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
         throws Exception {
      // 비동기 요청 시 postHandle과 afterCompletion이 수행되지 않고 afterConcurrentHandlingStarted 메소드가 실행된다.
      System.out.println("afterConcurrentHandlingStarted() call...");
      
      super.afterConcurrentHandlingStarted(request, response, handler);
   }
   
   
   
   
}