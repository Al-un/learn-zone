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
@Named(value = "catalog")
@ViewScoped
@Bean(Bean.Type.CATALOG)
public class CatalogBack extends AbstractBackingBean<Catalog> {

    // --------------- Attributes ----------------------------------------------
    @EJB
    private CatalogEjb ejb;

    private Article article;

    // --------------- Getter / Setter -----------------------------------------
    @Override
    protected CatalogEjb getEjb() {
        return this.ejb;
    }

    @Override
    public void assignNewCurrent() {
        this.current = new Catalog();
    }

    @Override
    public Catalog getCurrent() {
        return super.getCurrent(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Catalog> getList() {
        return super.getList(); //To change body of generated methods, choose Tools | Templates.
    }

    // --------------- Article -------------------------------------------------
    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public void addArticleToCatalog(){
        if(this.article != null){
            getCurrent().addArticle(this.article);
        }
    }
}
