package com.javatechie.crud.example.repository;

import com.javatechie.crud.example.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;
@Component
public interface CourseRepository extends JpaRepository<Course,Integer> {
    
}

