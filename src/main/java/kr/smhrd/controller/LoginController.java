package kr.smhrd.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.entity.Member;
import kr.smhrd.repository.BoardMapper;

@Controller
public class LoginController {

	@Autowired
	private BoardMapper mapper;
	
	@RequestMapping("/login.do")
	public String login(Member member, HttpSession session) { // memId, memPwd
		Member m=mapper.login(member);
		// m에 값이 null이면 실패, m에 값이 들어있으면 성공
		if(m!=null) {
			session.setAttribute("m", m); // ${m}	
		}
		return "redirect:/list.do";
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) { // 현재만들어져있는 세션을 가지고 오기
		session.invalidate();//무효화(로그아웃)
		return "redirect:/list.do";
	}
}
