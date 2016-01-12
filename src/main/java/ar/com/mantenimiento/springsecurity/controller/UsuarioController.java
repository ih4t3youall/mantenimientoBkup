package ar.com.mantenimiento.springsecurity.controller;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ar.com.mantenimiento.entity.Empresa;
import ar.com.mantenimiento.springsecurity.dao.impl.EmpresaDAO;

@Controller
@Transactional
public class UsuarioController {

	
	
	@Autowired
	private EmpresaDAO empresaDAO;
	
	@RequestMapping("user/userIni.htm")
	public ModelAndView inicioUsuario(){
		
		ModelAndView mav = new ModelAndView("user/userIni");
		
		List<Empresa> empresas = empresaDAO.findAllEmpresas();
		
		List<Empresa> columnaA = new ArrayList<Empresa>(); 
		List<Empresa> columnaB = new ArrayList<Empresa>();
		
		boolean flag = true;
		
		for (Empresa empresa : empresas) {
			
			if(flag){
				
				columnaA.add(empresa);
				flag = false;
				
			}else {
				
				columnaB.add(empresa);
				flag = true;
				
			}
			
			
			
		}
		
		mav.addObject("empresa",new Empresa());
		mav.addObject("columnaA",columnaA);
		mav.addObject("columnaB",columnaB);
		
		
		return mav;
		
	}
	
	
	@RequestMapping("user/miEmpresa.htm")
	public ModelAndView empresaSeleccionada(Empresa empresaDTO){
		ModelAndView mav =  new ModelAndView("user/miEmpresa");
		Empresa empresa = empresaDAO.finEmpresaById(empresaDTO.getId());
		
		//TODO
		//no se como seguir depende de como organicemos las empresas
		mav.addObject("empresa",empresa);
		
		return mav;
		
	}
	
	
	
	
}
