package pers.ycy.crm.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ycy.crm.dao.TUserDao;
import pers.ycy.crm.entity.TUser;
import pers.ycy.crm.service.TUserService;

import java.util.List;

@Service
public class TUserServiceImpl implements TUserService {

	@Autowired
	private TUserDao tUserDao;

	@Override
	public TUser login(String username, String password) {
		return tUserDao.getByUsernameAndPassword(username,password);
	}

	@Override
	public List<TUser> getAllUser() {
		return tUserDao.getAllUser();
	}
}
