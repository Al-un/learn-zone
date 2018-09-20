package com.learn.item;

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
@FacesConverter(value = "articleConverter")
public class ArticleConverter extends AbstractIdConverter<Article> {

    @EJB
    private ArticleEjb service;

    @Override
    protected ArticleEjb getService() {
        return service;
    }
}
