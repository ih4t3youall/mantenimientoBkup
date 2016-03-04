package ar.com.mantenimiento.springsecurity.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ar.com.mantenimiento.entity.Empresa;
import ar.com.mantenimiento.springsecurity.dao.impl.EmpresaDAO;
import ar.com.mantenimiento.springsecurity.dao.impl.UserDao;
import ar.com.mantenimiento.springsecurity.model.User;

@Controller
@Transactional
public class UsuarioController {

	
	@Autowired
	@Qualifier("customUserDetailsService")
	UserDetailsService userDetailsService;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private EmpresaDAO empresaDAO;
	
	private User user ;
	
	@RequestMapping("user/userIni.htm")
	public ModelAndView inicioUsuario(Principal principal){
		
		ModelAndView mav = new ModelAndView("user/userIni");
		
		String username = principal.getName();
		
		User user = userDao.findBySSO(username);
		this.user = user;
		
		
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
		mav.addObject("empresa_id",user.getEmpresa_id());
		
		
		return mav;
		
	}
	
	
	
	
	@RequestMapping("user/miEmpresa.htm")
	public ModelAndView empresaSeleccionada(Empresa empresaDTO){
		ModelAndView mav =  new ModelAndView();
		Empresa empresa = empresaDAO.finEmpresaById(empresaDTO.getId());
		

		//controla del lado del servidor que tenga acceso ya que el javascript es hackeable
		
		if(empresaDTO.getId() == user.getEmpresa_id()){
//		mav.setViewName("user/miEmpresa");
		mav.setViewName("user/cPanel/cPanelIndex");
		mav.addObject("empresa",empresa);
		
		return mav;
		}else{
			mav.setViewName("error/errorGenerico");
			mav.addObject("mensaje", "Se produjo un error.");
			mav.addObject("url","userIni.htm");
			
			return mav;
			
			
		}
		
	}
	
	@RequestMapping("user/cpanelIndex")
	public ModelAndView cPanelIndex(){
		
		ModelAndView mav = new ModelAndView("user/cPanel/cPanelIndex");
		
		return mav;
		
	}
	
	
	
	
}
