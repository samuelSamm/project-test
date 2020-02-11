package com.proyecto.web.dao;

import com.proyecto.web.model.UserProfile;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

@Repository("userProfileDao")
public class UserProfileDaoImpl
        extends AbstractDao<Integer, UserProfile>
        implements UserProfileDao {

    public UserProfile findById(int id) {
        return (UserProfile) getByKey(Integer.valueOf(id));
    }

    public UserProfile findByType(String type) {
        Criteria crit = createEntityCriteria();
        crit.add(Restrictions.eq("descriptionProfile", type));
        return (UserProfile) crit.uniqueResult();
    }

    public List<UserProfile> findAll() {
        Criteria crit = createEntityCriteria();
        crit.addOrder(Order.asc("descriptionProfile"));
        return crit.list();
    }
}
