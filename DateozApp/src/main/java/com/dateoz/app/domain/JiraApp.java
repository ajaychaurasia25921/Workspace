package com.dateoz.app.domain;


import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import javax.persistence.*;

import java.io.Serializable;
import java.util.Objects;

/**
 * A JiraApp.
 */
@Entity
@Table(name = "jira_app")
@Cache(usage = CacheConcurrencyStrategy.NONSTRICT_READ_WRITE)
public class JiraApp implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "jira_data")
    private String jiraData;

    // jhipster-needle-entity-add-field - JHipster will add fields here, do not remove
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getJiraData() {
        return jiraData;
    }

    public JiraApp jiraData(String jiraData) {
        this.jiraData = jiraData;
        return this;
    }

    public void setJiraData(String jiraData) {
        this.jiraData = jiraData;
    }
    // jhipster-needle-entity-add-getters-setters - JHipster will add getters and setters here, do not remove

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof JiraApp)) {
            return false;
        }
        return id != null && id.equals(((JiraApp) o).id);
    }

    @Override
    public int hashCode() {
        return 31;
    }

    @Override
    public String toString() {
        return "JiraApp{" +
            "id=" + getId() +
            ", jiraData='" + getJiraData() + "'" +
            "}";
    }
}
