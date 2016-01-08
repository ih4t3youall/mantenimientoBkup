package ar.com.mantenimiento.springsecurity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	
	
	
	@RequestMapping("admin/adminIni")
	public ModelAndView adminIni(){
		
		ModelAndView mav = new ModelAndView("admin/adminIni");
		
		
		return mav;
		
	}
	
	
	
	
}
