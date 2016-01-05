package ar.com.mantenimiento.springsecurity.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import ar.com.mantenimiento.entity.Proyecto;
import ar.com.mantenimiento.springsecurity.dao.AbstractDao;
import ar.com.mantenimiento.springsecurity.dao.IProyectosDAO;
@Repository("proyectosDAO")
public class ProyectosDAO extends AbstractDao<Integer, Proyecto>implements IProyectosDAO {

	@Override
	public List<Proyecto> getProyectosByUser(String nombre) {

		List<Proyecto> proyectos = new ArrayList<Proyecto>();

		Proyecto proyecto = new Proyecto();

		proyecto.setId(1);
		proyecto.setNombre("nombre");
		proyecto.setDescripcion("descripcion 1");

		Proyecto proyecto1 = new Proyecto();

		proyecto1.setId(1);
		proyecto1.setNombre("nombre");
		proyecto1.setDescripcion("descripcion 2");

		proyectos.add(proyecto);
		proyectos.add(proyecto1);
		
		return proyectos;
	}

}
