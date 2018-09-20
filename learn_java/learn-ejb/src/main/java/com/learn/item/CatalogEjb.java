package com.learn.item;

import com.learn.shared.ejb.AbstractEjb;
import javax.ejb.Stateless;

/**
 *
 */
@Stateless
public class CatalogEjb extends AbstractEjb<Catalog> {

    // --------------- Constructor ---------------------------------------------
    public CatalogEjb() {
        super(Catalog.class);
    }

}
