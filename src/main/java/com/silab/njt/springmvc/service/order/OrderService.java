package com.silab.njt.springmvc.service.order;

import com.silab.njt.springmvc.model.order.Order;

import java.util.List;

public interface OrderService {

    List<Order> findAllReservationsForCourt(int id);

    void addReservation(Order order);

    void saveOrderFrontEnd(Order order);
}
