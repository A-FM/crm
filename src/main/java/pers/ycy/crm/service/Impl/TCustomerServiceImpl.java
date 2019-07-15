package pers.ycy.crm.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ycy.crm.dao.TCustomerDao;
import pers.ycy.crm.entity.CustomerEx;
import pers.ycy.crm.entity.TCustomer;
import pers.ycy.crm.service.TCustomerService;

import java.util.List;

@Service
public class TCustomerServiceImpl implements TCustomerService {

	@Autowired
	TCustomerDao tCustomerDao;


	@Override
	public void AddCustomer(String custName, String custSource, String custPhone, String custMobile, String custLevel) {
		tCustomerDao.AddCustomer(custName,custSource,custPhone,custMobile,custLevel);
	}

	@Override
	public List<TCustomer> GetAllCustomer() {
		return tCustomerDao.QueryAllCustomer();
	}

	@Override
	public void DeletedCustomer(int id) {
		tCustomerDao.DeletedCustomer(id);
	}

	@Override
	public TCustomer getCustomerById(int id) {
		return tCustomerDao.getCustomerById(id);
	}

	@Override
	public List<TCustomer> getCustomerByName(String custName) {
		return tCustomerDao.getCustomerByName(custName);
	}

	@Override
	public void UpdateCustomer(int cid, String custName, String custSource, String custPhone, String custMobile, String custLevel) {
		tCustomerDao.UpdateCustomer(cid,custName,custSource,custPhone,custMobile,custLevel);
	}

	@Override
	public List<TCustomer> QueryCustomerInfo(String custName, String custSource, String custLevel) {
		return tCustomerDao.QueryCustomerInfo(custName,custSource,custLevel);
	}

	@Override
	public List<CustomerEx> CustomerSource() {
		return tCustomerDao.CustomerSource();
	}

	@Override
	public List<CustomerEx> CustomerLevel() {
		return tCustomerDao.CustomerLevel();
	}

}
