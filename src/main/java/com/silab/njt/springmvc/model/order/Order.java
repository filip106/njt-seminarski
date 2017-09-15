package com.silab.njt.springmvc.model.order;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.silab.njt.springmvc.AttributeConverter.LocalDateTimeConverter;
import com.silab.njt.springmvc.model.User;
import com.silab.njt.springmvc.model.court.Court;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "RESERVATION")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "START")
    @Convert(converter = LocalDateTimeConverter.class)
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    private LocalDateTime start;

    @Column(name = "END")
    @Convert(converter = LocalDateTimeConverter.class)
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    private LocalDateTime end;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "COURT_ID", referencedColumnName = "id")
    private Court court;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "USER_RESERVED_BY_ID", referencedColumnName = "id")
    private User reservedBy;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "USER_APPROVED_ID", referencedColumnName = "id")
    private User approvedBy;

    @Enumerated(EnumType.STRING)
    @Column(name = "ORDER_STATUS")
    private OrderStatus orderStatus;

    public long getId() {
        return id;
    }

    public Order setId(long id) {
        this.id = id;
        return this;
    }

    public LocalDateTime getStart() {
        return start;
    }

    public Order setStart(LocalDateTime start) {
        this.start = start;
        return this;
    }

    public LocalDateTime getEnd() {
        return end;
    }

    public Order setEnd(LocalDateTime end) {
        this.end = end;
        return this;
    }

    public Court getCourt() {
        return court;
    }

    public Order setCourt(Court court) {
        this.court = court;
        return this;
    }

    public User getReservedBy() {
        return reservedBy;
    }

    public Order setReservedBy(User reservedBy) {
        this.reservedBy = reservedBy;
        return this;
    }

    public User getApprovedBy() {
        return approvedBy;
    }

    public Order setApprovedBy(User approvedBy) {
        this.approvedBy = approvedBy;
        return this;
    }

    public OrderStatus getOrderStatus() {
        return orderStatus;
    }

    public Order setOrderStatus(OrderStatus orderStatus) {
        this.orderStatus = orderStatus;
        return this;
    }
}
