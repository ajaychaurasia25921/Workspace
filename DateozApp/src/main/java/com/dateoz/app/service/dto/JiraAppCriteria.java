package com.dateoz.app.service.dto;

import java.io.Serializable;
import java.util.Objects;
import io.github.jhipster.service.Criteria;
import io.github.jhipster.service.filter.BooleanFilter;
import io.github.jhipster.service.filter.DoubleFilter;
import io.github.jhipster.service.filter.Filter;
import io.github.jhipster.service.filter.FloatFilter;
import io.github.jhipster.service.filter.IntegerFilter;
import io.github.jhipster.service.filter.LongFilter;
import io.github.jhipster.service.filter.StringFilter;

/**
 * Criteria class for the {@link com.dateoz.app.domain.JiraApp} entity. This class is used
 * in {@link com.dateoz.app.web.rest.JiraAppResource} to receive all the possible filtering options from
 * the Http GET request parameters.
 * For example the following could be a valid request:
 * {@code /jira-apps?id.greaterThan=5&attr1.contains=something&attr2.specified=false}
 * As Spring is unable to properly convert the types, unless specific {@link Filter} class are used, we need to use
 * fix type specific filters.
 */
public class JiraAppCriteria implements Serializable, Criteria {

    private static final long serialVersionUID = 1L;

    private LongFilter id;

    private StringFilter jiraData;

    public JiraAppCriteria(){
    }

    public JiraAppCriteria(JiraAppCriteria other){
        this.id = other.id == null ? null : other.id.copy();
        this.jiraData = other.jiraData == null ? null : other.jiraData.copy();
    }

    @Override
    public JiraAppCriteria copy() {
        return new JiraAppCriteria(this);
    }

    public LongFilter getId() {
        return id;
    }

    public void setId(LongFilter id) {
        this.id = id;
    }

    public StringFilter getJiraData() {
        return jiraData;
    }

    public void setJiraData(StringFilter jiraData) {
        this.jiraData = jiraData;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        final JiraAppCriteria that = (JiraAppCriteria) o;
        return
            Objects.equals(id, that.id) &&
            Objects.equals(jiraData, that.jiraData);
    }

    @Override
    public int hashCode() {
        return Objects.hash(
        id,
        jiraData
        );
    }

    @Override
    public String toString() {
        return "JiraAppCriteria{" +
                (id != null ? "id=" + id + ", " : "") +
                (jiraData != null ? "jiraData=" + jiraData + ", " : "") +
            "}";
    }

}
