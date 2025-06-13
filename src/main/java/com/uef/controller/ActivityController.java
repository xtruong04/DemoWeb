package com.uef.controller;

import com.uef.model.Activity;
import com.uef.model.User;
import com.uef.service.ActivityService;
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
@RequestMapping("/admin/activities")
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @Autowired
    private UserService userService; // Thêm UserService để lấy danh sách user

    private final String path = "/WEB-INF/views/admin/";

    // Hiển thị danh sách hoạt động
    @GetMapping
    public String listActivities(Model model) {
        List<Activity> activities = activityService.getAll();
        model.addAttribute("activities", activities);
        model.addAttribute("body", path + "activity/list.jsp");
        return "admin/layout/main";
    }

    // Hiển thị form thêm mới
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("activity", new Activity());

        List<User> coordinators = userService.getCoordinators(); // chỉ lấy coordinators
        model.addAttribute("users", coordinators);

        model.addAttribute("body", path + "activity/form.jsp");
        return "admin/layout/main";
    }

    // Xử lý thêm mới
    @PostMapping("/add")
    public String addActivity(@ModelAttribute Activity activity) {
        activityService.add(activity);
        return "redirect:/admin/activities";
    }

    // Hiển thị form cập nhật
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model) {
        Activity activity = activityService.getById(id);
        model.addAttribute("activity", activity);

        List<User> coordinators = userService.getCoordinators();
        model.addAttribute("users", coordinators);

        model.addAttribute("body", path + "activity/form.jsp");
        return "admin/layout/main";
    }

    // Xử lý cập nhật
    @PostMapping("/edit")
    public String updateActivity(@ModelAttribute Activity activity) {
        activityService.update(activity);
        return "redirect:/admin/activities";
    }

    // Xử lý xóa
    @GetMapping("/delete/{id}")
    public String deleteActivity(@PathVariable("id") int id) {
        activityService.delete(id);
        return "redirect:/admin/activities"; // phải đúng path
    }
}
