package ar.com.mantenimiento.springsecurity.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import ar.com.mantenimiento.dto.CrearEmpleadoDTO;
import ar.com.mantenimiento.entity.Empleado;
import ar.com.mantenimiento.springsecurity.dao.AbstractDao;
import ar.com.mantenimiento.springsecurity.dao.IEmpleadoDAO;

@Repository("empleadoDAO")
public class EmpleadoDAO extends AbstractDao<Integer, Empleado>implements IEmpleadoDAO {

	@Override
	public List<Empleado> findAllEmpleados() {
		
		
		List<Empleado> empleados = new ArrayList<Empleado>();
		
		
		Empleado empleado = new Empleado();
		Empleado empleado1 = new Empleado();
		Empleado empleado2 = new Empleado();
		Empleado empleado3 = new Empleado();
		
		
		empleado.setApellido("lequerica");
		empleado.setNombre("martin");
		empleado.setDni("32999599");
		empleado.setTelefono("4220929");
		empleado.setCelular("2215368476");
		empleado.setNumeroEmpleado("123123123");
		empleado.setId("1");
		empleado.setDireccion("5 numero 96 esq 34");
		
		empleado1.setApellido("nuñez");
		empleado1.setNombre("luz");
		empleado1.setDni("32923239");
		empleado1.setTelefono("4242323");
		empleado1.setCelular("2211232376");
		empleado1.setNumeroEmpleado("12634323");
		empleado1.setId("2");
		empleado1.setDireccion("2 numero 26 esq 36");
		
		empleado2.setApellido("lamas");
		empleado2.setNombre("lucas");
		empleado2.setDni("2343234");
		empleado2.setTelefono("56342345");
		empleado2.setCelular("8723787234");
		empleado2.setNumeroEmpleado("89453");
		empleado2.setId("3");
		empleado2.setDireccion("lejos");
		
		empleado3.setApellido("de leon");
		empleado3.setNombre("mauricio");
		empleado3.setDni("54243232");
		empleado3.setTelefono("34234223");
		empleado3.setCelular("25334234");
		empleado3.setNumeroEmpleado("5436345");
		empleado3.setId("4");
		empleado3.setDireccion("quin sabe");
		
		empleados.add(empleado);
		empleados.add(empleado1);
		empleados.add(empleado2);
		empleados.add(empleado3);
		
		
		
		
		return empleados;
	}
	
	@Override
	public void crearEmpleado(CrearEmpleadoDTO empleadoDTO){
		
		
		
	}
	
	
	
	

}