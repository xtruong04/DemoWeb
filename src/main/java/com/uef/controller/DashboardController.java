package com.uef.controller;

import com.uef.model.Activity;
import com.uef.model.Notification;
import com.uef.model.User;
import com.uef.service.ActivityService;
import com.uef.service.NotificationService;
import com.uef.service.RatingService;
import com.uef.service.RegistrationService;
import com.uef.service.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.web.bind.annotation.ModelAttribute;

@Controller
@RequestMapping("/admin/dashboard")
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
    public String showDashboard(Model model, HttpSession session) {
       
        // Thống kê
        model.addAttribute("totalActivities", activityService.getAll().size());
        model.addAttribute("totalUsers", userService.getAll().size());
        model.addAttribute("totalRegistrations", registrationService.getAll().size());
        model.addAttribute("totalNotifications", notificationService.getAll().size());
        model.addAttribute("totalRatings", ratingService.getAll().size());

        // Danh sách điều phối viên
        model.addAttribute("users", userService.getCoordinators());

        // Danh sách hoạt động gần đây (giới hạn 5 bản ghi)
        List<Activity> recentActivities = activityService.getAll().stream()
                .limit(5)
                .collect(Collectors.toList());
        model.addAttribute("recentActivities", recentActivities);

        // Danh sách thông báo gần đây (giới hạn 5 bản ghi)
        List<Notification> recentNotifications = notificationService.getAll().stream()
                .limit(5)
                .collect(Collectors.toList());
        model.addAttribute("recentNotifications", recentNotifications);

        // Đối tượng Activity để bind form
        model.addAttribute("activity", new Activity());

        model.addAttribute("body", path + "dashboard.jsp");
        return "admin/layout/main";
    }

    @PostMapping("/add")
    public String addActivity(@Valid @ModelAttribute Activity activity, BindingResult result, Model model, HttpSession session) {
        // Kiểm tra quyền truy cập
        User user = (User) session.getAttribute("user");
        if (user == null || !"coordinator".equalsIgnoreCase(user.getVaiTro())) {
            return "redirect:/login";
        }

        // Kiểm tra validation
        if (result.hasErrors()) {
            // Load lại dữ liệu dashboard
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

        // Lưu hoạt động
        activityService.add(activity);
        return "redirect:/admin/dashboard";
    }
}