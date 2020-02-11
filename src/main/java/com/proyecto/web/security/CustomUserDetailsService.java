package com.proyecto.web.security;

import com.proyecto.web.model.UserProfile;
import com.proyecto.web.service.UserService;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("customUserDetailsService")
public class CustomUserDetailsService
        implements UserDetailsService {

    static final Logger logger = LoggerFactory.getLogger(CustomUserDetailsService.class);
    @Autowired
    private UserService userService;
    
    @Transactional(readOnly = true)
    @Override
    public UserDetails loadUserByUsername(String ssoId)
            throws UsernameNotFoundException {
        
        com.proyecto.web.model.User user = this.userService.findBySSO(ssoId);
        
        logger.info("User : {}", user);
        if (user == null ) {
            logger.info("User not found");
            throw new UsernameNotFoundException("Username not found");
        } else {
            logger.info("Log in succefull");
            return new org.springframework.security.core.userdetails.User(user.getName(), user.getPass(), true, true, true, true,
                    getGrantedAuthorities(user));
        }   
    }

    private List<GrantedAuthority> getGrantedAuthorities(com.proyecto.web.model.User user) {
        List<GrantedAuthority> authorities = new ArrayList();
        for (UserProfile userProfile : user.getUserProfiles()) {
            logger.info("UserProfile : {}", userProfile);
            authorities.add(new SimpleGrantedAuthority("ROLE_" + userProfile.getCodeProfile()));
        }
        logger.info("authorities : {}", authorities);
        return authorities;
    }
}
