package ar.com.mantenimiento.springsecurity.dao;

import java.util.List;

import ar.com.mantenimiento.entity.Proyecto;

public interface IProyectosDAO {

	
	public List<Proyecto> getProyectosByUser(String nombre);
	public List<Proyecto> findAllProyectos();
	List<Proyecto> findProyectsByEmpleadoId(int id);
	
}
