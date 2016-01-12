package ar.com.mantenimiento.springsecurity.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ar.com.mantenimiento.entity.Maquina;
import ar.com.mantenimiento.entity.Proyecto;
import ar.com.mantenimiento.springsecurity.dao.impl.MaquinaDAO;
import ar.com.mantenimiento.springsecurity.dao.impl.ProyectoDAO;
import ar.com.mantenimiento.utility.GsonUtility;

@Controller
@Transactional
public class AjaxController {

	@Autowired
	private ProyectoDAO proyectosDAO;
	@Autowired
	private MaquinaDAO maquinasDAO;
	@Autowired
	private GsonUtility gsonUtility;

	@RequestMapping("admin/ajaxProyectosEmpresa.htm")
	public @ResponseBody String ajaxProyectosEmpresa(int idEmpresa) {

		ModelAndView mav = new ModelAndView("admin/formularios/templateFormulario");
		// fin proyectos pro empresa
		 List<Proyecto> proyectos = proyectosDAO.findProyectosByEmpresaId(idEmpresa);

		String respuesta = gsonUtility.getGson().toJson(proyectos);
		return respuesta;

	}

	@RequestMapping("admin/ajaxMaquinasProyectos.htm")
	public @ResponseBody String ajaxMaquinasProyectos(int idProyecto) {

		// fin proyectos pro empresa
		List<Maquina> maquinas = maquinasDAO.findMaquinasByProyecto(1);

		
		String respuesta = gsonUtility.getGson().toJson(maquinas);
		

		return respuesta;

	}
	
	
	

}
