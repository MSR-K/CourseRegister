package com.javatechie.crud.example.controller;

import com.javatechie.crud.example.entity.*;
import com.javatechie.crud.example.entity.Course;
import com.javatechie.crud.example.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

@RestController
public class CourseController {

    @Autowired
    private CourseService service;
    
	
    @RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView showLoginpage(@ModelAttribute("login") LoginBean loginBean) {
		return new ModelAndView("login");

	}
	
	
	@RequestMapping(value = "/submitlogin", method = RequestMethod.POST)
	public ModelAndView checkLoginDetails(@ModelAttribute("login") LoginBean loginBean,HttpSession session, BindingResult result) {
		
		
		boolean isValidUser = service.validate(loginBean);
		if (result.hasErrors()) {
			return new ModelAndView("login");
		}
		if (!isValidUser) {
			return new ModelAndView("invalid");
		}
		session.setAttribute("username", loginBean.getUserName());
		return new ModelAndView("success","name",loginBean.getUserName());
		
	}
	@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView logout(HttpSession session) {
		session.removeAttribute("username");
		
		return new ModelAndView("logout");
		
	}
	@RequestMapping(value = "/submitCourse", method = RequestMethod.POST)
	public ModelAndView checkLoginDetails(@ModelAttribute("course") Course course, BindingResult result) {
		
		service.saveCourse(course);
		//String str="<th><td>Course ID</td><td>Course Name</td><td>Course Author</td><th>";
		List<Course> list= new ArrayList<>();
		list=service.getCourses();
		/*if(list.isEmpty())
		{
			str="<table><th><td>No Course Available</td></th>";
		}
		else
		{
			for(Course obj:list)
			{
				str+="<tr><td>"+obj.getCourseId()+"</td>"+"<td>"+obj.getCourseName()+"</td>"+"<td>"+obj.getCourseAuthor()+"</td></tr>";
			}
		}
		str+="</table>";*/
		
		return new ModelAndView("success","id1","Records are being displayed!");
		
	}
	
	@RequestMapping(value = "/delete/{CourseId}", method = RequestMethod.GET)
    public ModelAndView DeleteProduct(@PathVariable int CourseId) {
        String str=service.deleteCourse(CourseId);
        return new ModelAndView("success","id1",str);
    }
	
	@RequestMapping(value = "/edit/{CourseId}", method = RequestMethod.GET)
	public ModelAndView editCourse(@PathVariable int CourseId) {
		

		return new ModelAndView("edit","id",CourseId);
		
	}
	@RequestMapping(value = "/update/{CourseId}", method ={ RequestMethod.GET, RequestMethod.POST })
	public ModelAndView checkLoginDetails(@PathVariable int CourseId,@ModelAttribute("login") Course course, BindingResult result) {
		
		service.updateCourse(CourseId, course.getCourseName(),course.getCourseAuthor());
		
		return new ModelAndView("success","id1","Course Updated");
		
	}
	@RequestMapping(value = "/view", method = RequestMethod.GET)
    public ModelAndView ViewAll() {
		List<Course> list= new ArrayList<>();
		list=service.getCourses();
        return new ModelAndView("success","Courselist",list);
    }
	
    @PostMapping("/addProduct")
    public Course addProduct(@RequestBody Course product) {
        return service.saveCourse(product);
    }

    @PostMapping("/addProducts")
    public List<Course> addProducts(@RequestBody List<Course> products) {
        return service.saveCourses(products);
    }

    @GetMapping("/products")
    public List<Course> findAllProducts() {
        return service.getCourses();
    }

    @GetMapping("/productById/{id}")
    public Course findProductById(@PathVariable int id) {
        return service.getCourseById(id);
    }

}
