package com.learn.order;

import com.learn.shared.jpa.AbstractTimedEntity;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 *
 */
@Entity
@Table(schema = "learn", name = "t_ordering")
@SequenceGenerator(schema = "learn", name = "seqOrdering", sequenceName = "seq_ordering", allocationSize = 1)
@NamedQuery(name = "Ordering.findAll", query = "SELECT c FROM Ordering c")
public class Ordering extends AbstractTimedEntity {

    // --------------- Attributes ----------------------------------------------
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seqOrdering")
    private Long id;

    /**
     * Ordered articles of this ordering
     */
    @OneToMany(mappedBy = "ordering")
    private List<OrderItem> orderItems;

    // --------------- Constructor ---------------------------------------------
    public Ordering() {
        super();
        this.orderItems = new ArrayList<>();
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

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public void addOrderItem(OrderItem orderItem) {
        this.orderItems.add(orderItem);
    }

    public void removeOrderItem(OrderItem orderItem) {
        this.orderItems.remove(orderItem);
    }
}
