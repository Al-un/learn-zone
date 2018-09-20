package com.learn.shared.jsf;

import com.learn.shared.ejb.AbstractEjb;
import com.learn.shared.jpa.AbstractEntity;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;
import javax.annotation.PostConstruct;

/**
 *
 * @param <E> entity type the backing bean is responsible for
 */
public abstract class AbstractBackingBean<E extends AbstractEntity> implements Serializable {

    // --------------- Attributes ----------------------------------------------
    /**
     * All or paginated entities
     */
    protected Map<Long, E> entities;

    /**
     * Currently editing entity
     */
    protected E current;

    /**
     * When a primary key is provided by a parameter
     */
    private Long id;

    // --------------- Constructor ---------------------------------------------
    public AbstractBackingBean() {
        this.entities = new HashMap<>();
    }

    @PostConstruct
    public void init() {
        this.entities = findAll();
        assignNewCurrent();
    }

    // --------------- CRUD ----------------------------------------------------
    /**
     * Convenient method to either create or update depending on current entity
     * primary key
     */
    public void save() {
        if (this.current.getId() == null) {
            create();
        }
        else {
            update();
        }
    }

    /**
     * Persist new entity
     */
    public void create() {
        current = getEjb().create(current);
        entities.put(current.getId(), current);
    }

    /**
     * Update an existing entity
     */
    public void update() {
        current = getEjb().update(current);

        // check if in map
        entities.computeIfPresent(current.getId(), (key, oldValue) -> current);
    }

    /**
     * Delete an existing entity
     *
     * @param entity to be deleted entity
     */
    public void delete(E entity) {
        getEjb().delete(entity);
        entities.remove(entity.getId());
        current = null;
    }

    // --------------- Getter / Setter -----------------------------------------
    protected abstract <F extends AbstractEjb<E>> F getEjb();

    public List<E> getList() {
        List<E> list = new ArrayList<>();
        list.addAll(entities.values());
        return list;
    }

    public E getCurrent() {
        return current;
    }

    public void setCurrent(E current) {
        this.current = current;
    }

    public void assignCurrent(E entity) {
        this.current = entity;
    }

    public abstract void assignNewCurrent();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void loadById() {
        if (this.id != null) {
            this.current = findById(this.id);
        }
    }

    // --------------- Find ----------------------------------------------------
    protected Map<Long, E> findAll() {
        return getEjb().findAll().stream().collect(Collectors.toMap(
                E::getId,
                Function.identity(),
                (a, b) -> b,
                HashMap::new));
    }

    public E findById(Long id) {
        return getEjb().findById(id);
    }

}
