package ar.com.mantenimiento.springsecurity.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ar.com.mantenimiento.entity.Proyecto;
import ar.com.mantenimiento.springsecurity.dao.impl.ProyectosDAO;

@Controller
public class OperarioController {
	
	@Autowired
	private ProyectosDAO proyectosDAO;
	
	@RequestMapping("operario/inicio.htm")
	public ModelAndView inicioOperario(){
		
		ModelAndView mav = new ModelAndView("operario/inicio");
		List<Proyecto> proyectosByUser = proyectosDAO.getProyectosByUser("usuario");
		mav.addObject("proyectos",proyectosByUser);
		
		return mav;
		
	}
	
	
	
	@RequestMapping("operario/proyectos.htm")
	public ModelAndView proyectos(String nombreProyecto){
		
		ModelAndView mav = new ModelAndView("operario/proyectos");
		
		return mav;
		
	}

}
