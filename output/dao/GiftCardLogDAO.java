package com.kaoshidian.common.dao.;

import org.springframework.stereotype.Repository;
import com.kaoshidian.common.dao.base.HibernateBaseDao;
import com.kaoshidian.common.entity..GiftCardLog;

@Repository
public class GiftCardLogDAO extends HibernateBaseDao<GiftCardLog, Integer>{

	@Override
	public Class<GiftCardLog> getEntityClass() {
		return GiftCardLog.class;
	}
}