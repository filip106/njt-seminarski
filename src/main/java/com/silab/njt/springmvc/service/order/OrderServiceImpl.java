package com.silab.njt.springmvc.service.order;

import com.silab.njt.springmvc.dao.order.OrderDao;
import com.silab.njt.springmvc.dao.partner.PartnerDao;
import com.silab.njt.springmvc.dao.user.UserDao;
import com.silab.njt.springmvc.model.order.Order;
import com.silab.njt.springmvc.model.order.OrderStatus;
import com.silab.njt.springmvc.model.partner.Partner;
import com.silab.njt.springmvc.service.UserService;
import com.silab.njt.springmvc.service.court.CourtService;
import com.silab.njt.springmvc.service.partner.PartnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("orderService")
@Transactional
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;
    @Autowired
    private UserService userService;
    @Autowired
    private CourtService courtService;

    @Override
    public List<Order> findAllReservationsForCourt(int id) {
        return orderDao.findAllReservationsForCourt(id);
    }

    @Override
    public void addReservation(Order order) {
        orderDao.addReservation(order);
    }

    @Override
    public void saveOrderFrontEnd(Order order) {
        order.setOrderStatus(OrderStatus.PENDING);
        order.setCourt(courtService.findById(order.getCourt().getId()));
        order.setReservedBy(userService.findByUsername(order.getReservedBy().getUsername()));
        orderDao.addReservation(order);
    }
}
