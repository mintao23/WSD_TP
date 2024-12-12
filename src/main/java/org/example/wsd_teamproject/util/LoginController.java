package org.example.wsd_teamproject.util;

import org.example.wsd_teamproject.member.MemberServiceImpl;
import org.example.wsd_teamproject.member.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/login")
public class LoginController {

    @Autowired
    MemberServiceImpl service;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/loginOk", method = RequestMethod.POST)
    public String loginCheck(HttpSession session, MemberVO vo, Model model) {
        String returnURL = "";
        if (session.getAttribute("login") != null) {
            session.removeAttribute("login");
        }
        // 평문 비밀번호 비교
        MemberVO loginvo = service.getMember(vo);
        if (loginvo != null) {
            System.out.println("로그인 성공!");
            session.setAttribute("login", loginvo);
            returnURL = "redirect:/todo/list";
        } else {
            System.out.println("로그인 실패!");
            model.addAttribute("loginError", "아이디 또는 비밀번호가 일치하지 않습니다.");
            returnURL = "login";
        }
        return returnURL;
    }

    @RequestMapping(value = "/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login/login";
    }
}
