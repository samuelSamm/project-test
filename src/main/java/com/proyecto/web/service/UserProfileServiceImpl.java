package com.proyecto.web.service;

import com.proyecto.web.dao.UserProfileDao;
import com.proyecto.web.model.UserProfile;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userProfileService")
@Transactional
public class UserProfileServiceImpl
        implements UserProfileService {

    @Autowired
    UserProfileDao dao;

    public UserProfile findById(int id) {
        return this.dao.findById(id);
    }

    public UserProfile findByType(String type) {
        return this.dao.findByType(type);
    }

    public List<UserProfile> findAll() {
        return this.dao.findAll();
    }
}
