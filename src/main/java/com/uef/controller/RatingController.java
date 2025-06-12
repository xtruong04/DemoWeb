package com.uef.controller;

import com.uef.model.Rating;
import com.uef.service.RatingService;
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
@RequestMapping("/ratings")
public class RatingController {

    @Autowired
    private RatingService ratingService;

    private final String path = "/WEB-INF/views/";

    // Hiển thị danh sách đánh giá
    @GetMapping
    public String listRatings(Model model) {
        List<Rating> ratings = ratingService.getAll();
        model.addAttribute("ratings", ratings);
        model.addAttribute("body", path + "ratings/list.jsp");
        return "layout/main";
    }

    // Hiển thị form thêm mới
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("rating", new Rating());
        model.addAttribute("body", path + "ratings/form.jsp");
        return "layout/main";
    }

    // Xử lý thêm mới
    @PostMapping("/add")
    public String addRating(@ModelAttribute Rating rating) {
        ratingService.add(rating);
        return "redirect:/ratings";
    }

    // Hiển thị form cập nhật
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") int id, Model model) {
        Rating rating = ratingService.getById(id);
        if (rating == null) {
            return "redirect:/ratings";
        }
        model.addAttribute("rating", rating);
        model.addAttribute("body", path + "ratings/form.jsp");
        return "layout/main";
    }

    // Xử lý cập nhật
    @PostMapping("/edit")
    public String updateRating(@ModelAttribute Rating rating) {
        ratingService.update(rating);
        return "redirect:/ratings";
    }

    // Xử lý xóa
    @GetMapping("/delete/{id}")
    public String deleteRating(@PathVariable("id") int id) {
        ratingService.delete(id);
        return "redirect:/ratings";
    }
}