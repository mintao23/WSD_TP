package org.example.wsd_teamproject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
    @RequestMapping("/")
    public String redirectToLogin() {
        return "redirect:/login/login";
    }
}
