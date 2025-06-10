/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.service;

import com.uef.model.Notification;
import com.uef.repository.NotificationRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class NotificationService {

    @Autowired
    private NotificationRepository notificationRepository;

    public List<Notification> getAll() {
        return notificationRepository.findAll();
    }

    public Notification getById(int id) {
        return notificationRepository.findById(id);
    }

    public void add(Notification notification) {
        notificationRepository.save(notification);
    }

    public void update(Notification notification) {
        notificationRepository.update(notification);
    }

    public void delete(int id) {
        notificationRepository.delete(id);
    }
}
