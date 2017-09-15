package com.silab.njt.springmvc.dao.user;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.silab.njt.springmvc.dao.AbstractDao;
import com.silab.njt.springmvc.model.User;

@Repository("userDao")
public class UserDaoImpl extends AbstractDao<Long, User> implements UserDao {

	@Override
	public User findById(long id) {
		User user = getByKey(id);
		if (user != null) {
			Hibernate.initialize(user.getUserProfiles());
		}

		return user;
	}

	@Override
	public void saveUser(User user) {
		persist(user);
	}

	@Override
	@SuppressWarnings("deprecation")
	public void deleteUserById(long id) {
		Query query = getSession().createSQLQuery("DELETE from APP_USER where id = :user_id");
		query.setInteger("user_id", (int) id);
		query.executeUpdate();
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<User> findAllUsers() {
		Criteria criteria = createEntityCriteria();

		return (List<User>) criteria.list();
	}

	@Override
	public User findUserByName(String name) {
		Criteria criteria = createEntityCriteria();
		criteria.add(Restrictions.eq("username", name));
		User user = (User) criteria.uniqueResult();

		if (user != null) {
			Hibernate.initialize(user.getUserProfiles());
		}

		return user;
	}

}
