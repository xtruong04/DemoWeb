/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.controller;

import com.uef.model.User;
import com.uef.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author vinh nguyen
 */
@Controller
@RequestMapping("/admin")
public class LoginController {

    @Autowired
    private UserService userService;
    private final String path = "/WEB-INF/views/admin/";

    @GetMapping
    public String showLoginForm() {
        return "admin/login"; // đường dẫn: /WEB-INF/views/admin/login.jsp
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("user") User userForm, HttpSession session, Model model) {
        User user = userService.authenticate(userForm.getTenNguoiDung(), userForm.getMatKhau());
        if (user != null && "coordinator".equalsIgnoreCase(user.getVaiTro())) {
            session.setAttribute("user", user);
            return "redirect:/admin/dashboard";
        }
        model.addAttribute("error", "Sai tài khoản hoặc mật khẩu");
        return "admin/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin";
    }
}
