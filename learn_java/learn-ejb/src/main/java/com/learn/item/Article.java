package com.learn.item;

import com.learn.shared.jpa.AbstractTimedEntity;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 */
@Entity
@Table(schema = "learn", name = "t_article")
@SequenceGenerator(schema = "learn", name = "seqArticle", sequenceName = "seq_article", allocationSize = 1)
@NamedQuery(name = "Article.findAll", query = "SELECT a FROM Article a")
public class Article extends AbstractTimedEntity {

    // --------------- Attributes ----------------------------------------------
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seqArticle")
    private Long id;

    /**
     * TODO: test uniqueness TODO: handle bean validation
     */
    @Column(name = "name")
    @NotNull
    private String name;

    /**
     * Optional description
     */
    @Column(name = "description")
    private String description;
    
    /**
     * Catalogues this article belongs to
     */
    @ManyToMany(mappedBy = "articles")
    private List<Catalog> catalogs;

    // --------------- Constructor ---------------------------------------------
    public Article() {
        super();
        this.catalogs=new ArrayList<>();
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

}
