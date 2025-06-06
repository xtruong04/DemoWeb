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
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import jakarta.servlet.Registration;
import java.time.LocalDateTime;
import java.util.List;
import javax.management.Notification;

/**
 *
 * @author ADMIN
 */
@Entity
@Table(name = "Activities")
public class Activity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "activity_id")
    private Integer maHoatDong; // Mã hoạt động

    @Column(name = "title", nullable = false)
    private String tieuDe; // Tiêu đề

    @Column(name = "description")
    private String moTa; // Mô tả

    @Column(name = "date_time", nullable = false)
    private LocalDateTime ngayGio; // Ngày giờ

    @Column(name = "location")
    private String diaDiem; // Địa điểm

    @Column(name = "max_participants", nullable = false)
    private Integer soLuongToiDa; // Số lượng tối đa

    @ManyToOne
    @JoinColumn(name = "coordinator_id", nullable = false)
    private User dieuPhoiVien; // Điều phối viên

    @Column(name = "images")
    private String hinhAnh; // Hình ảnh (URL AWS S3)

    @OneToMany(mappedBy = "hoatDong", cascade = CascadeType.ALL)
    private List<Registration> danhSachDangKy; // Danh sách đăng ký

    @OneToMany(mappedBy = "hoatDong", cascade = CascadeType.ALL)
    private List<Rating> danhSachDanhGia; // Danh sách đánh giá

    @OneToMany(mappedBy = "hoatDong", cascade = CascadeType.ALL)
    private List<Notification> danhSachThongBao; // Danh sách thông báo

    // Constructor, getters và setters
    public Activity() {}

    public Integer getMaHoatDong() {
        return maHoatDong;
    }

    public void setMaHoatDong(Integer maHoatDong) {
        this.maHoatDong = maHoatDong;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public LocalDateTime getNgayGio() {
        return ngayGio;
    }

    public void setNgayGio(LocalDateTime ngayGio) {
        this.ngayGio = ngayGio;
    }

    public String getDiaDiem() {
        return diaDiem;
    }

    public void setDiaDiem(String diaDiem) {
        this.diaDiem = diaDiem;
    }

    public Integer getSoLuongToiDa() {
        return soLuongToiDa;
    }

    public void setSoLuongToiDa(Integer soLuongToiDa) {
        this.soLuongToiDa = soLuongToiDa;
    }

    public User getDieuPhoiVien() {
        return dieuPhoiVien;
    }

    public void setDieuPhoiVien(User dieuPhoiVien) {
        this.dieuPhoiVien = dieuPhoiVien;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
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
}
