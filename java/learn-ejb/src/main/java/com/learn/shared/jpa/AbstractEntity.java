package com.learn.shared.jpa;

import java.io.Serializable;
import java.util.Objects;
import javax.persistence.MappedSuperclass;

/**
 *
 */
@MappedSuperclass
public abstract class AbstractEntity implements Serializable {

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

    // --------------- Equals --------------------------------------------------
    @Override
    public boolean equals(Object obj) {
        if(obj == null){
            return false;
        }
        if(!getClass().equals(obj.getClass())){
            return false;
        }
        
        AbstractEntity other = (AbstractEntity) obj;
        return Objects.equals(getId(), other.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }

}
