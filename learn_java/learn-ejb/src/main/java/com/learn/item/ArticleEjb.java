package com.learn.item;

import com.learn.shared.ejb.AbstractEjb;
import javax.ejb.Stateless;

/**
 *
 */
@Stateless
public class ArticleEjb extends AbstractEjb<Article> {

    // --------------- Constructor ---------------------------------------------
    public ArticleEjb() {
        super(Article.class);
    }

}
