package com.proyecto.web.dao;

import java.io.Serializable;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public abstract class AbstractDao<PK extends Serializable, T> {

    private final Class<T> persistentClass;
    @Autowired
    private SessionFactory sessionFactory;

    public AbstractDao() {
        this.persistentClass = ((Class) ((java.lang.reflect.ParameterizedType) getClass().getGenericSuperclass()).getActualTypeArguments()[1]);
    }

    protected Session getSession() {
        return this.sessionFactory.getCurrentSession();
    }

    public T getByKey(PK key) {
        return (T) getSession().get(this.persistentClass, key);
    }

    public void persist(T entity) {
        getSession().persist(entity);
    }

    public void update(T entity) {
        getSession().update(entity);
    }

    public void delete(T entity) {
        getSession().delete(entity);
    }

    protected Criteria createEntityCriteria() {
        return getSession().createCriteria(this.persistentClass);
    }
}
