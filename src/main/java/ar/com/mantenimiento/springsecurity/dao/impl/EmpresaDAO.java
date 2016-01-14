package ar.com.mantenimiento.springsecurity.dao.impl;

import java.util.LinkedList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import ar.com.mantenimiento.entity.Empresa;
import ar.com.mantenimiento.springsecurity.dao.AbstractDao;
import ar.com.mantenimiento.springsecurity.dao.IEmpresasDAO;

@Repository("empresaDAO")
public class EmpresaDAO extends AbstractDao<Integer, Empresa>implements IEmpresasDAO {


	
	
	@Override
	public List<Empresa> findAllEmpresas() {

		List<Empresa> empresas = new LinkedList<Empresa>();
		
		empresas = getAll(Empresa.class);
		return empresas;
	}

	@Override
	public Empresa finEmpresaById(int id) {
		

		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("id", id));
		return (Empresa) crit.uniqueResult();
		
		
	}

}