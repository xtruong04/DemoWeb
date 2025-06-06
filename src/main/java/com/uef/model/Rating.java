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
@Table(name = "Ratings")
public class Rating {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rating_id")
    private Integer maDanhGia; // Mã đánh giá

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User nguoiDung; // Người dùng

    @ManyToOne
    @JoinColumn(name = "activity_id", nullable = false)
    private Activity hoatDong; // Hoạt động

    @Column(name = "rating", nullable = false)
    private Integer diemDanhGia; // Điểm đánh giá (1-5)

    @Column(name = "comment")
    private String binhLuan; // Bình luận

    @Column(name = "created_at")
    private LocalDateTime ngayTao; // Ngày tạo

    // Constructor, getters và setters
    public Rating() {
    }

    public Integer getMaDanhGia() {
        return maDanhGia;
    }

    public void setMaDanhGia(Integer maDanhGia) {
        this.maDanhGia = maDanhGia;
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

    public Integer getDiemDanhGia() {
        return diemDanhGia;
    }

    public void setDiemDanhGia(Integer diemDanhGia) {
        this.diemDanhGia = diemDanhGia;
    }

    public String getBinhLuan() {
        return binhLuan;
    }

    public void setBinhLuan(String binhLuan) {
        this.binhLuan = binhLuan;
    }

    public LocalDateTime getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(LocalDateTime ngayTao) {
        this.ngayTao = ngayTao;
    }
}
