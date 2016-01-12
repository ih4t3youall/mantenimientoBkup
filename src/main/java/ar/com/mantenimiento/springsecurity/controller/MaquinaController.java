package ar.com.mantenimiento.springsecurity.controller;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ar.com.mantenimiento.entity.Maquina;
import ar.com.mantenimiento.springsecurity.dao.impl.MaquinaDAO;

@Controller
@Transactional
public class MaquinaController {

	@Autowired
	private MaquinaDAO maquinaDAO;
	
	@RequestMapping("admin/formCrearMaquina.htm")
	public ModelAndView formCrearMaquina() {

		ModelAndView mav = new ModelAndView("admin/formularios/formCrearMaquina");
		mav.addObject("maquinaDTO", new Maquina());

		return mav;

	}

	
	@RequestMapping("admin/crearMaquina.htm")
	public ModelAndView crearMaquina(Maquina maquina) {

		ModelAndView mav = new ModelAndView("admin/exito/crearMaquinaExito");
		maquinaDAO.persist(maquina);
		return mav;

	}
	
}
