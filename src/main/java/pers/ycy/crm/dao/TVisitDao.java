package pers.ycy.crm.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import pers.ycy.crm.entity.TVisit;

import java.util.List;

@Repository
public interface TVisitDao {
	List<TVisit> getAllVisit();

	TVisit getVisitById(String vid);

	void AddVisit(@Param("vaddress") String vaddress, @Param("uvid") String uvid, @Param("cvid") String cvid, @Param("vcontent") String vcontent);

	void updateVisitById(@Param("vid") String vid, @Param("vaddress") String vaddress, @Param("uvid") String uvid, @Param("cvid") String cvid, @Param("vcontent") String vcontent);

	List<TVisit> getTVisitByName(String vaddress);

	List<TVisit> MMP(@Param("cvid") String cvid, @Param("uvid") String uvid, @Param("vaddress") String vaddress);
}
