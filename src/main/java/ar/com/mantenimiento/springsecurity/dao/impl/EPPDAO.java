package ar.com.mantenimiento.springsecurity.dao.impl;

import org.springframework.stereotype.Repository;

import ar.com.mantenimiento.entity.Epp;
import ar.com.mantenimiento.springsecurity.dao.AbstractDao;
import ar.com.mantenimiento.springsecurity.dao.IEPPDAO;

@Repository("EPPDAO")
public class EPPDAO extends AbstractDao<Integer, Epp> implements IEPPDAO{

}
