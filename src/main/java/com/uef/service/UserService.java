/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.service;

import com.uef.model.User;
import com.uef.repository.UserRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public List<User> getCoordinators() {
    return userRepository.findAll().stream()
        .filter(user -> "coordinator".equalsIgnoreCase(user.getVaiTro()))
        .toList(); // hoặc .collect(Collectors.toList()) nếu dùng Java 8
    }
    
    public List<User> getAll() {
        return userRepository.findAll();
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    public User getById(int id) {
        return userRepository.findById(id);
    }

    public void add(User user) {
        userRepository.save(user);
    }

    public void update(User user) {
        userRepository.update(user);
    }

    public void delete(int id) {
        userRepository.delete(id);
    }
}
