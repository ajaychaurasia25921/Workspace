package com.dateoz.app.web.rest;

import com.dateoz.app.DateozApp;
import com.dateoz.app.domain.JiraApp;
import com.dateoz.app.repository.JiraAppRepository;
import com.dateoz.app.service.JiraAppService;
import com.dateoz.app.service.dto.JiraAppDTO;
import com.dateoz.app.service.mapper.JiraAppMapper;
import com.dateoz.app.web.rest.errors.ExceptionTranslator;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.web.PageableHandlerMethodArgumentResolver;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.Validator;

import javax.persistence.EntityManager;
import java.util.List;

import static com.dateoz.app.web.rest.TestUtil.createFormattingConversionService;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Integration tests for the {@Link JiraAppResource} REST controller.
 */
@SpringBootTest(classes = DateozApp.class)
public class JiraAppResourceIT {

    private static final String DEFAULT_JIRA_DATA = "AAAAAAAAAA";
    private static final String UPDATED_JIRA_DATA = "BBBBBBBBBB";

    @Autowired
    private JiraAppRepository jiraAppRepository;

    @Autowired
    private JiraAppMapper jiraAppMapper;

    @Autowired
    private JiraAppService jiraAppService;

    @Autowired
    private JiraAppQueryService jiraAppQueryService;

    @Autowired
    private MappingJackson2HttpMessageConverter jacksonMessageConverter;

    @Autowired
    private PageableHandlerMethodArgumentResolver pageableArgumentResolver;

    @Autowired
    private ExceptionTranslator exceptionTranslator;

    @Autowired
    private EntityManager em;

    @Autowired
    private Validator validator;

    private MockMvc restJiraAppMockMvc;

