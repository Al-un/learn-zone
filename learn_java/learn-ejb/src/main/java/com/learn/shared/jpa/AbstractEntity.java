package com.learn.shared.jpa;

import java.io.Serializable;
import javax.persistence.MappedSuperclass;

/**
 * 
 */
@MappedSuperclass
public abstract class AbstractEntity implements Serializable{

    // --------------- Attributes ----------------------------------------------
    private final static long serialVersionUID = 156456315463L;
    
    // --------------- Getter / Setter -----------------------------------------
    /**
     * @return entity ID
     */
    public abstract Long getId();

    /**
     * @param id entity new ID
     */
    public abstract void setId(Long id);
}
