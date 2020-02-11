package com.proyecto.web.converter;

import com.proyecto.web.model.UserProfile;
import com.proyecto.web.service.UserProfileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class RoleToUserProfileConverter
        implements Converter<Object, UserProfile> {

    static final Logger logger = LoggerFactory.getLogger(RoleToUserProfileConverter.class);
    @Autowired
    UserProfileService userProfileService;

    public UserProfile convert(Object element) {
        Integer id = Integer.valueOf(Integer.parseInt((String) element));
        UserProfile profile = this.userProfileService.findById(id.intValue());
        logger.info("Profile : {}", profile);
        return profile;
    }
}
