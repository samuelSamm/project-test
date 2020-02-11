package com.proyecto.web.service;

import com.proyecto.web.model.User;
import java.util.List;

public abstract interface UserService {

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
    public abstract void saveUser(User paramUser);
    /**
     * 
     * @param paramUser 
     */
    public abstract void updateUser(User paramUser);
    /**
     * 
     * @param param
     */
    public abstract void deleteUserBySSO(Integer param);
    /**
     * 
     * @return 
     */
    public abstract List<User> findAllUsers();
}
