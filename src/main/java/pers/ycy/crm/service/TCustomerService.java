package pers.ycy.crm.service;

import org.apache.ibatis.annotations.Param;
import pers.ycy.crm.entity.CustomerEx;
import pers.ycy.crm.entity.TCustomer;

import java.util.List;

public interface TCustomerService {
	public void AddCustomer(String custName, String custSource, String custPhone, String custMobile, String custLevel);

	List<TCustomer> GetAllCustomer();

	void DeletedCustomer(int id);

	TCustomer getCustomerById(int id);

	List<TCustomer> getCustomerByName(String custName);

	void UpdateCustomer(int cid, String custName, String custSource, String custPhone, String custMobile, String custLevel);

	List<TCustomer> QueryCustomerInfo(String custName, String custSource, String custLevel);

	List<CustomerEx> CustomerSource();

	List<CustomerEx> CustomerLevel();

}
