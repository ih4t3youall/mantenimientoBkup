package ar.com.mantenimiento.springsecurity.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import ar.com.mantenimiento.entity.Maquina;
import ar.com.mantenimiento.entity.Proyecto;
import ar.com.mantenimiento.springsecurity.dao.impl.MaquinasDAO;
import ar.com.mantenimiento.springsecurity.dao.impl.ProyectosDAO;

@Controller
public class AjaxController {

	@Autowired
	private ProyectosDAO proyectosDAO;
	@Autowired
	private MaquinasDAO maquinasDAO;

	@RequestMapping("admin/ajaxProyectosEmpresa.htm")
	public @ResponseBody String ajaxProyectosEmpresa(int idEmpresa) {

		ModelAndView mav = new ModelAndView("admin/formularios/templateFormulario");
		//fin proyectos pro empresa
		List<Proyecto> proyectos = proyectosDAO.findAllProyectos();

		Gson gson = new Gson();
		String respuesta = gson.toJson(proyectos);

		return respuesta;

	}
	
	
	
	
	@RequestMapping("admin/ajaxMaquinasProyectos.htm")
	public @ResponseBody String ajaxMaquinasProyectos(int idProyecto) {

		ModelAndView mav = new ModelAndView("admin/formularios/templateFormulario");
		//fin proyectos pro empresa
		List<Maquina> maquinas = maquinasDAO.findMaquinasByProyecto(1);

		Gson gson = new Gson();
		String respuesta = gson.toJson(maquinas);

		return respuesta;

	}
	
	
	

}
