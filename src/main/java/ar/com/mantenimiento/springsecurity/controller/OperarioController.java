package ar.com.mantenimiento.springsecurity.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ar.com.mantenimiento.entity.Maquina;
import ar.com.mantenimiento.entity.Proyecto;
import ar.com.mantenimiento.springsecurity.dao.impl.MaquinaDAO;
import ar.com.mantenimiento.springsecurity.dao.impl.ProyectoDAO;

@Controller
@Transactional
public class OperarioController {
	
	@Autowired
	private ProyectoDAO proyectoDAO;
	
	@Autowired
	private MaquinaDAO maquinasDAO;
	
	@RequestMapping("operario/inicio.htm")
	public ModelAndView inicioOperario(){
		
		ModelAndView mav = new ModelAndView("operario/inicio");
		List<Proyecto> proyectosByUser = proyectoDAO.getProyectosByUser("usuario");
		mav.addObject("proyectos",proyectosByUser);
		
		return mav;
		
	}
	
	
	
	@RequestMapping("operario/proyectos.htm")
	public ModelAndView proyectos(String nombreProyecto){
		
		
		//FIXME este metodo no anda
		List<Maquina> maquinas = maquinasDAO.findMaquinasByProyecto(1);
		
		
		ModelAndView mav = new ModelAndView("operario/proyectos");
		mav.addObject("maquinas",maquinas);
		
		
		
		return mav;
		
	}

}
