package com.learn.order;

import com.learn.item.Article;
import com.learn.shared.jpa.AbstractTimedEntity;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 */
@Entity
@Table(schema = "learn", name = "t_order_item")
@SequenceGenerator(schema = "learn", name = "seqOrderItem", sequenceName = "seq_order_item", allocationSize = 1)
@NamedQuery(name = "OrderItem.findAll", query = "SELECT c FROM OrderItem c")
public class OrderItem extends AbstractTimedEntity {

    // --------------- Attributes ----------------------------------------------
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seqOrderItem")
    private Long id;

    /**
     * referenced article
     */
    @ManyToOne
    @JoinColumn(name = "article_id", referencedColumnName = "id")
    private Article article;

    /**
     * referenced ordering
     */
    @ManyToOne
    @JoinColumn(name = "ordering_id", referencedColumnName = "id")
    private Ordering ordering;

    // --------------- Constructor ---------------------------------------------
    public OrderItem() {
        super();
    }

    public OrderItem(Article article, Ordering ordering) {
        this();
        this.article = article;
        this.ordering = ordering;
    }

    // --------------- Getter / Setter -----------------------------------------
    @Override
    public Long getId() {
        return id;
    }

    @Override
    public void setId(Long id) {
        this.id = id;
    }

    public Article getArticle() {
        return article;
    }

    public void setArticle(Article article) {
        this.article = article;
    }

    public Ordering getOrdering() {
        return ordering;
    }

    public void setOrdering(Ordering ordering) {
        this.ordering = ordering;
    }

}
