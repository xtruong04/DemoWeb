/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.repository;

import com.uef.model.Rating;
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
        // User and Activity are not mapped here; they require separate queries or joins
        return rating;
    }

    public List<Rating> findAll() {
        String sql = "SELECT * FROM Ratings";
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
