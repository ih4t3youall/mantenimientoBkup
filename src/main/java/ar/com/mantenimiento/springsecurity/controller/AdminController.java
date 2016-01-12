package ar.com.mantenimiento.springsecurity.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ar.com.mantenimiento.entity.Empresa;
import ar.com.mantenimiento.springsecurity.dao.impl.EmpresaDAO;
import ar.com.mantenimiento.springsecurity.dao.impl.FormDAO;

@Controller
@Transactional
public class AdminController {

	@Autowired
	private FormDAO formDAO;

	@Autowired
	private EmpresaDAO empresaDAO;

	@RequestMapping("admin/adminIni")
	public ModelAndView adminIni() {

		ModelAndView mav = new ModelAndView("admin/adminIni");

		return mav;

	}

	// @RequestMapping("admin/formularioCrearFormulario.htm")
	// public ModelAndView formCrearFormulario(){
	//
	// ModelAndView mav = new
	// ModelAndView("admin/formularios/formularioCrearFormulario");
	//
	// mav.addObject("formDTO",new Form());
	//
	// return mav;
	// }

	// @RequestMapping("admin/crearFormulario.htm")
	// public ModelAndView crearFormulario(Form formDTO){
	//
	// ModelAndView mav = new ModelAndView("");
	//
	// formDAO.persist(formDTO);
	//
	// return mav;
	// }

	@RequestMapping("admin/templateFormulario.htm")
	public ModelAndView templateFormulario() {

		
		ModelAndView mav = new ModelAndView("admin/formularios/templateFormulario");
		List<Empresa> empresas = empresaDAO.findAllEmpresas();
		mav.addObject("empresas", empresas);

		return mav;

	}
	
	
	@RequestMapping("admin/getTemplateFormulario.htm")
	public @ResponseBody ModelAndView getTemplateFormulario(int idMaquina) {
		
		ModelAndView mav = new ModelAndView("admin/formularios/getTemplateFormulario");
		
		
		return mav;
		
		
		
	}
	



}
