package com.dateoz.app.domain;


import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.Instant;

/**
 * A User.
 */
@Entity
@Table(name = "user")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    @Column(name = "user_id", columnDefinition = "char(36)", unique = true)
    private String userId;

    @NotEmpty
    @Size(min = 3)
    @Pattern(regexp = "^[a-zA-Z]*$")
    @Column(name = "first_name", nullable = false)
    private String firstName;

    @NotEmpty
    @Size(min = 2)
    @Pattern(regexp = "^[a-zA-Z]*$")
    @Column(name = "last_name", nullable = false)
    private String lastName;

    @NotEmpty
    @Size(min = 2)
    @Column(name = "user_name", nullable = false, unique = true)
    private String userName;

    @NotEmpty
    @Size(max = 10)
    @Column(name = "mobile_number", nullable = false, unique = true)
    private String mobileNumber;

    @NotEmpty
    @Column(name = "location", nullable = false)
    private String location;

    @Version
    @Column(name = "profile_created_on")
    private int profileCreatedOn = 1;

    @CreatedBy
    @Column(name = "profile_created_by")
    private String profileCreatedBy;

    @CreatedDate
    @Column(name = "profile_created_date")
    private Instant  profileCreatedDate = Instant.now();

    // jhipster-needle-entity-add-field - JHipster will add fields here, do not remove
    public String getUserId() {
        return userId;
    }

    public void setId(String userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public User firstName(String firstName) {
        this.firstName = firstName;
        return this;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public User lastName(String lastName) {
        this.lastName = lastName;
        return this;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUserName() {
        return userName;
    }

    public User userName(String userName) {
        this.userName = userName;
        return this;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public User mobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
        return this;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getLocation() {
        return location;
    }

    public User location(String location) {
        this.location = location;
        return this;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getProfileCreatedOn() {
        return profileCreatedOn;
    }

    public User profileCreatedOn(int profileCreatedOn) {
        this.profileCreatedOn = profileCreatedOn;
        return this;
    }

    public void setProfileCreatedOn(int profileCreatedOn) {
        this.profileCreatedOn = profileCreatedOn;
    }

    public String getProfileCreatedBy() {
        return profileCreatedBy;
    }

    public User profileCreatedBy(String profileCreatedBy) {
        this.profileCreatedBy = profileCreatedBy;
        return this;
    }

    public void setProfileCreatedBy(String profileCreatedBy) {
        this.profileCreatedBy = profileCreatedBy;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here, do not remove

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof User)) {
            return false;
        }
        return userId != null && userId.equals(((User) o).userId);
    }

    @Override
    public int hashCode() {
        return 31;
    }

    @Override
    public String toString() {
        return "User{" +
            "userId=" + getUserId() +
            ", firstName='" + getFirstName() + "'" +
            ", lastName='" + getLastName() + "'" +
            ", userName='" + getUserName() + "'" +
            ", mobileNumber=" + getMobileNumber() +
            ", location='" + getLocation() + "'" +
            ", profileCreatedOn='" + getProfileCreatedOn() + "'" +
            ", profileCreatedBy='" + getProfileCreatedBy() + "'" +
            ", profileCreatedDate='" + profileCreatedDate + "'" +
            "}";
    }


}
