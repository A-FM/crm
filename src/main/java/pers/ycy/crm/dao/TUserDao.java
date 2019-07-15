package pers.ycy.crm.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import pers.ycy.crm.entity.TUser;

import java.util.List;

@Repository
public interface TUserDao {
	TUser getByUsernameAndPassword(@Param("username")String username, @Param("password")String password);
	List<TUser> getAllUser();
}
