package com.kaoshidian.common.dao.${module!};

import org.springframework.stereotype.Repository;
import com.kaoshidian.common.dao.base.HibernateBaseDao;
import com.kaoshidian.common.entity.${module!}.${classObject.className!};

@Repository
public class ${classObject.className!}DAO extends HibernateBaseDao<${classObject.className!}, Integer>{

	@Override
	public Class<${classObject.className!}> getEntityClass() {
		return ${classObject.className!}.class;
	}
}