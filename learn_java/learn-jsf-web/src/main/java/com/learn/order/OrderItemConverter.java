package com.learn.order;

import com.learn.shared.jsf.AbstractIdConverter;
import javax.ejb.EJB;
import javax.faces.bean.RequestScoped;
import javax.faces.convert.FacesConverter;
import javax.inject.Named;

/**
 * 
 */
@Named
@RequestScoped
@FacesConverter(value = "orderItemConverter")
public class OrderItemConverter extends AbstractIdConverter<OrderItem> {

    @EJB
    private OrderItemEjb service;

    @Override
    protected OrderItemEjb getService() {
        return service;
    }
}