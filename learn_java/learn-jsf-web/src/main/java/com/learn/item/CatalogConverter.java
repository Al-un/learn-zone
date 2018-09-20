package com.learn.item;

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
@FacesConverter(value = "catalogConverter")
public class CatalogConverter extends AbstractIdConverter<Catalog> {

    @EJB
    private CatalogEjb service;

    @Override
    protected CatalogEjb getService() {
        return service;
    }
}