/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.service;

import com.uef.model.Rating;
import com.uef.repository.RatingRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class RatingService {

    @Autowired
    private RatingRepository ratingRepository;

    public List<Rating> getAll() {
        return ratingRepository.findAll();
    }

    public Rating getById(int id) {
        return ratingRepository.findById(id);
    }

    public void add(Rating rating) {
        ratingRepository.save(rating);
    }

    public void update(Rating rating) {
        ratingRepository.update(rating);
    }

    public void delete(int id) {
        ratingRepository.delete(id);
    }
}
