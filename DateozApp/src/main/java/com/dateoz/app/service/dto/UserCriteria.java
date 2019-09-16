package com.dateoz.app.service.dto;

import io.github.jhipster.service.Criteria;
import io.github.jhipster.service.filter.*;

import java.io.Serializable;
import java.util.Objects;

/**
 * Criteria class for the {@link com.dateoz.app.domain.User} entity. This class is used
 * in {@link com.dateoz.app.web.rest.UserResource} to receive all the possible filtering options from
 * the Http GET request parameters.
 * For example the following could be a valid request:
 * {@code /users?id.greaterThan=5&attr1.contains=something&attr2.specified=false}
 * As Spring is unable to properly convert the types, unless specific {@link Filter} class are used, we need to use
 * fix type specific filters.
 */
public class UserCriteria implements Serializable, Criteria {

    private static final long serialVersionUID = 1L;

    private StringFilter userId;

    private StringFilter firstName;

    private StringFilter lastName;

    private StringFilter userName;

    private StringFilter mobileNumber;

    private StringFilter location;

    private IntegerFilter profileCreatedOn;

    private StringFilter profileCreatedBy;

    private InstantFilter profileCreatedDate;

    public UserCriteria(){
    }

    public UserCriteria(UserCriteria other){
        this.userId = other.userId == null ? null : other.userId.copy();
        this.firstName = other.firstName == null ? null : other.firstName.copy();
        this.lastName = other.lastName == null ? null : other.lastName.copy();
        this.userName = other.userName == null ? null : other.userName.copy();
        this.mobileNumber = other.mobileNumber == null ? null : other.mobileNumber.copy();
        this.location = other.location == null ? null : other.location.copy();
        this.profileCreatedOn = other.profileCreatedOn == null ? null : other.profileCreatedOn.copy();
        this.profileCreatedBy = other.profileCreatedBy == null ? null : other.profileCreatedBy.copy();
        this.profileCreatedDate = other.profileCreatedDate == null ? null : other.profileCreatedDate.copy();
    }

    @Override
    public UserCriteria copy() {
        return new UserCriteria(this);
    }

    public StringFilter getUserId() {
        return userId;
    }

    public void setUserId(StringFilter userId) {
        this.userId = userId;
    }

    public StringFilter getFirstName() {
        return firstName;
    }

    public void setFirstName(StringFilter firstName) {
        this.firstName = firstName;
    }

    public StringFilter getLastName() {
        return lastName;
    }

    public void setLastName(StringFilter lastName) {
        this.lastName = lastName;
    }

    public StringFilter getUserName() {
        return userName;
    }

    public void setUserName(StringFilter userName) {
        this.userName = userName;
    }

    public StringFilter getMobileNumber() {
        return mobileNumber;
    }

    public void setMobileNumber(StringFilter mobileNumber) {
        this.mobileNumber = mobileNumber;
    }

    public StringFilter getLocation() {
        return location;
    }

    public void setLocation(StringFilter location) {
        this.location = location;
    }

    public IntegerFilter getProfileCreatedOn() {
        return profileCreatedOn;
    }

    public void setProfileCreatedOn(IntegerFilter profileCreatedOn) {
        this.profileCreatedOn = profileCreatedOn;
    }

    public StringFilter getProfileCreatedBy() {
        return profileCreatedBy;
    }

    public void setProfileCreatedBy(StringFilter profileCreatedBy) {
        this.profileCreatedBy = profileCreatedBy;
    }

    public InstantFilter getProfileCreatedDate() {
        return profileCreatedDate;
    }

    public void setProfileCreatedDate(InstantFilter profileCreatedDate) {
        this.profileCreatedDate = profileCreatedDate;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        final UserCriteria that = (UserCriteria) o;
        return
            Objects.equals(userId, that.userId) &&
            Objects.equals(firstName, that.firstName) &&
            Objects.equals(lastName, that.lastName) &&
            Objects.equals(userName, that.userName) &&
            Objects.equals(mobileNumber, that.mobileNumber) &&
            Objects.equals(location, that.location) &&
            Objects.equals(profileCreatedOn, that.profileCreatedOn) &&
            Objects.equals(profileCreatedBy, that.profileCreatedBy) &&
            Objects.equals(profileCreatedDate, that.profileCreatedDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(
            userId,
        firstName,
        lastName,
        userName,
        mobileNumber,
        location,
        profileCreatedOn,
        profileCreatedBy,
        profileCreatedDate
        );
    }

    @Override
    public String toString() {
        return "UserCriteria{" +
                (userId != null ? "userId=" + userId + ", " : "") +
                (firstName != null ? "firstName=" + firstName + ", " : "") +
                (lastName != null ? "lastName=" + lastName + ", " : "") +
                (userName != null ? "userName=" + userName + ", " : "") +
                (mobileNumber != null ? "mobileNumber=" + mobileNumber + ", " : "") +
                (location != null ? "location=" + location + ", " : "") +
                (profileCreatedOn != null ? "profileCreatedOn=" + profileCreatedOn + ", " : "") +
                (profileCreatedBy != null ? "profileCreatedBy=" + profileCreatedBy + ", " : "") +
                (profileCreatedDate != null ? "profileCreatedDate=" + profileCreatedDate + ", " : "") +
            "}";
    }

}
