package com.dateoz.app.service.mapper;

import com.dateoz.app.domain.*;
import com.dateoz.app.service.dto.JiraAppDTO;

import org.mapstruct.*;

/**
 * Mapper for the entity {@link JiraApp} and its DTO {@link JiraAppDTO}.
 */
@Mapper(componentModel = "spring", uses = {})
public interface JiraAppMapper extends EntityMapper<JiraAppDTO, JiraApp> {



    default JiraApp fromId(Long id) {
        if (id == null) {
            return null;
        }
        JiraApp jiraApp = new JiraApp();
        jiraApp.setId(id);
        return jiraApp;
    }
}
