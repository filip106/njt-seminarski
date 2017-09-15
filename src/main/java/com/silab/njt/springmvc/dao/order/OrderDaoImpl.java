package com.silab.njt.springmvc.dao.order;

import com.silab.njt.springmvc.dao.AbstractDao;
import com.silab.njt.springmvc.dao.partner.PartnerDao;
import com.silab.njt.springmvc.model.order.Order;
import com.silab.njt.springmvc.model.partner.Partner;
import com.silab.njt.springmvc.service.order.OrderService;
import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("orderDao")
public class OrderDaoImpl extends AbstractDao<Long, Order> implements OrderDao {

    @Override
    @SuppressWarnings("unchecked")
    public List<Order> findAllReservationsForCourt(Integer id) {
        Criteria criteria = createEntityCriteria();
//        criteria.add(Restrictions.eq("court", id.longValue()));

        return (List<Order>) criteria.list();
    }

    @Override
    public void addReservation(Order order) {
        persist(order);
    }
}
