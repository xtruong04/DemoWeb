/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.service;

import com.uef.model.Activity;
import com.uef.repository.ActivityRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class ActivityService {

    @Autowired
    private ActivityRepository activityRepository;

    public List<Activity> getAll() {
        return activityRepository.findAll();
    }

    public Activity getById(int id) {
        return activityRepository.findById(id);
    }

    public void add(Activity activity) {
        activityRepository.save(activity);
    }

    public void update(Activity activity) {
        activityRepository.update(activity);
    }

    public void delete(int id) {
        activityRepository.delete(id);
    }
}
