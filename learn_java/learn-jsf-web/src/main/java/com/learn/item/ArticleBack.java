package com.learn.item;

import com.learn.shared.jsf.AbstractBackingBean;
import com.learn.shared.jsf.Bean;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;

/**
 *
 */
@Named(value = "article")
@ViewScoped
@Bean(Bean.Type.ARTICLE)
public class ArticleBack extends AbstractBackingBean<Article> {

    // --------------- Attributes ----------------------------------------------
    @EJB
    private ArticleEjb ejb;
    
    // --------------- Getter / Setter -----------------------------------------
    @Override
    protected ArticleEjb getEjb() {
        return this.ejb;
    }

    @Override
    public void assignNewCurrent() {
        this.current = new Article();
    }

    @Override
    public Article getCurrent() {
        return super.getCurrent(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Article> getList() {
        return super.getList(); //To change body of generated methods, choose Tools | Templates.
    }

}
