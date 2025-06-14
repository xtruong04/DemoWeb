package com.uef.controller;

import com.uef.model.Registration;
import com.uef.service.RegistrationService;
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
@RequestMapping("admin/registrations")
public class RegistrationController {

    @Autowired
    private RegistrationService registrationService;

    private final String path = "/WEB-INF/views/admin";

    // Hiển thị danh sách đăng ký
    @GetMapping
    public String listRegistrations(Model model) {
        List<Registration> registrations = registrationService.getAll();
        model.addAttribute("registrations", registrations);
        model.addAttribute("body", "/WEB-INF/views/admin/registrations/list.jsp");
        return "admin/layout/main";
    }

    // Hiển thị form thêm mới
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("registration", new Registration());
        model.addAttribute("body", path + "registrations/form.jsp");
        return "admin/layout/main";
    }

    // Xử lý thêm mới
    @PostMapping("/add")
    public String addRegistration(@ModelAttribute Registration registration) {
        registrationService.add(registration);
        return "redirect:/admin/registrations";
    }

    // Hiển thị form cập nhật
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model) {
        Registration registration = registrationService.getById(id);
        if (registration == null) {
            return "redirect:/admin/registrations";
        }
        model.addAttribute("registration", registration);
        model.addAttribute("body", path + "registrations/form.jsp");
        return "admin/layout/main";
    }

    // Xử lý cập nhật
    @PostMapping("/edit")
    public String updateRegistration(@ModelAttribute Registration registration) {
        registrationService.update(registration);
        return "redirect:/admin/registrations";
    }

    // Xử lý xóa
    @GetMapping("/delete/{id}")
    public String deleteRegistration(@PathVariable("id") int id) {
        registrationService.delete(id);
        return "redirect:/admin/registrations";
    }
}
