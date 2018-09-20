package com.learn.shared.jpa;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

/**
 *
 */
@MappedSuperclass
public abstract class AbstractTimedEntity extends AbstractEntity {

    // --------------- Attributes ----------------------------------------------
    /**
     * Created datetime
     */
    @Column(name = "created")
    private LocalDateTime created;

    /**
     * Last update datetime
     */
    @Column(name = "updated")
    private LocalDateTime updated;

    // --------------- Lifecycle -----------------------------------------------
    public AbstractTimedEntity() {
        super();
        this.created = LocalDateTime.now(ZoneOffset.UTC);
    }

    // --------------- Getter / Setter -----------------------------------------
    public LocalDateTime getCreated() {
        return created;
    }

    public void setCreated(LocalDateTime created) {
        this.created = created;
    }

    public LocalDateTime getUpdated() {
        return updated;
    }

    public void setUpdated(LocalDateTime updated) {
        this.updated = updated;
    }

}
