package ar.com.mantenimiento.springsecurity.dao;

import java.util.List;

import ar.com.mantenimiento.entity.Proyecto;

public interface IProyectosDAO {

	
	public List<Proyecto> getProyectosByUser(String nombre);
	public List<Proyecto> findAllProyectos();
	public List<Proyecto> findProyectsByEmpleadoId(int id);
	public List<Proyecto> findProyectosByEmpresaId(int idEmpresa);
	
}
