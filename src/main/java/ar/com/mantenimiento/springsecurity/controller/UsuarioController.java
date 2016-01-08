package ar.com.mantenimiento.springsecurity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UsuarioController {

	@RequestMapping("user/userIni.htm")
	public ModelAndView inicioUsuario(){
		
		ModelAndView mav = new ModelAndView("user/userIni");
		return mav;
		
	}
	
}
