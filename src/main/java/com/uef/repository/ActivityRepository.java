/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.repository;

import com.uef.model.Activity;
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
public class ActivityRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Mapping ResultSet to Activity object
    private Activity mapRow(ResultSet rs, int rowNum) throws SQLException {
        Activity activity = new Activity();
        activity.setMaHoatDong(rs.getInt("activity_id"));
        activity.setTieuDe(rs.getString("title"));
        activity.setMoTa(rs.getString("description"));
        activity.setNgayGio(rs.getObject("date_time", LocalDateTime.class));
        activity.setDiaDiem(rs.getString("location"));
        activity.setSoLuongToiDa(rs.getInt("max_participants"));
        activity.setHinhAnh(rs.getString("images"));

        // Note: User, Registration, Rating, and Notification lists are not mapped here
        // as they typically require separate queries or joins
        return activity;
    }

    // SELECT * FROM Activities
    public List<Activity> findAll() {
        String sql = "SELECT * FROM Activities";
        return jdbcTemplate.query(sql, this::mapRow);
    }

    // SELECT * FROM Activities WHERE activity_id = ?
    public Activity findById(int id) {
        String sql = "SELECT * FROM Activities WHERE activity_id = ?";
        return jdbcTemplate.queryForObject(sql, this::mapRow, id);
    }

    // INSERT INTO Activities (...)
    public void save(Activity activity) {
        String sql = "INSERT INTO Activities (title, description, date_time, location, max_participants, coordinator_id, images) VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                activity.getTieuDe(),
                activity.getMoTa(),
                activity.getNgayGio(),
                activity.getDiaDiem(),
                activity.getSoLuongToiDa(),
                activity.getDieuPhoiVien().getMaNguoiDung(), // Assuming User has getId() method
                activity.getHinhAnh());
    }

    // UPDATE Activities SET ... WHERE activity_id = ?
    public void update(Activity activity) {
        String sql = "UPDATE Activities SET title = ?, description = ?, date_time = ?, location = ?, max_participants = ?, coordinator_id = ?, images = ? WHERE activity_id = ?";
        jdbcTemplate.update(sql,
                activity.getTieuDe(),
                activity.getMoTa(),
                activity.getNgayGio(),
                activity.getDiaDiem(),
                activity.getSoLuongToiDa(),
                activity.getDieuPhoiVien().getMaNguoiDung(), // Assuming User has getId() method
                activity.getHinhAnh(),
                activity.getMaHoatDong());
    }

    // DELETE FROM Activities WHERE activity_id = ?
    public void delete(int id) {
        String sql = "DELETE FROM Activities WHERE activity_id = ?";
        jdbcTemplate.update(sql, id);
    }
}
