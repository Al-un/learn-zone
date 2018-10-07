package com.learn.order;

import com.learn.shared.jsf.AbstractBackingBean;
import com.learn.shared.jsf.Bean;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;

/**
 *
 */
@Named(value = "ordering")
@ViewScoped
@Bean(Bean.Type.ORDERING)
public class OrderingBack extends AbstractBackingBean<Ordering> {

    // --------------- Attributes ----------------------------------------------
    @EJB
    private OrderingEjb ejb;

    // --------------- Getter / Setter -----------------------------------------
    @Override
    protected OrderingEjb getEjb() {
        return this.ejb;
    }

    @Override
    public void assignNewCurrent() {
        this.current = new Ordering();
    }

    @Override
    public Ordering getCurrent() {
        return super.getCurrent(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Ordering> getList() {
        return super.getList(); //To change body of generated methods, choose Tools | Templates.
    }

}
