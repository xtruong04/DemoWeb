/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.repository;

import com.uef.model.User;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ADMIN
 */
@Repository
public class UserRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private User mapRow(ResultSet rs, int rowNum) throws SQLException {
        User user = new User();
        user.setMaNguoiDung(rs.getInt("user_id"));
        user.setEmail(rs.getString("email"));
        user.setMatKhau(rs.getString("password"));
        user.setVaiTro(rs.getString("role"));
        user.setTenNguoiDung(rs.getString("name"));
        user.setSoDienThoai(rs.getString("phone"));
        user.setDiaChi(rs.getString("address"));
        user.setNgonNguUuTien(rs.getString("language_preference"));
        return user;
    }

    public List<User> findAll() {
        String sql = "SELECT * FROM Users";
        return jdbcTemplate.query(sql, this::mapRow);
    }

    public User findById(int id) {
        String sql = "SELECT * FROM Users WHERE user_id = ?";
        return jdbcTemplate.queryForObject(sql, this::mapRow, id);
    }

    public void save(User user) {
        String sql = "INSERT INTO Users (email, password, role, name, phone, address, language_preference) VALUES (?, ?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql,
                user.getEmail(),
                user.getMatKhau(),
                user.getVaiTro(),
                user.getTenNguoiDung(),
                user.getSoDienThoai(),
                user.getDiaChi(),
                user.getNgonNguUuTien());
    }

    public void update(User user) {
        String sql = "UPDATE Users SET email = ?, password = ?, role = ?, name = ?, phone = ?, address = ?, language_preference = ? WHERE user_id = ?";
        jdbcTemplate.update(sql,
                user.getEmail(),
                user.getMatKhau(),
                user.getVaiTro(),
                user.getTenNguoiDung(),
                user.getSoDienThoai(),
                user.getDiaChi(),
                user.getNgonNguUuTien(),
                user.getMaNguoiDung());
    }

    public void delete(int id) {
        String sql = "DELETE FROM Users WHERE user_id = ?";
        jdbcTemplate.update(sql, id);
    }
}
