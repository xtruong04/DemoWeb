/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.repository;

import com.uef.model.Activity;
import com.uef.model.Notification;
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
public class NotificationRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private Notification mapRow(ResultSet rs, int rowNum) throws SQLException {
        Notification notification = new Notification();
        notification.setMaThongBao(rs.getInt("notification_id"));
        notification.setNoiDung(rs.getString("message"));
        notification.setNgayGui(rs.getObject("sent_at", LocalDateTime.class));

        // Gán người dùng
        User user = new User();
        user.setMaNguoiDung(rs.getInt("u_id"));
        user.setTenNguoiDung(rs.getString("u_name"));
        user.setEmail(rs.getString("u_email"));
        user.setVaiTro(rs.getString("u_role"));
        user.setSoDienThoai(rs.getString("u_phone"));
        user.setDiaChi(rs.getString("u_address"));
        user.setNgonNguUuTien(rs.getString("u_lang"));
        notification.setNguoiDung(user);

        // Gán hoạt động nếu có
        int activityId = rs.getInt("a_id");
        if (!rs.wasNull()) {
            Activity activity = new Activity();
            activity.setMaHoatDong(activityId);
            activity.setTieuDe(rs.getString("a_title"));
            activity.setMoTa(rs.getString("a_description")); // tùy bạn có dùng không
            notification.setHoatDong(activity);
        }

        return notification;
    }

    public List<Notification> findAll() {
        String sql
                = "SELECT n.*, "
                + "       u.user_id AS u_id, u.name AS u_name, u.email AS u_email, u.role AS u_role, "
                + "       u.phone AS u_phone, u.address AS u_address, u.language_preference AS u_lang, "
                + "       a.activity_id AS a_id, a.title AS a_title, a.description AS a_description "
                + "FROM Notifications n "
                + "JOIN Users u ON n.user_id = u.user_id "
                + "LEFT JOIN Activities a ON n.activity_id = a.activity_id";
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