    private JiraApp jiraApp;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.initMocks(this);
        final JiraAppResource jiraAppResource = new JiraAppResource(jiraAppService, jiraAppQueryService);
        this.restJiraAppMockMvc = MockMvcBuilders.standaloneSetup(jiraAppResource)
            .setCustomArgumentResolvers(pageableArgumentResolver)
            .setControllerAdvice(exceptionTranslator)
            .setConversionService(createFormattingConversionService())
            .setMessageConverters(jacksonMessageConverter)
            .setValidator(validator).build();
    }

    /**
     * Create an entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static JiraApp createEntity(EntityManager em) {
        JiraApp jiraApp = new JiraApp()
            .jiraData(DEFAULT_JIRA_DATA);
        return jiraApp;
    }
    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static JiraApp createUpdatedEntity(EntityManager em) {
        JiraApp jiraApp = new JiraApp()
            .jiraData(UPDATED_JIRA_DATA);
        return jiraApp;
    }

    @BeforeEach
    public void initTest() {
        jiraApp = createEntity(em);
    }

    @Test
    @Transactional
    public void createJiraApp() throws Exception {
        int databaseSizeBeforeCreate = jiraAppRepository.findAll().size();

        // Create the JiraApp
        JiraAppDTO jiraAppDTO = jiraAppMapper.toDto(jiraApp);
        restJiraAppMockMvc.perform(post("/api/jira-apps")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(jiraAppDTO)))
            .andExpect(status().isCreated());

        // Validate the JiraApp in the database
        List<JiraApp> jiraAppList = jiraAppRepository.findAll();
        assertThat(jiraAppList).hasSize(databaseSizeBeforeCreate + 1);
        JiraApp testJiraApp = jiraAppList.get(jiraAppList.size() - 1);
        assertThat(testJiraApp.getJiraData()).isEqualTo(DEFAULT_JIRA_DATA);
    }

    @Test
    @Transactional
    public void createJiraAppWithExistingId() throws Exception {
        int databaseSizeBeforeCreate = jiraAppRepository.findAll().size();

        // Create the JiraApp with an existing ID
        jiraApp.setId(1L);
        JiraAppDTO jiraAppDTO = jiraAppMapper.toDto(jiraApp);

        // An entity with an existing ID cannot be created, so this API call must fail
        restJiraAppMockMvc.perform(post("/api/jira-apps")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(jiraAppDTO)))
            .andExpect(status().isBadRequest());

        // Validate the JiraApp in the database
        List<JiraApp> jiraAppList = jiraAppRepository.findAll();
        assertThat(jiraAppList).hasSize(databaseSizeBeforeCreate);
    }


    @Test
    @Transactional
    public void getAllJiraApps() throws Exception {
        // Initialize the database
        jiraAppRepository.saveAndFlush(jiraApp);

        // Get all the jiraAppList
        restJiraAppMockMvc.perform(get("/api/jira-apps?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(jiraApp.getId().intValue())))
            .andExpect(jsonPath("$.[*].jiraData").value(hasItem(DEFAULT_JIRA_DATA.toString())));
    }
    
    @Test
    @Transactional
    public void getJiraApp() throws Exception {
        // Initialize the database
        jiraAppRepository.saveAndFlush(jiraApp);

        // Get the jiraApp
        restJiraAppMockMvc.perform(get("/api/jira-apps/{id}", jiraApp.getId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.id").value(jiraApp.getId().intValue()))
            .andExpect(jsonPath("$.jiraData").value(DEFAULT_JIRA_DATA.toString()));
    }

    @Test
    @Transactional
    public void getAllJiraAppsByJiraDataIsEqualToSomething() throws Exception {
        // Initialize the database
        jiraAppRepository.saveAndFlush(jiraApp);

        // Get all the jiraAppList where jiraData equals to DEFAULT_JIRA_DATA
        defaultJiraAppShouldBeFound("jiraData.equals=" + DEFAULT_JIRA_DATA);

        // Get all the jiraAppList where jiraData equals to UPDATED_JIRA_DATA
        defaultJiraAppShouldNotBeFound("jiraData.equals=" + UPDATED_JIRA_DATA);
    }

    @Test
    @Transactional
    public void getAllJiraAppsByJiraDataIsInShouldWork() throws Exception {
        // Initialize the database
        jiraAppRepository.saveAndFlush(jiraApp);

        // Get all the jiraAppList where jiraData in DEFAULT_JIRA_DATA or UPDATED_JIRA_DATA
        defaultJiraAppShouldBeFound("jiraData.in=" + DEFAULT_JIRA_DATA + "," + UPDATED_JIRA_DATA);

        // Get all the jiraAppList where jiraData equals to UPDATED_JIRA_DATA
        defaultJiraAppShouldNotBeFound("jiraData.in=" + UPDATED_JIRA_DATA);
    }

    @Test
    @Transactional
    public void getAllJiraAppsByJiraDataIsNullOrNotNull() throws Exception {
        // Initialize the database
        jiraAppRepository.saveAndFlush(jiraApp);

        // Get all the jiraAppList where jiraData is not null
        defaultJiraAppShouldBeFound("jiraData.specified=true");

        // Get all the jiraAppList where jiraData is null
        defaultJiraAppShouldNotBeFound("jiraData.specified=false");
    }
    /**
     * Executes the search, and checks that the default entity is returned.
     */
    private void defaultJiraAppShouldBeFound(String filter) throws Exception {
        restJiraAppMockMvc.perform(get("/api/jira-apps?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.[*].id").value(hasItem(jiraApp.getId().intValue())))
            .andExpect(jsonPath("$.[*].jiraData").value(hasItem(DEFAULT_JIRA_DATA)));

        // Check, that the count call also returns 1
        restJiraAppMockMvc.perform(get("/api/jira-apps/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(content().string("1"));
    }

    /**
     * Executes the search, and checks that the default entity is not returned.
     */
    private void defaultJiraAppShouldNotBeFound(String filter) throws Exception {
        restJiraAppMockMvc.perform(get("/api/jira-apps?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$").isArray())
            .andExpect(jsonPath("$").isEmpty());

        // Check, that the count call also returns 0
        restJiraAppMockMvc.perform(get("/api/jira-apps/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(content().string("0"));
    }


    @Test
    @Transactional
    public void getNonExistingJiraApp() throws Exception {
        // Get the jiraApp
        restJiraAppMockMvc.perform(get("/api/jira-apps/{id}", Long.MAX_VALUE))
            .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    public void updateJiraApp() throws Exception {
        // Initialize the database
        jiraAppRepository.saveAndFlush(jiraApp);

        int databaseSizeBeforeUpdate = jiraAppRepository.findAll().size();

        // Update the jiraApp
        JiraApp updatedJiraApp = jiraAppRepository.findById(jiraApp.getId()).get();
        // Disconnect from session so that the updates on updatedJiraApp are not directly saved in db
        em.detach(updatedJiraApp);
        updatedJiraApp
            .jiraData(UPDATED_JIRA_DATA);
        JiraAppDTO jiraAppDTO = jiraAppMapper.toDto(updatedJiraApp);

        restJiraAppMockMvc.perform(put("/api/jira-apps")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(jiraAppDTO)))
            .andExpect(status().isOk());

        // Validate the JiraApp in the database
        List<JiraApp> jiraAppList = jiraAppRepository.findAll();
        assertThat(jiraAppList).hasSize(databaseSizeBeforeUpdate);
        JiraApp testJiraApp = jiraAppList.get(jiraAppList.size() - 1);
        assertThat(testJiraApp.getJiraData()).isEqualTo(UPDATED_JIRA_DATA);
    }

    @Test
    @Transactional
    public void updateNonExistingJiraApp() throws Exception {
        int databaseSizeBeforeUpdate = jiraAppRepository.findAll().size();

        // Create the JiraApp
        JiraAppDTO jiraAppDTO = jiraAppMapper.toDto(jiraApp);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restJiraAppMockMvc.perform(put("/api/jira-apps")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(jiraAppDTO)))
            .andExpect(status().isBadRequest());

        // Validate the JiraApp in the database
        List<JiraApp> jiraAppList = jiraAppRepository.findAll();
        assertThat(jiraAppList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    public void deleteJiraApp() throws Exception {
        // Initialize the database
        jiraAppRepository.saveAndFlush(jiraApp);

        int databaseSizeBeforeDelete = jiraAppRepository.findAll().size();

        // Delete the jiraApp
        restJiraAppMockMvc.perform(delete("/api/jira-apps/{id}", jiraApp.getId())
            .accept(TestUtil.APPLICATION_JSON_UTF8))
            .andExpect(status().isNoContent());

        // Validate the database is empty
        List<JiraApp> jiraAppList = jiraAppRepository.findAll();
        assertThat(jiraAppList).hasSize(databaseSizeBeforeDelete - 1);
    }

    @Test
    @Transactional
    public void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(JiraApp.class);
        JiraApp jiraApp1 = new JiraApp();
        jiraApp1.setId(1L);
        JiraApp jiraApp2 = new JiraApp();
        jiraApp2.setId(jiraApp1.getId());
        assertThat(jiraApp1).isEqualTo(jiraApp2);
        jiraApp2.setId(2L);
        assertThat(jiraApp1).isNotEqualTo(jiraApp2);
        jiraApp1.setId(null);
        assertThat(jiraApp1).isNotEqualTo(jiraApp2);
    }

    @Test
    @Transactional
    public void dtoEqualsVerifier() throws Exception {
        TestUtil.equalsVerifier(JiraAppDTO.class);
        JiraAppDTO jiraAppDTO1 = new JiraAppDTO();
        jiraAppDTO1.setId(1L);
        JiraAppDTO jiraAppDTO2 = new JiraAppDTO();
        assertThat(jiraAppDTO1).isNotEqualTo(jiraAppDTO2);
        jiraAppDTO2.setId(jiraAppDTO1.getId());
        assertThat(jiraAppDTO1).isEqualTo(jiraAppDTO2);
        jiraAppDTO2.setId(2L);
        assertThat(jiraAppDTO1).isNotEqualTo(jiraAppDTO2);
        jiraAppDTO1.setId(null);
        assertThat(jiraAppDTO1).isNotEqualTo(jiraAppDTO2);
    }

    @Test
    @Transactional
    public void testEntityFromId() {
        assertThat(jiraAppMapper.fromId(42L).getId()).isEqualTo(42);
        assertThat(jiraAppMapper.fromId(null)).isNull();
    }
}
