package com.silab.njt.springmvc.controller.order;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.silab.njt.springmvc.model.User;
import com.silab.njt.springmvc.model.order.Order;
import com.silab.njt.springmvc.service.court.CourtService;
import com.silab.njt.springmvc.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;
    @Autowired
    private CourtService courtService;

    @RequestMapping("/backend/orders")
    public String allOrdersPage(ModelMap model) {
        model.addAttribute("allCourts", courtService.findAllCourts());

        return "backend-order-page";
    }

    @RequestMapping("/backend/order/reservations/{id}")
    public String addOrderPage(@PathVariable long id, ModelMap model) {
        model.addAttribute("allReservations", orderService.findAllReservationsForCourt((int) id));

        return "backend-order-page-add";
    }

    @RequestMapping(value = "/json/add-new-order", method = RequestMethod.POST)
    public ResponseEntity<Order> addOrderFrontend(@RequestBody Order order) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = new User();
        user.setUsername(authentication.getName());
        order.setReservedBy(user);

        orderService.saveOrderFrontEnd(order);

        return new ResponseEntity<>(HttpStatus.OK);
    }
}
