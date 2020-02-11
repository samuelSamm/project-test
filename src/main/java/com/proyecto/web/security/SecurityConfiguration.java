package com.proyecto.web.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.authentication.AuthenticationTrustResolverImpl;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.config.annotation.web.configurers.FormLoginConfigurer;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration
        extends WebSecurityConfigurerAdapter {

    @Autowired
    @Qualifier("customUserDetailsService")
    private UserDetailsService userDetailsService;
    
    @Autowired
    private PersistentTokenRepository tokenRepository;

    @Autowired
    public void configureGlobalSecurity(AuthenticationManagerBuilder auth)
            throws Exception {
        auth.userDetailsService(this.userDetailsService);
        auth.authenticationProvider(authenticationProvider());
    }

    @Override
    protected void configure(HttpSecurity http)
            throws Exception {
        ((HttpSecurity) ((HttpSecurity) ((HttpSecurity) ((FormLoginConfigurer) ((HttpSecurity) 
            ((ExpressionUrlAuthorizationConfigurer.AuthorizedUrl) 
                ((ExpressionUrlAuthorizationConfigurer.AuthorizedUrl) 
                    ((ExpressionUrlAuthorizationConfigurer.AuthorizedUrl) 
                        ((ExpressionUrlAuthorizationConfigurer.AuthorizedUrl)                                                 
                            ((ExpressionUrlAuthorizationConfigurer.AuthorizedUrl)                                                 
                                http.authorizeRequests().antMatchers(
                                new String[]{"/", "/menu"})).access("hasRole('PROJFKEY') or hasRole('PROADMIN') or hasRole('PROJFUSER') or hasRole('PROJFVALIDATE') ").antMatchers(
                            new String[]{"/list-users"})).access("hasRole('PROJFKEY') or hasRole('PROADMIN') or hasRole('PROJFGRAL')  or hasRole('PROJFUSER') ").antMatchers(
                        new String[]{"/uploadExcelFile"})).access("hasRole('PROJFKEY') or hasRole('PROADMIN')").antMatchers(
                    new String[]{"/profile"})).access("hasRole('USER') or hasRole('ADMIN') ").antMatchers(
                new String[]{"/change-password-*"})).access("hasRole('PROJFKEY') or hasRole('PROADMIN') or hasRole('PROJFUSER') ").and())
            .formLogin().loginPage("/login").loginProcessingUrl("/login")).usernameParameter("ssoId").passwordParameter("userPass").and()).rememberMe().rememberMeParameter("remember-me").tokenRepository(this.tokenRepository).tokenValiditySeconds(600).and()).csrf().and())
        .exceptionHandling().accessDeniedPage("/access-denied");
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
        authenticationProvider.setUserDetailsService(this.userDetailsService);
        authenticationProvider.setPasswordEncoder(passwordEncoder());
        return authenticationProvider;
    }

    @Bean
    public PersistentTokenBasedRememberMeServices getPersistentTokenBasedRememberMeServices() {
        PersistentTokenBasedRememberMeServices tokenBasedservice = new PersistentTokenBasedRememberMeServices("remember-me", this.userDetailsService, this.tokenRepository);

        return tokenBasedservice;
    }

    @Bean
    public AuthenticationTrustResolver getAuthenticationTrustResolver() {
        return new AuthenticationTrustResolverImpl();
    }
}