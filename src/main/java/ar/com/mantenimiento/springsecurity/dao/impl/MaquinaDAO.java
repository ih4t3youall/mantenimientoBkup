package ar.com.mantenimiento.springsecurity.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import ar.com.mantenimiento.entity.Maquina;
import ar.com.mantenimiento.springsecurity.dao.AbstractDao;
import ar.com.mantenimiento.springsecurity.dao.IMaquinaDAO;

@Repository("maquinaDAO")
public class MaquinaDAO extends AbstractDao<Integer, Maquina>implements IMaquinaDAO {

	@Override
	public Maquina findMaquinaById(int idMaquina) {
		
		Criteria crit = createEntityCriteria();
		crit.add(Restrictions.eq("id", idMaquina));
		return (Maquina) crit.uniqueResult();
		
		
		
	}
	

	@Override
	public List<Maquina> findMaquinasByProyecto(int idProyecto) {

		
		//FIXME
//		getSession().createQuery("select *  from maquina_has_proyecto ");
//		return (List<Maquina>) crit.list();
		
		
		
		return null;
		
	}
}
