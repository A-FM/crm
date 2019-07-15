package pers.ycy.crm.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import pers.ycy.crm.entity.CustomerEx;
import pers.ycy.crm.entity.TCustomer;

import java.util.List;

@Repository
public interface TCustomerDao {
	void AddCustomer(@Param("custName") String custName, @Param("custSource") String custSource, @Param("custPhone") String custPhone, @Param("custMobile") String custMobile, @Param("custLevel") String custLevel);

	List<TCustomer> QueryAllCustomer();

	void DeletedCustomer(int id);

	TCustomer getCustomerById(int id);

	List<TCustomer> getCustomerByName(String custName);

	void UpdateCustomer(@Param("cid") int cid, @Param("custName") String custName, @Param("custSource") String custSource, @Param("custPhone") String custPhone, @Param("custMobile") String custMobile, @Param("custLevel") String custLevel);

	List<TCustomer> QueryCustomerInfo(@Param("custName") String custName, @Param("custSource") String custSource, @Param("custLevel") String custLevel);

	List<CustomerEx> CustomerSource();

	List<CustomerEx> CustomerLevel();
}
