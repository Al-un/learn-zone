package com.learn.shared.ejb;

import com.learn.shared.jpa.AbstractEntity;
import java.io.Serializable;
import java.util.List;
import javax.ejb.TransactionAttribute;
import javax.ejb.TransactionAttributeType;
import javax.ejb.TransactionManagement;
import javax.ejb.TransactionManagementType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.TypedQuery;

/**
 * ParameterizedType genericSuperclass = (ParameterizedType)
 * AbstractEjb.class.getGenericSuperclass(); entityClass = (Class<E>)
 * genericSuperclass.getActualTypeArguments()[1];
 */
/**
 * Most basic format of an EJB. An EJB is a service responsible for a single
 * entity type
 *
 * @param <E> Entity type this Service is responsible for
 */
@TransactionManagement(TransactionManagementType.CONTAINER)
@TransactionAttribute(TransactionAttributeType.REQUIRED)
public abstract class AbstractEjb<E extends AbstractEntity> implements Serializable {

    // --------------- Attributes ----------------------------------------------
    private final static long serialVersionUID = 23L;

    @PersistenceContext(unitName = "learnzone_pu", type = PersistenceContextType.TRANSACTION)
    protected EntityManager em;

    /**
     * Entity class is required for casting
     */
    private final Class<E> entityClass;

//    protected final Logger LOGGER = LoggerFactory.getLogger(getClass());
    // --------------- Constructor ---------------------------------------------
    public AbstractEjb(Class<E> entityClass) {
        this.entityClass = entityClass;
    }

    // --------------- CRUD ----------------------------------------------------
    protected EntityManager getEm() {
        return this.em;
    }

    /**
     * Persist an entity into the database
     *
     * @param entity to-be created entity
     *
     * @return now managed entity
     */
    public E create(E entity) {
        getEm().persist(entity);
        return entity;
    }

    /**
     * Merge an entity
     *
     * @param entity to-be merge entity
     *
     * @return managed copy of the merged entity
     */
    public E update(E entity) {
        return getEm().merge(entity);
    }

    /**
     * Delete an entity via the entity reference. Entity is assumed to be
     * detached
     *
     * @param entity to be deleted entity
     */
    public void delete(E entity) {
        E inDatabaseEntity = getEm().getReference(entityClass, entity.getId());
        getEm().remove(inDatabaseEntity);
    }

    /**
     * Delete with ID reference only. Use JPA delete instead of raw query for
     * relationship management
     *
     * @param id to be deleted entity primary ID
     */
    public void delete(Long id) {
        E inDatabaseEntity = getEm().getReference(entityClass, id);
        getEm().remove(inDatabaseEntity);
    }

    /**
     * Fetch an entity given its primary key
     *
     * @param id entity ID
     *
     * @return Entity whose ID matches the provided ID
     */
    public E findById(Long id) {
        return getEm().find(entityClass, id);
    }

    // --------------- Find ----------------------------------------------------
    /**
     * Turn a query into a paginated version
     *
     * @param firstResult index of the first result. Must be greater of equal 0
     * @param resultCount maximum number of results. Must be greater than 0
     *
     * @return paginated query
     *
     * @throws IllegalArgumentException firstResult or resultCount is invalid
     */
    private TypedQuery<E> paginate(TypedQuery<E> query, int firstResult, int resultCount) throws IllegalArgumentException {
        if (firstResult < 0) {
            throw new IllegalArgumentException("First result " + firstResult + " not allowed");
        }
        if (resultCount <= 0) {
            throw new IllegalArgumentException("Result count " + resultCount + " not allowed");
        }

        query.setFirstResult(firstResult);
        query.setMaxResults(resultCount);

        return query;
    }

    /**
     * @return all entities without limitation
     */
    public List<E> findAll() {
        TypedQuery<E> query = getEm().createNamedQuery(entityClass.getSimpleName() + ".findAll", entityClass);
        return query.getResultList();
    }

    /**
     * @param firstResult index of the first result
     * @param resultCount maximum number of results
     *
     * @return paginated version of all entity fetching
     */
    public List<E> findAll(int firstResult, int resultCount) {
        TypedQuery<E> query = getEm().createNamedQuery(entityClass.getSimpleName() + ".findAll", entityClass);
        query = paginate(query, firstResult, resultCount);
        return query.getResultList();
    }
}
