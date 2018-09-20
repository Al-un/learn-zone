package com.learn.order;

import com.learn.shared.ejb.AbstractEjb;
import javax.ejb.Stateless;

/**
 * 
 */
@Stateless
public class OrderingEjb  extends AbstractEjb<Ordering> {

    // --------------- Constructor ---------------------------------------------
    public OrderingEjb() {
        super(Ordering.class);
    }

}
