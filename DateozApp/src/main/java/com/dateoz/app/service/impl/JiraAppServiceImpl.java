package com.dateoz.app.service.impl;

import com.dateoz.app.client.RestClient;
import com.dateoz.app.domain.JiraApp;
import com.dateoz.app.repository.JiraAppRepository;
import com.dateoz.app.service.JiraAppService;
import com.dateoz.app.service.mapper.JiraAppMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Service Implementation for managing {@link JiraApp}.
 */
@Service
@Transactional
public class JiraAppServiceImpl implements JiraAppService {

    private final Logger log = LoggerFactory.getLogger(JiraAppServiceImpl.class);

    private final JiraAppRepository jiraAppRepository;

    private final JiraAppMapper jiraAppMapper;

    public JiraAppServiceImpl(JiraAppRepository jiraAppRepository, JiraAppMapper jiraAppMapper) {
        this.jiraAppRepository = jiraAppRepository;
        this.jiraAppMapper = jiraAppMapper;
    }

    @Override
    @Transactional(readOnly = true)
    public void findAll() {
        log.debug("Request to get all JiraApps");
        RestClient.getDataFromJIRA();
    }


}
