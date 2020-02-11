package com.proyecto.web.dao;

import com.proyecto.web.model.User;
import java.util.List;

public abstract interface UserDao {

    /**
     * 
     * @param param
     * @return 
     */
    public abstract User findById(Integer param);
    /**
     * 
     * @param param
     * @return 
     */
    public abstract User findBySSO(String param);
    /**
     * 
     * @param paramUser 
     */
    public abstract void save(User paramUser);
    /**
     * 
     * @param paramUser 
     */
    public abstract void updateUser(User paramUser);
    /**
     * 
     * @param param
     */
    public abstract void deleteBySSO(Integer param);
    /**
     * 
     * @return 
     */
    public abstract List<User> findAllUsers();
}
