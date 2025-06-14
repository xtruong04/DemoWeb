package com.uef.controller;

import com.uef.model.Notification;
import com.uef.service.NotificationService;
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
@RequestMapping("/admin/notifications")
public class NotificationController {

    @Autowired
    private NotificationService notificationService;

    private final String path = "/WEB-INF/views/admin/";

    // Hiển thị danh sách thông báo
    @GetMapping
    public String listNotifications(Model model) {
        List<Notification> notifications = notificationService.getAll();
        model.addAttribute("notifications", notifications);
        model.addAttribute("body", path + "notifications/list.jsp");
        return "admin/layout/main";
    }

    // Hiển thị form thêm mới
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("notification", new Notification());
        model.addAttribute("body", path + "/WEB-INF/views/admin/notifications/form.jsp");
        return "admin/layout/main";
    }

    // Xử lý thêm mới
    @PostMapping("/add")
    public String addNotification(@ModelAttribute Notification notification) {
        notificationService.add(notification);
        return "redirect:/admin/notifications";
    }

    // Hiển thị form cập nhật
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model) {
        Notification notification = notificationService.getById(id);
        if (notification == null) {
            return "redirect:/admin/notifications";
        }
        model.addAttribute("notification", notification);
        model.addAttribute("body", path + "notifications/form.jsp");
        return "admin/layout/main";
    }

    // Xử lý cập nhật
    @PostMapping("/edit")
    public String updateNotification(@ModelAttribute Notification notification) {
        notificationService.update(notification);
        return "redirect:/admin/notifications";
    }

    // Xử lý xóa
    @GetMapping("/delete/{id}")
    public String deleteNotification(@PathVariable("id") int id) {
        notificationService.delete(id);
        return "redirect:/admin/notifications";
    }
}