/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.service;

import com.uef.model.Registration;
import com.uef.repository.RegistrationRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class RegistrationService {

    @Autowired
    private RegistrationRepository registrationRepository;

    public List<Registration> getAll() {
        return registrationRepository.findAll();
    }

    public Registration getById(int id) {
        return registrationRepository.findById(id);
    }

    public void add(Registration registration) {
        registrationRepository.save(registration);
    }

    public void update(Registration registration) {
        registrationRepository.update(registration);
    }

    public void delete(int id) {
        registrationRepository.delete(id);
    }
}
