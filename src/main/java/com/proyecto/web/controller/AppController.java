package com.proyecto.web.controller;

import com.proyecto.web.model.User;
import com.proyecto.web.model.UserProfile;
import com.proyecto.web.service.UserProfileService;
import com.proyecto.web.service.UserService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.exception.ConstraintViolationException;
import org.hibernate.exception.SQLGrammarException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping({"/"})
@SessionAttributes({"roles"})
@PropertySource({"classpath:texts.properties"})
public class AppController {
    @Autowired
    private UserProfileService userProfileService;
    
    @Autowired
    private PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;

    @Autowired
    private AuthenticationTrustResolver authenticationTrustResolver;
    
    @Autowired
    private UserService userService;

    
  
    @RequestMapping(value = {"/", "/menu"}, method = {org.springframework.web.bind.annotation.RequestMethod.GET})
    public String listUsers(HttpServletRequest request, ModelMap model) {
       if (request.getRemoteUser() == null) {
            return "redirect:/login";
        }
        return "redirect:users";
    }
    
    @RequestMapping(value = {"/users"}, method = {org.springframework.web.bind.annotation.RequestMethod.GET})
    public String awards(HttpServletRequest request, ModelMap model) {

        if (request.getRemoteUser() == null) {
            return "redirect:/login";
        }
        List<User> user = new ArrayList();
        try {
            user = this.userService.findAllUsers();
        } catch (SQLGrammarException gex) {
            Logger.getLogger(AppController.class.getName()).log(Level.SEVERE, null, gex);
        }
        model.addAttribute("user", user);
        model.addAttribute("uri", request.getRequestURI());

        return "list-users";
    }

    @RequestMapping(value = "/message-control", method = {org.springframework.web.bind.annotation.RequestMethod.GET})
    public String messageControl(HttpServletRequest request, ModelMap model) {
        String redirectUrl = "message-control";
        if (request.getRemoteUser() == null) {
            return "redirect:/login";
        }
        String msg = request.getParameter("msg");
        
        model.addAttribute("msg", msg);
        return redirectUrl;
    }

    @RequestMapping(value = {"/delete-user"}, method = {org.springframework.web.bind.annotation.RequestMethod.POST})
    public String deleteUser(HttpServletRequest request, ModelMap model) {
       this.userService.deleteUserBySSO(Integer.parseInt(request.getParameter("idUser")));
        return "redirect:users";
    }
    
    @RequestMapping(value = {"/create-user"}, method = {org.springframework.web.bind.annotation.RequestMethod.POST})
    public String createUser(HttpServletRequest request, ModelMap model) {
        final String PASS_DEFAULT = "demo";
        User nuevo = new User();
        nuevo.setName(request.getParameter("nom"));
        nuevo.setAge(Integer.parseInt(request.getParameter("age")));
        nuevo.setEstatus(request.getParameter("est"));
        nuevo.setCreatedDate(new java.sql.Date(new Date().getTime()));
        nuevo.setPass(PASS_DEFAULT);
       this.userService.saveUser(nuevo);
        return "redirect:users";
    }
    
    @RequestMapping(value = {"/update-user"}, method = {org.springframework.web.bind.annotation.RequestMethod.POST})
    public String updateUser(HttpServletRequest request, ModelMap model) {
        User nuevo = this.userService.findById(Integer.parseInt(request.getParameter("idUser")));
        if(nuevo!=null){
            nuevo.setName(request.getParameter("nom"));
            nuevo.setAge(Integer.parseInt(request.getParameter("age")));
            nuevo.setEstatus(request.getParameter("est"));
            nuevo.setCreatedDate(new java.sql.Date(new Date().getTime()));
            this.userService.updateUser(nuevo);
        }
        return "redirect:users";
    }
    
    
    @ModelAttribute("roles")
    public List<UserProfile> initializeProfiles() {
        return this.userProfileService.findAll();
    }

    @RequestMapping(value = {"/access-denied"}, method = {org.springframework.web.bind.annotation.RequestMethod.GET})
    public String accessDeniedPage(HttpServletRequest request, ModelMap model) {
        try {
            if (request.getRemoteUser() == null) {
                return "redirect:/login";
            }

        } catch (SQLGrammarException | ConstraintViolationException ex) {
            Logger.getLogger(AppController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "access-denied";
    }

    @RequestMapping(value = {"/login"}, method = {org.springframework.web.bind.annotation.RequestMethod.GET})
    public String loginPage(HttpServletRequest request, ModelMap model) {
        try {
            
            if (isCurrentAuthenticationAnonymous()) {
                return "index";
            }
        } catch (SQLGrammarException | ConstraintViolationException ex) {
            Logger.getLogger(AppController.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "redirect:/menu";
    }

    @RequestMapping(value = {"/logout"}, method = {org.springframework.web.bind.annotation.RequestMethod.GET})
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            this.persistentTokenBasedRememberMeServices.logout(request, response, auth);
            SecurityContextHolder.getContext().setAuthentication(null);
        }
        return "redirect:/login?logout";
    }
    
//    private String getPrincipal() {
//        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        String userName;
//        if ((principal instanceof UserDetails)) {
//            userName = ((UserDetails) principal).getUsername();
//        } else {
//            userName = principal.toString();
//        }
//        return userName;
//    }

    private boolean isCurrentAuthenticationAnonymous() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return this.authenticationTrustResolver.isAnonymous(authentication);
    }
}
