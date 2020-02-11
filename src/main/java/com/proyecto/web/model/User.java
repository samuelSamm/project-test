package com.proyecto.web.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "users")
public class User
        implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idUser")
    private Integer idUser;
    @NotEmpty
    @Column(name = "name", nullable = false)
    private String name;
    @NotEmpty
    @Column(name = "pass", nullable = false)
    private String pass;
    
    @Column(name = "age")
    private Integer age;
    
    @Column(name = "createdDate", nullable = false)
    private Date createdDate;
    @Column(name = "estatus", nullable = false)
    private String estatus;
    
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "jf_rel_user_profile", joinColumns = {
        @javax.persistence.JoinColumn(name = "user_id")}, inverseJoinColumns = {
        @javax.persistence.JoinColumn(name = "profile_id")})
    private Set<UserProfile> userProfiles = new HashSet();

    public Integer getIdUser() {
        return idUser;
    }

    public void setIdUser(Integer idUser) {
        this.idUser = idUser;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getEstatus() {
        return estatus;
    }

    public void setEstatus(String estatus) {
        this.estatus = estatus;
    }

    public Set<UserProfile> getUserProfiles() {
        return userProfiles;
    }

    public void setUserProfiles(Set<UserProfile> userProfiles) {
        this.userProfiles = userProfiles;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 47 * hash + Objects.hashCode(this.idUser);
        hash = 47 * hash + Objects.hashCode(this.name);
        hash = 47 * hash + Objects.hashCode(this.pass);
        hash = 47 * hash + Objects.hashCode(this.age);
        hash = 47 * hash + Objects.hashCode(this.createdDate);
        hash = 47 * hash + Objects.hashCode(this.estatus);
        hash = 47 * hash + Objects.hashCode(this.userProfiles);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final User other = (User) obj;
        if (!Objects.equals(this.name, other.name)) {
            return false;
        }
        if (!Objects.equals(this.pass, other.pass)) {
            return false;
        }
        if (!Objects.equals(this.createdDate, other.createdDate)) {
            return false;
        }
        if (!Objects.equals(this.estatus, other.estatus)) {
            return false;
        }
        if (!Objects.equals(this.idUser, other.idUser)) {
            return false;
        }
        if (!Objects.equals(this.age, other.age)) {
            return false;
        }
        if (!Objects.equals(this.userProfiles, other.userProfiles)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "User{" + "idUser=" + idUser + ", name=" + name + ", pass=" + pass + ", age=" + age + ", createdDate=" + createdDate + ", estatus=" + estatus + ", userProfiles=" + userProfiles + '}';
    }
}
