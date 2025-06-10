/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.repository;

import com.uef.model.Registration;
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
        // User and Activity are not mapped here; they require separate queries or joins
        return registration;
    }

    public List<Registration> findAll() {
        String sql = "SELECT * FROM Registrations";
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
