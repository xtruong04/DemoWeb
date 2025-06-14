/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.repository;

import com.uef.model.Activity;
import com.uef.model.Rating;
import com.uef.model.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ADMIN
 */
@Repository
public class RatingRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private Rating mapRow(ResultSet rs, int rowNum) throws SQLException {
        Rating rating = new Rating();
        rating.setMaDanhGia(rs.getInt("rating_id"));
        rating.setDiemDanhGia(rs.getInt("rating"));
        rating.setBinhLuan(rs.getString("comment"));
        rating.setNgayTao(rs.getObject("created_at", LocalDateTime.class));

        // Gán người dùng
        User user = new User();
        user.setMaNguoiDung(rs.getInt("u_id"));
        user.setTenNguoiDung(rs.getString("u_name"));
        user.setEmail(rs.getString("u_email"));
        user.setVaiTro(rs.getString("u_role"));
        user.setSoDienThoai(rs.getString("u_phone"));
        user.setDiaChi(rs.getString("u_address"));
        user.setNgonNguUuTien(rs.getString("u_lang"));
        rating.setNguoiDung(user);

        // Gán hoạt động
        Activity activity = new Activity();
        activity.setMaHoatDong(rs.getInt("a_id"));
        activity.setTieuDe(rs.getString("a_title"));
        activity.setMoTa(rs.getString("a_description"));
        rating.setHoatDong(activity);

        return rating;
    }

    public List<Rating> findAll() {
        String sql
                = "SELECT r.*, "
                + "       u.user_id AS u_id, u.name AS u_name, u.email AS u_email, u.role AS u_role, "
                + "       u.phone AS u_phone, u.address AS u_address, u.language_preference AS u_lang, "
                + "       a.activity_id AS a_id, a.title AS a_title, a.description AS a_description "
                + "FROM Ratings r "
                + "JOIN Users u ON r.user_id = u.user_id "
                + "LEFT JOIN Activities a ON r.activity_id = a.activity_id";
        return jdbcTemplate.query(sql, this::mapRow);
    }

    public Rating findById(int id) {
        String sql = "SELECT * FROM Ratings WHERE rating_id = ?";
        return jdbcTemplate.queryForObject(sql, this::mapRow, id);
    }

    public void save(Rating rating) {
        String sql = "INSERT INTO Ratings (user_id, activity_id, rating, comment, created_at) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                rating.getNguoiDung().getMaNguoiDung(),
                rating.getHoatDong().getMaHoatDong(),
                rating.getDiemDanhGia(),
                rating.getBinhLuan(),
                rating.getNgayTao());
    }

    public void update(Rating rating) {
        String sql = "UPDATE Ratings SET user_id = ?, activity_id = ?, rating = ?, comment = ?, created_at = ? WHERE rating_id = ?";
        jdbcTemplate.update(sql,
                rating.getNguoiDung().getMaNguoiDung(),
                rating.getHoatDong().getMaHoatDong(),
                rating.getDiemDanhGia(),
                rating.getBinhLuan(),
                rating.getNgayTao(),
                rating.getMaDanhGia());
    }

    public void delete(int id) {
        String sql = "DELETE FROM Ratings WHERE rating_id = ?";
        jdbcTemplate.update(sql, id);
    }
}
