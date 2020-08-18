package com.javatechie.crud.example.service;

import com.javatechie.crud.example.entity.Course;
import com.javatechie.crud.example.entity.LoginBean;
import com.javatechie.crud.example.repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {
    @Autowired
    private CourseRepository repository;

    public Course saveCourse(Course course) {
        return repository.save(course);
    }

    public List<Course> saveCourses(List<Course> courses) {
        return repository.saveAll(courses);
    }

    public List<Course> getCourses() {
        return repository.findAll();
    }

    public Course getCourseById(int id) {
        return repository.findById(id).orElse(null);
    }

    

    public String deleteCourse(int id) {
        repository.deleteById(id);
        return "Course removed with CourseId :" + id;
    }

    public Course updateCourse(int id,String name, String author) {
        Course existingcourse = repository.findById(id).orElse(null);
        existingcourse.setCourseName(name);
        existingcourse.setCourseAuthor(author);
      
        return repository.save(existingcourse);
    }

public boolean validate(LoginBean bean)	{
		
		return (bean.getUserName().equals(bean.getPassword()));
		
	}
}
