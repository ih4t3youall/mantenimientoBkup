package ar.com.mantenimiento.springsecurity.dao.impl;

import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import ar.com.mantenimiento.entity.Form;
import ar.com.mantenimiento.springsecurity.dao.AbstractDao;
import ar.com.mantenimiento.springsecurity.dao.IFormDAO;

@Repository("formDAO")
@Transactional 
public class FormDAO extends AbstractDao<Integer, Form>implements IFormDAO  {

}
