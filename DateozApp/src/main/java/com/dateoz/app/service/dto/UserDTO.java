package com.dateoz.app.service.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.Column;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.Instant;
import java.util.Objects;

/**
 * A DTO for the {@link com.dateoz.app.domain.User} entity.
 */
public class UserDTO implements Serializable {

    @JsonIgnore
    private String userId;

    @NotEmpty
    @Size(min = 3)
    @Pattern(regexp = "^[a-zA-Z]*$")
    private String firstName;

    @NotEmpty
    @Size(min = 2)
    @Pattern(regexp = "^[a-zA-Z]*$")
    private String lastName;

    @NotEmpty
    @Size(min = 2)
    private String userName;

    @NotEmpty
    @Size(max = 10)
    private String mobileNumber;

    @NotEmpty
    private String location;

    @CreatedBy
    @JsonIgnore
    private String profileCreatedBy;

    @CreatedDate
    @JsonIgnore
    private Instant profileCreatedDate = Instant.now();

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(String mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        UserDTO userDTO = (UserDTO) o;
        return Objects.equals(userId, userDTO.userId) &&
            Objects.equals(firstName, userDTO.firstName) &&
            Objects.equals(lastName, userDTO.lastName) &&
            Objects.equals(userName, userDTO.userName) &&
            Objects.equals(mobileNumber, userDTO.mobileNumber) &&
            Objects.equals(location, userDTO.location);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userId, firstName, lastName, userName, mobileNumber, location);
    }

    @Override
    public String toString() {
        return "UserDTO{" +
            "userId='" + userId + '\'' +
            ", firstName='" + firstName + '\'' +
            ", lastName='" + lastName + '\'' +
            ", userName='" + userName + '\'' +
            ", mobileNumber=" + mobileNumber +
            ", location='" + location + '\'' +
            '}';
    }
}
