package com.learn.order;

import com.learn.shared.jsf.AbstractBackingBean;
import com.learn.shared.jsf.Bean;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ViewScoped;
import javax.inject.Named;

/**
 *
 */
@Named(value = "orderitem")
@ViewScoped
@Bean(Bean.Type.ORDERITEM)
public class OrderItemBack extends AbstractBackingBean<OrderItem> {

    // --------------- Attributes ----------------------------------------------
    @EJB
    private OrderItemEjb ejb;

    // --------------- Getter / Setter -----------------------------------------
    @Override
    protected OrderItemEjb getEjb() {
        return this.ejb;
    }

    @Override
    public void assignNewCurrent() {
        this.current = new OrderItem();
    }

    @Override
    public OrderItem getCurrent() {
        return super.getCurrent(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<OrderItem> getList() {
        return super.getList(); //To change body of generated methods, choose Tools | Templates.
    }

}
