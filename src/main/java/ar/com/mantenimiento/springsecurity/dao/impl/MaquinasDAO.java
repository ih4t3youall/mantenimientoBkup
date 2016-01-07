package ar.com.mantenimiento.springsecurity.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import ar.com.mantenimiento.entity.Maquina;
import ar.com.mantenimiento.springsecurity.dao.AbstractDao;
import ar.com.mantenimiento.springsecurity.dao.IMaquinasDAO;


@Repository("maquinasDAO")
public class MaquinasDAO extends AbstractDao<Integer, Maquina>implements IMaquinasDAO {

	@Override
	public List<Maquina> findMaquinasByProyecto(int idProyecto) {

		
		
		List<Maquina> maquinas = new ArrayList<Maquina>();
		
		Maquina maquina = new Maquina();
		Maquina maquina1 = new Maquina();
		Maquina maquina2 = new Maquina();
		Maquina maquina3 = new Maquina();
		Maquina maquina4 = new Maquina();
		Maquina maquina5 = new Maquina();
		
		maquina.setDescripcion("una descripcion");
		maquina.setId(1);
		maquina.setNombre("nombre maquina");
		
		maquina1.setId(2);
		maquina1.setDescripcion("una descripcion2");
		maquina1.setNombre("nombre maquina2");
		
		maquina2.setId(3);
		maquina2.setDescripcion("una descripcion3");
		maquina2.setNombre("nombre maquina3");
		
		maquina3.setId(4);
		maquina3.setDescripcion("una descripcion4");
		maquina3.setNombre("nombre maquina4");
		
		maquina4.setId(5);
		maquina4.setDescripcion("una descripcion4");
		maquina4.setNombre("nombre maquina4");
		
		maquina5.setId(5);
		maquina5.setDescripcion("una descripcion5");
		maquina5.setNombre("nombre maquina5");
		
		maquinas.add(maquina);
		maquinas.add(maquina1);
		maquinas.add(maquina2);
		maquinas.add(maquina3);
		maquinas.add(maquina4);
		maquinas.add(maquina5);
		return maquinas;
	}

}
