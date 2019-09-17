package com.dateoz.app.web.rest;

import com.dateoz.app.service.JiraAppService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * REST controller for managing {@link com.dateoz.app.domain.JiraApp}.
 */
@RestController
@RequestMapping("/api")
public class JiraAppResource {

    private final Logger log = LoggerFactory.getLogger(JiraAppResource.class);

    private static final String ENTITY_NAME = "dateozAppJiraApp";

    @Value("${jhipster.clientApp.name}")
    private String applicationName;

    private final JiraAppService jiraAppService;

    public JiraAppResource(JiraAppService jiraAppService) {
        this.jiraAppService = jiraAppService;
    }

    @GetMapping("/jira-apps")
    public ResponseEntity<Void> getAllJiraApps() {
        log.debug("REST request to get data from Jira");
        jiraAppService.findAll();
        return (ResponseEntity<Void>) ResponseEntity.ok();
    }

}
