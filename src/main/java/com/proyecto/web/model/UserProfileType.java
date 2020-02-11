package com.proyecto.web.model;

import java.io.Serializable;

public enum UserProfileType
        implements Serializable {
    ADMIN("PROADMIN"), JF_USER("PROJFUSER");

    String userProfileType;

    private UserProfileType(String userProfileType) {
        this.userProfileType = userProfileType;
    }

    public String getUserProfileType() {
        return this.userProfileType;
    }
}
