package com.proyecto.web.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "jf_cat_profile")
public class UserProfile
        implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_profile")
    private Integer idProfile;
    
    @NotEmpty
    @Column(name = "description_profile", length = 30, unique = true, nullable = false)
    private String descriptionProfile = UserProfileType.ADMIN.getUserProfileType();
    
    @NotEmpty
    @Column(name="code_profile", length = 30, unique = true, nullable = false)
    private String codeProfile;
    
    public Integer getIdProfile() {
        return idProfile;
    }

    public void setIdProfile(Integer idProfile) {
        this.idProfile = idProfile;
    }

    public String getDescriptionProfile() {
        return descriptionProfile;
    }

    public void setDescriptionProfile(String descriptionProfile) {
        this.descriptionProfile = descriptionProfile;
    }

    public String getCodeProfile() {
        return codeProfile;
    }

    public void setCodeProfile(String codeProfile) {
        this.codeProfile = codeProfile;
    }
    
    public int hashCode() {
        int prime = 31;
        int result = 1;
        result = 31 * result + (this.idProfile == null ? 0 : this.idProfile.hashCode());
        result = 31 * result + (this.descriptionProfile == null ? 0 : this.descriptionProfile.hashCode());
        return result;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (!(obj instanceof UserProfile)) {
            return false;
        }
        UserProfile other = (UserProfile) obj;
        if (this.idProfile == null) {
            if (other.idProfile != null) {
                return false;
            }
        } else if (!this.idProfile.equals(other.idProfile)) {
            return false;
        }
        if (this.descriptionProfile == null) {
            if (other.descriptionProfile != null) {
                return false;
            }
        } else if (!this.descriptionProfile.equals(other.descriptionProfile)) {
            return false;
        }
        return true;
    }

    public String toString() {
        return "UserProfile [idProfile=" + this.idProfile + ", descriptionProfile=" + this.descriptionProfile + "]";
    }
}
