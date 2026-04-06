package org.example.ex_05.controller;

import jakarta.servlet.http.HttpSession;
import org.example.ex_05.service.AuthService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HrAuthController {
    private final AuthService authService;

    public HrAuthController(AuthService authService) {
        this.authService = authService;
    }

    @GetMapping("/hr")
    public String root() {
        return "redirect:/hr/login";
    }

    @GetMapping("/hr/login")
    public String showLogin(HttpSession session) {
        if (session.getAttribute("loggedUser") != null) {
            return "redirect:/hr/employees";
        }
        return "hr/login";
    }

    @PostMapping("/hr/login")
    public String login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        HttpSession session,
                        Model model) {
        HrUser user = authService.authenticate(username, password);
        if (user == null) {
            model.addAttribute("errorMessage", "Sai tài khoản hoặc mật khẩu");
            return "hr/login";
        }

        session.setAttribute("loggedUser", user.getUsername());
        session.setAttribute("role", user.getRole());
        return "redirect:/hr/employees";
    }

    @PostMapping("/hr/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/hr/login";
    }
}

