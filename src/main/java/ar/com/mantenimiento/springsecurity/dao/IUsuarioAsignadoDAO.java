package ar.com.mantenimiento.springsecurity.dao;

import java.util.List;

import ar.com.mantenimiento.entity.Proyecto;

public interface IUsuarioAsignadoDAO {

	List<Proyecto> finAssignamentsFromUser(String nombreEmpleado);

	
	
	
	
}
