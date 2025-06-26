package com.uef.controller;

import com.uef.annotation.RoleRequired;
import com.uef.model.Activity;
import com.uef.model.Notification;
import com.uef.service.ActivityService;
import com.uef.service.NotificationService;
import com.uef.service.RatingService;
import com.uef.service.RegistrationService;
import com.uef.service.UserService;
import jakarta.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/dashboard")
@RoleRequired("coordinator")
public class DashboardController {

    @Autowired
    private ActivityService activityService;
    @Autowired
    private UserService userService;
    @Autowired
    private RegistrationService registrationService;
    @Autowired
    private NotificationService notificationService;
    @Autowired
    private RatingService ratingService;

    private final String path = "/WEB-INF/views/admin/";

    @GetMapping
    public String showDashboard(Model model) {
        // Thống kê tổng
        model.addAttribute("totalActivities", activityService.getAll().size());
        model.addAttribute("totalUsers", userService.getAll().size());
        model.addAttribute("totalRegistrations", registrationService.getAll().size());
        model.addAttribute("totalNotifications", notificationService.getAll().size());
        model.addAttribute("totalRatings", ratingService.getAll().size());

        // Danh sách điều phối viên
        model.addAttribute("users", userService.getCoordinators());

        // Danh sách hoạt động và thông báo gần đây
        List<Activity> recentActivities = activityService.getAll().stream().limit(5).collect(Collectors.toList());
        model.addAttribute("recentActivities", recentActivities);

        List<Notification> recentNotifications = notificationService.getAll().stream().limit(5).collect(Collectors.toList());
        model.addAttribute("recentNotifications", recentNotifications);

        // Đối tượng để bind form thêm hoạt động
        model.addAttribute("activity", new Activity());

        // Chỉ định nội dung body hiển thị trong layout
        model.addAttribute("body", path + "dashboard.jsp");

        return "admin/layout/main"; // Gọi layout chung
    }

    @PostMapping("/add")
    @RoleRequired("coordinator")
    public String addActivity(@Valid @ModelAttribute Activity activity, BindingResult result, Model model) {
        if (result.hasErrors()) {
            // Nếu lỗi validation thì load lại dữ liệu
            model.addAttribute("totalActivities", activityService.getAll().size());
            model.addAttribute("totalUsers", userService.getAll().size());
            model.addAttribute("totalRegistrations", registrationService.getAll().size());
            model.addAttribute("totalNotifications", notificationService.getAll().size());
            model.addAttribute("totalRatings", ratingService.getAll().size());
            model.addAttribute("users", userService.getCoordinators());
            model.addAttribute("recentActivities", activityService.getAll().stream().limit(5).collect(Collectors.toList()));
            model.addAttribute("recentNotifications", notificationService.getAll().stream().limit(5).collect(Collectors.toList()));
            model.addAttribute("body", path + "dashboard.jsp");

            return "admin/layout/main";
        }

        activityService.add(activity);
        return "redirect:/admin/dashboard";
    }
}
