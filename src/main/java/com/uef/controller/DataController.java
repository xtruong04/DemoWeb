/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.controller;

import com.uef.model.Cause;
import com.uef.model.News;
import com.uef.model.Reason;
import com.uef.model.Volunteer;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ADMIN
 */
@Controller
public class DataController {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @GetMapping("/")
    public String getData(@RequestParam(value = "section", required = false) String section, Model model) {
        try {
            // Lấy dữ liệu từ tất cả các bảng
            List<Reason> reasons = jdbcTemplate.query(
                    "SELECT * FROM reasons",
                    (rs, rowNum) -> new Reason(
                            rs.getInt("id"),
                            rs.getString("title"),
                            rs.getString("description"),
                            rs.getString("image_url")
                    )
            );
            List<Cause> causes = jdbcTemplate.query(
                    "SELECT * FROM causes",
                    (rs, rowNum) -> new Cause(
                            rs.getInt("id"),
                            rs.getString("title"),
                            rs.getString("description"),
                            rs.getString("image_url"),
                            rs.getDouble("raised"),
                            rs.getDouble("goal")
                    )
            );
            List<Volunteer> volunteers = jdbcTemplate.query(
                    "SELECT * FROM volunteers",
                    (rs, rowNum) -> new Volunteer(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("role"),
                            rs.getString("image_url"),
                            rs.getString("facebook_url"),
                            rs.getString("pinterest_url"),
                            rs.getString("linkedin_url"),
                            rs.getString("twitter_url")
                    )
            );
            List<News> newsList = jdbcTemplate.query(
                    "SELECT * FROM news",
                    (rs, rowNum) -> new News(
                            rs.getInt("id"),
                            rs.getString("title"),
                            rs.getDate("date"),
                            rs.getString("description"),
                            rs.getString("image_url"),
                            rs.getString("link")
                    )
            );

            // Thêm dữ liệu vào model
            model.addAttribute("reasons", reasons);
            model.addAttribute("causes", causes);
            model.addAttribute("volunteers", volunteers);
            model.addAttribute("newsList", newsList);

            // Nếu người dùng chọn section cụ thể (trang con)
            if (section != null) {
                model.addAttribute("body", "client/" + section + ".jsp");
            } else {
                // Mặc định là home
                model.addAttribute("body", "home.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("body", "error.jsp");
        }

        // Trả về layout chính
        return "layout/main";

    }
}
