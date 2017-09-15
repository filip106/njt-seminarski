package com.silab.njt.springmvc.dao.order;


import com.silab.njt.springmvc.model.order.Order;

import java.util.List;

public interface OrderDao {

    List<Order> findAllReservationsForCourt(Integer id);

    void addReservation(Order order);
}
