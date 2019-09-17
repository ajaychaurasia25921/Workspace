package com.dateoz.app.service.dto;
import java.io.Serializable;
import java.util.Objects;

/**
 * A DTO for the {@link com.dateoz.app.domain.JiraApp} entity.
 */
public class JiraAppDTO implements Serializable {

    private Long id;

    private String jiraData;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getJiraData() {
        return jiraData;
    }

    public void setJiraData(String jiraData) {
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

        JiraAppDTO jiraAppDTO = (JiraAppDTO) o;
        if (jiraAppDTO.getId() == null || getId() == null) {
            return false;
        }
        return Objects.equals(getId(), jiraAppDTO.getId());
    }

    @Override
    public int hashCode() {
        return Objects.hashCode(getId());
    }

    @Override
    public String toString() {
        return "JiraAppDTO{" +
            "id=" + getId() +
            ", jiraData='" + getJiraData() + "'" +
            "}";
    }
}
