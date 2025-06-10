/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.controller;

import com.uef.model.User;
import com.uef.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ADMIN
 */
@Controller
public class AuthController {

    @Autowired
    private UserService userService;

    // Hiển thị form đăng nhập
    @GetMapping("/login")
    public String showLoginForm(Model model) {
        model.addAttribute("user", new User());
        return "login"; // Trả về login.jsp
    }

    // Xử lý đăng nhập
    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password, Model model) {
        User user = userService.findByEmail(email); // Sử dụng findByEmail thay vì getById
        if (user != null && user.getMatKhau().equals(password)) {
            // Logic đăng nhập thành công (ví dụ: lưu session hoặc chuyển hướng)
            model.addAttribute("message", "Đăng nhập thành công!");
            return "redirect:/activities"; // Chuyển hướng đến trang hoạt động
        } else {
            model.addAttribute("error", "Email hoặc mật khẩu không đúng!");
            return "login"; // Trả về lại form với thông báo lỗi
        }
    }

    // Hiển thị form đăng ký
    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("user", new User());
        return "register"; // Trả về register.jsp
    }

    // Xử lý đăng ký
    @PostMapping("/register")
    public String register(@ModelAttribute User user, Model model) {
        if (userService.findByEmail(user.getEmail()) != null) {
            model.addAttribute("error", "Email đã được sử dụng!");
            return "register";
        }

        // Gán role mặc định nếu chưa có
        user.setVaiTro("volunteer"); // 👈 Dòng quan trọng

        userService.add(user);
        model.addAttribute("message", "Đăng ký thành công! Vui lòng đăng nhập.");
        return "redirect:/login";
    }
}
