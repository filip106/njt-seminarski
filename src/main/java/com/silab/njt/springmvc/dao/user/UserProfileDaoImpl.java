package com.silab.njt.springmvc.dao.user;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.silab.njt.springmvc.dao.AbstractDao;
import com.silab.njt.springmvc.model.UserProfile;

@Repository("userProfileDao")
public class UserProfileDaoImpl extends AbstractDao<Integer, UserProfile> implements UserProfileDao {

	@Override
	public UserProfile findById(int id) {
		return getByKey(id);
	}

	@Override
	public UserProfile findByType(String type) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("type", type));

		return (UserProfile) criteria.uniqueResult();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<UserProfile> findAll() {
		Criteria criteria = createEntityCriteria();
		criteria.addOrder(Order.asc("type"));

		return (List<UserProfile>) criteria.list();
	}

}
