package com.learn.order;

import com.learn.shared.jsf.AbstractIdConverter;
import javax.ejb.EJB;
import javax.enterprise.context.RequestScoped;
import javax.faces.convert.FacesConverter;
import javax.inject.Named;

/**
 *
 */
@Named
@RequestScoped
@FacesConverter(value = "orderingConverter")
public class OrderingConverter extends AbstractIdConverter<Ordering> {

    @EJB
    private OrderingEjb service;

    @Override
    protected OrderingEjb getService() {
        return service;
    }
}
