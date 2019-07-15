package pers.ycy.crm.service;

import pers.ycy.crm.entity.TUser;

import java.util.List;

public interface TUserService {
	TUser login(String username,String password);
	List<TUser> getAllUser();


}
