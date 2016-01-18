package ar.com.mantenimiento.springsecurity.controller;

import javax.transaction.Transactional;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ar.com.mantenimiento.dto.FormDTO;
import ar.com.mantenimiento.dto.MaquinaDTO;
import ar.com.mantenimiento.dto.MaquinaProyectoIdDTO;
import ar.com.mantenimiento.entity.Empresa;
import ar.com.mantenimiento.entity.Form;
import ar.com.mantenimiento.entity.Maquina;
import ar.com.mantenimiento.entity.Proyecto;
import ar.com.mantenimiento.springsecurity.dao.impl.EmpresaDAO;
import ar.com.mantenimiento.springsecurity.dao.impl.FormDAO;
import ar.com.mantenimiento.springsecurity.dao.impl.MaquinaDAO;
import ar.com.mantenimiento.springsecurity.dao.impl.ProyectoDAO;

@Controller
@Transactional
public class CheckListController {

	@Autowired
	private ProyectoDAO proyectoDAO;
	
	
	@Autowired
	private EmpresaDAO empresaDAO;
	
	@Autowired
	private Mapper dozerMapper;
	
	@Autowired
	private MaquinaDAO maquinaDAO;
	
	@Autowired
	private FormDAO  formDAO;
	
	@RequestMapping("operario/getCheckListById.htm")
//	public ModelAndView getCheckListById(int maquinaId,int proyectoId){
		public ModelAndView getCheckListById(MaquinaProyectoIdDTO maquinaProyectoId){
		
		ModelAndView mav =  new ModelAndView("operario/checklist/checklist");
		
		Proyecto proyecto = proyectoDAO.findProyectoByProyectId(maquinaProyectoId.getProyectoId());
		mav.addObject("proyecto",proyecto);
		
		
		Empresa empresa = empresaDAO.findEmpresaByProyectId(maquinaProyectoId.getProyectoId());
		mav.addObject("empresa",empresa);
		
		Form form = formDAO.findFormByMaquinaId(maquinaProyectoId.getMaquinaId());
		FormDTO formDTO = dozerMapper.map(form, FormDTO.class);
		
		Maquina maquina = maquinaDAO.findMaquinaById(maquinaProyectoId.getMaquinaId());
		MaquinaDTO maquinaDTO = dozerMapper.map(maquina, MaquinaDTO.class);
		
		mav.addObject("maquina",maquinaDTO);
		
		mav.addObject("form",formDTO);
		
		
		return mav;
		
	}
	
	
	
}
