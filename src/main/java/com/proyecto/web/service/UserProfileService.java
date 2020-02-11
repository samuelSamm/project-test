package com.proyecto.web.service;

import com.proyecto.web.model.UserProfile;
import java.util.List;

public abstract interface UserProfileService {

    public abstract UserProfile findById(int paramInt);

    public abstract UserProfile findByType(String paramString);

    public abstract List<UserProfile> findAll();
}
