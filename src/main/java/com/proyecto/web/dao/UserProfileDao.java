package com.proyecto.web.dao;

import com.proyecto.web.model.UserProfile;
import java.util.List;

public abstract interface UserProfileDao {

    public abstract List<UserProfile> findAll();

    public abstract UserProfile findByType(String paramString);

    public abstract UserProfile findById(int paramInt);
}
