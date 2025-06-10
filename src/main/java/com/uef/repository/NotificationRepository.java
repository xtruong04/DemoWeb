/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.repository;

import com.uef.model.Notification;
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
public class NotificationRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private Notification mapRow(ResultSet rs, int rowNum) throws SQLException {
        Notification notification = new Notification();
        notification.setMaThongBao(rs.getInt("notification_id"));
        notification.setNoiDung(rs.getString("message"));
        notification.setNgayGui(rs.getObject("sent_at", LocalDateTime.class));
        // User and Activity are not mapped here; they require separate queries or joins
        return notification;
    }

    public List<Notification> findAll() {
        String sql = "SELECT * FROM Notifications";
        return jdbcTemplate.query(sql, this::mapRow);
    }

    public Notification findById(int id) {
        String sql = "SELECT * FROM Notifications WHERE notification_id = ?";
        return jdbcTemplate.queryForObject(sql, this::mapRow, id);
    }

    public void save(Notification notification) {
        String sql = "INSERT INTO Notifications (user_id, activity_id, message, sent_at) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                notification.getNguoiDung().getMaNguoiDung(),
                (notification.getHoatDong() != null) ? notification.getHoatDong().getMaHoatDong() : null,
                notification.getNoiDung(),
                notification.getNgayGui());
    }

    public void update(Notification notification) {
        String sql = "UPDATE Notifications SET user_id = ?, activity_id = ?, message = ?, sent_at = ? WHERE notification_id = ?";
        jdbcTemplate.update(sql,
                notification.getNguoiDung().getMaNguoiDung(),
                (notification.getHoatDong() != null) ? notification.getHoatDong().getMaHoatDong() : null,
                notification.getNoiDung(),
                notification.getNgayGui(),
                notification.getMaThongBao());
    }

    public void delete(int id) {
        String sql = "DELETE FROM Notifications WHERE notification_id = ?";
        jdbcTemplate.update(sql, id);
    }
}
