/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.repository;

import com.uef.model.Activity;
import com.uef.model.Registration;
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
public class RegistrationRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private Registration mapRow(ResultSet rs, int rowNum) throws SQLException {
        Registration registration = new Registration();
        registration.setMaDangKy(rs.getInt("registration_id"));
        registration.setNgayDangKy(rs.getObject("registration_date", LocalDateTime.class));
        registration.setTrangThaiCheckIn(rs.getBoolean("check_in_status"));

        // Gán thông tin người dùng
        User user = new User();
        user.setMaNguoiDung(rs.getInt("u_id"));
        user.setTenNguoiDung(rs.getString("u_name"));
        user.setEmail(rs.getString("u_email"));
        user.setVaiTro(rs.getString("u_role"));
        user.setSoDienThoai(rs.getString("u_phone"));
        user.setDiaChi(rs.getString("u_address"));
        user.setNgonNguUuTien(rs.getString("u_lang"));
        registration.setNguoiDung(user);

        // Gán thông tin hoạt động (nếu có)
        int activityId = rs.getInt("a_id");
        if (!rs.wasNull()) {
            Activity activity = new Activity();
            activity.setMaHoatDong(activityId);
            activity.setTieuDe(rs.getString("a_title"));
            activity.setMoTa(rs.getString("a_description"));
            registration.setHoatDong(activity);
        }

        return registration;
    }

    public List<Registration> findAll() {
        String sql
                = "SELECT r.*, "
                + "       u.user_id AS u_id, u.name AS u_name, u.email AS u_email, u.role AS u_role, "
                + "       u.phone AS u_phone, u.address AS u_address, u.language_preference AS u_lang, "
                + "       a.activity_id AS a_id, a.title AS a_title, a.description AS a_description "
                + "FROM Registrations r "
                + "JOIN Users u ON r.user_id = u.user_id "
                + "LEFT JOIN Activities a ON r.activity_id = a.activity_id";

        return jdbcTemplate.query(sql, this::mapRow);
    }

    public Registration findById(int id) {
        String sql = "SELECT * FROM Registrations WHERE registration_id = ?";
        return jdbcTemplate.queryForObject(sql, this::mapRow, id);
    }

    public void save(Registration registration) {
        String sql = "INSERT INTO Registrations (user_id, activity_id, registration_date, check_in_status) VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                registration.getNguoiDung().getMaNguoiDung(),
                registration.getHoatDong().getMaHoatDong(),
                registration.getNgayDangKy(),
                registration.getTrangThaiCheckIn());
    }

    public void update(Registration registration) {
        String sql = "UPDATE Registrations SET user_id = ?, activity_id = ?, registration_date = ?, check_in_status = ? WHERE registration_id = ?";
        jdbcTemplate.update(sql,
                registration.getNguoiDung().getMaNguoiDung(),
                registration.getHoatDong().getMaHoatDong(),
                registration.getNgayDangKy(),
                registration.getTrangThaiCheckIn(),
                registration.getMaDangKy());
    }

    public void delete(int id) {
        String sql = "DELETE FROM Registrations WHERE registration_id = ?";
        jdbcTemplate.update(sql, id);
    }
}
