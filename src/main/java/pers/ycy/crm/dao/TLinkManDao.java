package pers.ycy.crm.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import pers.ycy.crm.entity.TLinkMan;

import java.util.List;

@Repository
public interface TLinkManDao {

	List<TLinkMan> getAllLinkMan();

	TLinkMan getLinkManById(String linkid);

	List<TLinkMan> getLinkManByName(String LinkName);

	void addLinkMan(@Param("linkName") String linkName, @Param("linkGender") String linkGender, @Param("linkPhone") String linkPhone, @Param("linkMobile") String linkMobile, @Param("clid") String clid);

	void updateLinkManById(@Param("linkid") String linkid, @Param("linkName") String linkName, @Param("linkGender") String linkGender, @Param("linkPhone") String linkPhone, @Param("linkMobile") String linkMobile, @Param("clid") String clid);

	List<TLinkMan> getLinkManByLinkNameAndClid(@Param("linkName")String linkName,@Param("clid")String clid);
}
