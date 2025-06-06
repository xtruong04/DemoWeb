/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import java.time.LocalDateTime;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "Registrations")
public class Registration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "registration_id")
    private Integer maDangKy; // Mã đăng ký

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User nguoiDung; // Người dùng

    @ManyToOne
    @JoinColumn(name = "activity_id", nullable = false)
    private Activity hoatDong; // Hoạt động

    @Column(name = "registration_date")
    private LocalDateTime ngayDangKy; // Ngày đăng ký

    @Column(name = "check_in_status", nullable = false)
    private Boolean trangThaiCheckIn; // Trạng thái check-in

    // Constructor, getters và setters
    public Registration() {
    }

    public Integer getMaDangKy() {
        return maDangKy;
    }

    public void setMaDangKy(Integer maDangKy) {
        this.maDangKy = maDangKy;
    }

    public User getNguoiDung() {
        return nguoiDung;
    }

    public void setNguoiDung(User nguoiDung) {
        this.nguoiDung = nguoiDung;
    }

    public Activity getHoatDong() {
        return hoatDong;
    }

    public void setHoatDong(Activity hoatDong) {
        this.hoatDong = hoatDong;
    }

    public LocalDateTime getNgayDangKy() {
        return ngayDangKy;
    }

    public void setNgayDangKy(LocalDateTime ngayDangKy) {
        this.ngayDangKy = ngayDangKy;
    }

    public Boolean getTrangThaiCheckIn() {
        return trangThaiCheckIn;
    }

    public void setTrangThaiCheckIn(Boolean trangThaiCheckIn) {
        this.trangThaiCheckIn = trangThaiCheckIn;
    }
}
