package ar.com.mantenimiento.springsecurity.dao;

import ar.com.mantenimiento.springsecurity.model.User;

public interface UserDao {

	User findById(int id);
	
	User findBySSO(String sso);
	
}

