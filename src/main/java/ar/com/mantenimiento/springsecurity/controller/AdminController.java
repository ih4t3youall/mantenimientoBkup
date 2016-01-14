package ar.com.mantenimiento.springsecurity.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.transaction.Transactional;

import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ar.com.mantenimiento.dto.EmpresaDTO;
import ar.com.mantenimiento.dto.MaquinaDTO;
import ar.com.mantenimiento.dto.ProyectoDTO;
import ar.com.mantenimiento.entity.Empresa;
import ar.com.mantenimiento.entity.Form;
import ar.com.mantenimiento.entity.FormItem;
import ar.com.mantenimiento.entity.Maquina;
import ar.com.mantenimiento.entity.Proyecto;
import ar.com.mantenimiento.springsecurity.dao.impl.EmpresaDAO;
import ar.com.mantenimiento.springsecurity.dao.impl.FormDAO;
import ar.com.mantenimiento.utility.GsonUtility;

@Controller
@Transactional
public class AdminController {

	@Autowired
	private FormDAO formDAO;

	@Autowired
	private EmpresaDAO empresaDAO;

	@Autowired
	private Mapper dozerMapper;

	@Autowired
	private GsonUtility gsonUtility;

	@RequestMapping("admin/adminIni")
	public ModelAndView adminIni() {

		ModelAndView mav = new ModelAndView("admin/adminIni");

		return mav;

	}

	// arma los options
	@RequestMapping("admin/templateFormulario.htm")
	public ModelAndView templateFormulario() {

		ModelAndView mav = new ModelAndView("admin/formularios/templateFormulario");

		return mav;

	}

	@RequestMapping("admin/getEmpresas.htm")
	public @ResponseBody String getEmpresas() {
		
		List<Empresa> empresas = empresaDAO.findAllEmpresas();
		List<EmpresaDTO> empresasDTO = convertToDTO(empresas);
		
		String json = gsonUtility.getGson().toJson(empresasDTO);

		return json;

	}

	private List<EmpresaDTO> convertToDTO(List<Empresa> empresas) {
		List<EmpresaDTO> empresasDTO = new ArrayList<EmpresaDTO>();

		for (Empresa empresa : empresas) {

			EmpresaDTO empresaDTO = dozerMapper.map(empresa, EmpresaDTO.class);

			empresasDTO.add(empresaDTO);
		}

		return empresasDTO;

	}

	// arma el formulario donde se agregan los campos del checklist
	@RequestMapping("admin/getTemplateFormulario.htm")
	public @ResponseBody ModelAndView getTemplateFormulario(int idEmpresa, int idProyecto, int idMaquina) {

		ModelAndView mav = new ModelAndView("admin/formularios/getTemplateFormulario");
		Form form = new Form();
		form.setMaquina(new Maquina());

		return mav;

	}

	// submit del segundo formulario
	@RequestMapping("admin/submitTemplateFormulario.htm")
	public @ResponseBody ModelAndView submitTemplateFormulario(String camposFormulario, int idMaquina) {

		ModelAndView mav = new ModelAndView("admin/exito/formularioCreadoConExtio");

		List<FormItem> formItems = convertStringToList(camposFormulario);
		// magia de guardar esto y bla bla

		return mav;

	}

	private List<FormItem> convertStringToList(String texto) {

		List<FormItem> lista = new ArrayList<FormItem>();
		StringTokenizer st = new StringTokenizer(texto, "");
		while (st.hasMoreTokens()) {
			FormItem it = new FormItem();
			it.setLabel(st.nextToken());
			lista.add(it);
		}
		return lista;

	}

}
