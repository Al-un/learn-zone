package com.learn.order;

import com.learn.shared.ejb.AbstractEjb;
import javax.ejb.Stateless;

/**
 *
 */
@Stateless
public class OrderItemEjb extends AbstractEjb<OrderItem> {

    // --------------- Constructor ---------------------------------------------
    public OrderItemEjb() {
        super(OrderItem.class);
    }

}
