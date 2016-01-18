package ar.com.mantenimiento.springsecurity.controller;

import javax.transaction.Transactional;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Transactional
public class EPPController {
	
	
	@RequestMapping("formAgregarEPP.htm")
	public ModelAndView formAgregarEPP(){
		
		ModelAndView mav = new ModelAndView("admin/formularios/formularioAgregarEPP");
		
		
		return mav;
		
		
	}
	

}
