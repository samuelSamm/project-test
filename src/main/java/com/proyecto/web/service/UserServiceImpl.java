package com.proyecto.web.service;

import com.proyecto.web.dao.UserDao;
import com.proyecto.web.dao.UserProfileDao;
import com.proyecto.web.model.User;
import com.proyecto.web.model.UserProfile;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userService")
@Transactional
public class UserServiceImpl
        implements UserService {

    @Autowired
    private UserDao dao;
    
    @Autowired
    private UserProfileDao profileDao;
    
    @Override
    public User findById(Integer id) {
        return this.dao.findById(id);
    }

    @Override
    public void saveUser(User user) {
        Set<UserProfile> profiles = new HashSet<>();
        UserProfile perfil = new UserProfile();
        perfil.setIdProfile(1);
        profiles.add(perfil);
        user.setUserProfiles(profiles);
        this.dao.save(user);
    }

    @Override
    public void updateUser(User user) {
        this.dao.updateUser(user);
    }

    @Override
    public void deleteUserBySSO(Integer sso) {
        this.dao.deleteBySSO(sso);
    }

    @Override
    public List<User> findAllUsers() {
        return this.dao.findAllUsers();
    }

    @Override
    public User findBySSO(String param) {
       return this.dao.findBySSO(param);
    }
}
