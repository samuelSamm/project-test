package com.proyecto.web.dao;

import com.proyecto.web.model.User;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImpl
        extends AbstractDao<Integer, User>
        implements UserDao {

    static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);

    @Override
    public User findById(Integer id) {
        User user = (User) getByKey(id);
        if (user != null) {
            Hibernate.initialize(user.getUserProfiles());
        }
        return user;
    }

    @Override
    public User findBySSO(String sso) {
        logger.info("User : {}", sso);

        Criteria criteria = createEntityCriteria().add(Restrictions.eq("name", sso));
        User user = (User) criteria.uniqueResult();
        if (user != null) {
            Hibernate.initialize(user.getUserProfiles());
        }
        return user;
    }

    @Override
    public List<User> findAllUsers() {
        Criteria criteria = createEntityCriteria().addOrder(Order.asc("name"));
        //criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
        List<User> users = criteria.list();

        return users;
    }
    
    @Override
    public void save(User user) {
        persist(user);
    }

    @Override
    public void deleteBySSO(Integer sso) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("idUser", sso));
        User user = (User) crit.uniqueResult();
        delete(user);
    }

    @Override
    public void updateUser(User paramUser) {
        update(paramUser);
    }
}
