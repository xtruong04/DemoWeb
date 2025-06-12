/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import static org.springframework.web.servlet.function.RequestPredicates.path;

/**
 *
 * @author ADMIN
 */
@Controller
public class HomeController {

    private final String path = "/WEB-INF/views/";
    @RequestMapping("/")
    public String home(Model model) {
         model.addAttribute("body", path + "index.jsp");
        return "layout/main"; // trả về views/home.jsp
    }
}
