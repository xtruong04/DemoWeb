/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import java.util.List;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "Users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Integer maNguoiDung; // Mã người dùng

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "password", nullable = false)
    private String matKhau; // Mật khẩu (đã được mã hóa)

    @Column(name = "role", nullable = false)
    private String vaiTro; // Vai trò (volunteer/coordinator)

    @Column(name = "name", nullable = false)
    private String tenNguoiDung; // Tên người dùng

    @Column(name = "phone")
    private String soDienThoai; // Số điện thoại

    @Column(name = "address")
    private String diaChi; // Địa chỉ

    @Column(name = "language_preference")
    private String ngonNguUuTien; // Ngôn ngữ ưu tiên

    @OneToMany(mappedBy = "nguoiDung", cascade = CascadeType.ALL)
    private List<Registration> danhSachDangKy; // Danh sách đăng ký

    @OneToMany(mappedBy = "nguoiDung", cascade = CascadeType.ALL)
    private List<Rating> danhSachDanhGia; // Danh sách đánh giá

    @OneToMany(mappedBy = "nguoiDung", cascade = CascadeType.ALL)
    private List<Notification> danhSachThongBao; // Danh sách thông báo

    @OneToMany(mappedBy = "dieuPhoiVien", cascade = CascadeType.ALL)
    private List<Activity> danhSachHoatDong; // Danh sách hoạt động điều phối

    // Constructor, getters và setters
    public User() {
    }

    public Integer getMaNguoiDung() {
        return maNguoiDung;
    }

    public void setMaNguoiDung(Integer maNguoiDung) {
        this.maNguoiDung = maNguoiDung;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getVaiTro() {
        return vaiTro;
    }

    public void setVaiTro(String vaiTro) {
        this.vaiTro = vaiTro;
    }

    public String getTenNguoiDung() {
        return tenNguoiDung;
    }

    public void setTenNguoiDung(String tenNguoiDung) {
        this.tenNguoiDung = tenNguoiDung;
    }

    public String getSoDienThoai() {
        return soDienThoai;
    }

    public void setSoDienThoai(String soDienThoai) {
        this.soDienThoai = soDienThoai;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getNgonNguUuTien() {
        return ngonNguUuTien;
    }

    public void setNgonNguUuTien(String ngonNguUuTien) {
        this.ngonNguUuTien = ngonNguUuTien;
    }

    public List<Registration> getDanhSachDangKy() {
        return danhSachDangKy;
    }

    public void setDanhSachDangKy(List<Registration> danhSachDangKy) {
        this.danhSachDangKy = danhSachDangKy;
    }

    public List<Rating> getDanhSachDanhGia() {
        return danhSachDanhGia;
    }

    public void setDanhSachDanhGia(List<Rating> danhSachDanhGia) {
        this.danhSachDanhGia = danhSachDanhGia;
    }

    public List<Notification> getDanhSachThongBao() {
        return danhSachThongBao;
    }

    public void setDanhSachThongBao(List<Notification> danhSachThongBao) {
        this.danhSachThongBao = danhSachThongBao;
    }

    public List<Activity> getDanhSachHoatDong() {
        return danhSachHoatDong;
    }

    public void setDanhSachHoatDong(List<Activity> danhSachHoatDong) {
        this.danhSachHoatDong = danhSachHoatDong;
    }
}

