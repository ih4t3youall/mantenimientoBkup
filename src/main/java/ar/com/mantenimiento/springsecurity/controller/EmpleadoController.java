package ar.com.mantenimiento.springsecurity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ar.com.mantenimiento.entity.Empleado;

@Controller
public class EmpleadoController {

	
	
@RequestMapping("admin/agregarEmpleado.htm")
public ModelAndView agregarEmpleado(){
	
	ModelAndView mav = new ModelAndView("admin/empleadoCreadoExito");
	
	
	return mav;
	
	
}


@RequestMapping("admin/formCrearEmpleado.htm")
public ModelAndView formCrearEmpleado(){
	
	ModelAndView mav = new ModelAndView("admin/formularios/formularioCrearEmpleado");
	mav.addObject("empleadoDTO",new Empleado());
	
	return mav;
	
	
}



}
