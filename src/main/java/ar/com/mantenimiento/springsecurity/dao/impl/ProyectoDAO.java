package ar.com.mantenimiento.springsecurity.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import ar.com.mantenimiento.entity.Empresa;
import ar.com.mantenimiento.entity.Proyecto;
import ar.com.mantenimiento.springsecurity.dao.AbstractDao;
import ar.com.mantenimiento.springsecurity.dao.IProyectosDAO;

@Repository("proyectosDAO")
public class ProyectoDAO extends AbstractDao<Integer, Proyecto>implements IProyectosDAO {

	@Override
	public List<Proyecto> getProyectosByUser(String nombre) {

		List<Proyecto> proyectos = new ArrayList<Proyecto>();

		Proyecto proyecto = new Proyecto();

		proyecto.setId(1);
		proyecto.setNombre("ypf mantenimient");
		proyecto.setDescripcion("ypf mantenimiento");

		Proyecto proyecto1 = new Proyecto();

		proyecto1.setId(2);
		proyecto1.setNombre("techint mantenimiento");
		proyecto1.setDescripcion("techint mantenimiento");

		proyectos.add(proyecto);
		proyectos.add(proyecto1);

		return proyectos;
	}

	@Override
	public List<Proyecto> findAllProyectos() {
		
		List<Proyecto> proyectos = getAll(Proyecto.class);
	
		return proyectos;
	}
	
	@Override
	public Proyecto findProyectoByProyectId(int proyectoId){
	
		
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("id", proyectoId));
		Object uniqueResult = crit.uniqueResult();
		return (Proyecto)uniqueResult;
		
	}
	
	
	@Override
	public List<Proyecto> findProyectosByEmpresaId(int idEmpresa) {

		Criteria crit = createEntityCriteria();
		Empresa empresa = new Empresa();
		empresa.setId(idEmpresa);
		
		crit.add(Restrictions.eq("empresa.id", idEmpresa));
		List list = (List<Proyecto>)crit.list();
		
		return list;
		
	}

}
