package com.learn.item;

import com.learn.shared.jpa.AbstractTimedEntity;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 *
 */
@Entity
@Table(schema = "learn", name = "t_catalog")
@SequenceGenerator(schema = "learn", name = "seqCatalog", sequenceName = "seq_catalog", allocationSize = 1)
@NamedQuery(name = "Catalog.findAll", query = "SELECT c FROM Catalog c")
public class Catalog extends AbstractTimedEntity {

    // --------------- Attributes ----------------------------------------------
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seqCatalog")
    private Long id;

    /**
     * name
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
     * Articles of this catalogue
     */
    @ManyToMany
    @JoinTable(schema = "learn", name = "t_catalog_article",
            joinColumns = @JoinColumn(name = "catalog_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "article_id", referencedColumnName = "id"))
    private List<Article> articles;

    // --------------- Constructor ---------------------------------------------
    public Catalog() {
        super();
        this.articles = new ArrayList<>();
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

    public List<Article> getArticles() {
        return articles;
    }

    public void setArticles(List<Article> articles) {
        this.articles = articles;
    }

    public void addArticle(Article article) {
        this.articles.add(article);
    }

    public void removeArticle(Article article) {
        this.articles.remove(article);
    }
}
