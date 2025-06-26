/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.controller;

import com.uef.annotation.RoleRequired;
import com.uef.model.User;
import jakarta.servlet.http.HttpSession;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author vinh nguyen
 */
@Controller
public class LoginController {

    @Autowired
    JdbcTemplate jdbcTemplate;

    private User mapRow(ResultSet rs, int rowNum) throws SQLException {
        User r = new User();
        r.setEmail(rs.getString("email"));
        r.setVaiTro(rs.getString("role_name"));
        return r;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String showLoginPage() {
        return "login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String doLogin(@RequestParam("email") String email,
            @RequestParam("password") String password,
            HttpSession session, Model model) {
        String sql = "SELECT u.email, r.role_name FROM Users u JOIN user_roles ur "
                + "ON u.user_id = ur.user_id JOIN roles r ON ur.role_id = r.role_id "
                + "WHERE u.email=? AND u.[password]=?";

        try {
            List<User> users = jdbcTemplate.query(sql, this::mapRow, email, password);
            if (users.isEmpty()) {
                model.addAttribute("errorMsg", "Sai tài khoản hoặc mật khẩu");
                return "login";
            }

            User item = users.get(0); // lấy người đầu tiên
            session.setAttribute("email", item.getEmail());
            session.setAttribute("user", item); // bổ sung dòng này

            StringBuilder roles = new StringBuilder(item.getVaiTro());
            for (int i = 1; i < users.size(); i++) {
                roles.append(",").append(users.get(i).getVaiTro());
            }

            String roleString = roles.toString();
            session.setAttribute("role", roleString);

            // 👉 Chuyển hướng theo quyền
            if (roleString.contains("coordinator")) {
                return "redirect:/admin/dashboard";
            } else {
                return "unauthorized";
            }

        } catch (Exception e) {
            model.addAttribute("errorMsg", "Lỗi hệ thống: " + e.getMessage());
            return "login";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin";
    }
}
