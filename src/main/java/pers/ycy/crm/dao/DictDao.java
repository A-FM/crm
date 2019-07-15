package pers.ycy.crm.dao;

import org.springframework.stereotype.Repository;
import pers.ycy.crm.entity.Dict;

import java.util.List;

@Repository
public interface DictDao {
	List<Dict> getAllDict();
}
