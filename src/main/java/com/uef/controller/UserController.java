package com.uef.controller;

import com.uef.model.User;
import com.uef.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    private final String path = "/WEB-INF/views/";

    // Hiển thị danh sách người dùng
    @GetMapping
    public String listUsers(Model model) {
        List<User> users = userService.getAll();
        model.addAttribute("users", users);
        model.addAttribute("body", path + "users/list.jsp");
        return "layout/main";
    }

    // Hiển thị form thêm mới
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("body", path + "users/form.jsp");
        return "layout/main";
    }

    // Xử lý thêm mới
    @PostMapping("/add")
    public String addUser(@ModelAttribute User user) {
        userService.add(user);
        return "redirect:/users";
    }

    // Hiển thị form cập nhật
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model) {
        User user = userService.getById(id);
        if (user == null) {
            return "redirect:/users"; // Chuyển hướng nếu không tìm thấy
        }
        model.addAttribute("user", user);
        model.addAttribute("body", path + "users/form.jsp");
        return "layout/main";
    }

    // Xử lý cập nhật
    @PostMapping("/edit")
    public String updateUser(@ModelAttribute User user) {
        userService.update(user);
        return "redirect:/users";
    }

    // Xử lý xóa
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") int id) {
        userService.delete(id);
        return "redirect:/users";
    }
}