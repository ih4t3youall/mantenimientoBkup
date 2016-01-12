package ar.com.mantenimiento.springsecurity.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import ar.com.mantenimiento.entity.AsociacionEmpleadoProyecto;
import ar.com.mantenimiento.entity.Empleado;
import ar.com.mantenimiento.entity.Proyecto;
import ar.com.mantenimiento.springsecurity.dao.impl.EmpleadoDAO;
import ar.com.mantenimiento.springsecurity.dao.impl.ProyectosDAO;

@Controller
public class EmpleadoController {

	@Autowired
	private ProyectosDAO proyectosDAO;
	
	@Autowired
	private EmpleadoDAO empleadoDAO;
	
	
	
	
	@RequestMapping("admin/agregarEmpleado.htm")
	public ModelAndView agregarEmpleado(Empleado empleadoDTO) {

		ModelAndView mav = new ModelAndView("admin/exito/empleadoCreadoExito");
		// TODO base de datos

		return mav;

	}

	@RequestMapping("admin/formCrearEmpleado.htm")
	public ModelAndView formCrearEmpleado() {

		ModelAndView mav = new ModelAndView("admin/formularios/formularioCrearEmpleado");
		mav.addObject("empleadoDTO", new Empleado());

		return mav;

	}
	
	
	@RequestMapping("admin/formAsignarEmpleado.htm")
	public ModelAndView formAsignarEmpleado(){
		
		ModelAndView mav = new ModelAndView("admin/formularios/formularioAsignarEmpleado");
		
		List<Proyecto> proyectos = proyectosDAO.findAllProyectos();
		
		List<Empleado> empleados = empleadoDAO.findAllEmpleados();
		
		
		mav.addObject("empleados",empleados);
		mav.addObject("proyectos",proyectos);
		mav.addObject("asociacionEmpleadoProyecto",new AsociacionEmpleadoProyecto());
		
		return mav;
		
	}

	
	@RequestMapping("admin/asignarEmpleado.htm")
	public ModelAndView asignarEmpleado(AsociacionEmpleadoProyecto asociacion){
		
		ModelAndView mav = new ModelAndView("admin/exito/asociacionExitosa");
		
		return mav;
		
	}
	
	
	@RequestMapping("admin/formDesAsignarEmpleado.htm")
	public ModelAndView formDesAsignarEmpleado(AsociacionEmpleadoProyecto asociacion){
		
		ModelAndView mav = new ModelAndView("admin/formularios/formularioDesAsignarEmpleado");
		List<Empleado> empleados = empleadoDAO.findAllEmpleados();
		
		mav.addObject("empleados",empleados);
		
		return mav;
		
	}
	
	
	
	
	@RequestMapping("admin/obtenerProyectosPorEmpleado.htm")
	public  @ResponseBody String obtenerProyectosPorEmpleado(int id){
		
		ModelAndView mav = new ModelAndView("admin/formularios/formularioDesAsignarEmpleado");
		
		 List<Proyecto> proyectos = proyectosDAO.findProyectsByEmpleadoId(id);
		 Gson gson = new Gson();
			String respuesta = gson.toJson(proyectos);
		
		return respuesta;
		
	}
	
	
	
}