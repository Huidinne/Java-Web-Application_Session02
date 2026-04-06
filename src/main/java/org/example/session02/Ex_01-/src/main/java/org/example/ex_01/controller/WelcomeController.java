package org.example.ex_01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WelcomeController {
    @GetMapping( "/welcome")
    public String showWelcome(Model model) {
        model.addAttribute("staffName", "Đinh Quang Huy");
        model.addAttribute("department", "Công nghệ thông tin");
        return "welcome";
    }
}
