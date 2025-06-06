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
@Table(name = "Notifications")
public class Notification {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "notification_id")
    private Integer maThongBao; // Mã thông báo

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User nguoiDung; // Người dùng

    @ManyToOne
    @JoinColumn(name = "activity_id")
    private Activity hoatDong; // Hoạt động (có thể null)

    @Column(name = "message", nullable = false)
    private String noiDung; // Nội dung

    @Column(name = "sent_at")
    private LocalDateTime ngayGui; // Ngày gửi

    // Constructor, getters và setters
    public Notification() {
    }

    public Integer getMaThongBao() {
        return maThongBao;
    }

    public void setMaThongBao(Integer maThongBao) {
        this.maThongBao = maThongBao;
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

    public String getNoiDung() {
        return noiDung;
    }

    public void setNoiDung(String noiDung) {
        this.noiDung = noiDung;
    }

    public LocalDateTime getNgayGui() {
        return ngayGui;
    }

    public void setNgayGui(LocalDateTime ngayGui) {
        this.ngayGui = ngayGui;
    }
}
