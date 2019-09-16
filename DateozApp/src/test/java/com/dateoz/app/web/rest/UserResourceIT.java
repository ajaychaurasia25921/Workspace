package com.dateoz.app.web.rest;

import com.dateoz.app.DateozApp;
import com.dateoz.app.domain.User;
import com.dateoz.app.repository.UserRepository;
import com.dateoz.app.service.UserQueryService;
import com.dateoz.app.service.UserService;
import com.dateoz.app.service.dto.UserDTO;
import com.dateoz.app.service.mapper.UserMapper;
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
import java.time.Instant;
import java.util.List;

import static com.dateoz.app.web.rest.TestUtil.createFormattingConversionService;
import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.hasItem;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Integration tests for the {@Link UserResource} REST controller.
 */
@SpringBootTest(classes = DateozApp.class)
public class UserResourceIT {

    private static final String DEFAULT_FIRST_NAME = "AAAAAAAAAA";
    private static final String UPDATED_FIRST_NAME = "BBBBBBBBBB";

    private static final String DEFAULT_LAST_NAME = "AAAAAAAAAA";
    private static final String UPDATED_LAST_NAME = "BBBBBBBBBB";

    private static final String DEFAULT_USER_NAME = "AAAAAAAAAA";
    private static final String UPDATED_USER_NAME = "BBBBBBBBBB";

    private static final String DEFAULT_MOBILE_NUMBER = "9876543210";
    private static final String UPDATED_MOBILE_NUMBER = "9876543211";

    private static final String DEFAULT_LOCATION = "AAAAAAAAAA";
    private static final String UPDATED_LOCATION = "BBBBBBBBBB";

    private static final int DEFAULT_PROFILE_CREATED_ON = 123;
    private static final int UPDATED_PROFILE_CREATED_ON = 345;

    private static final String DEFAULT_PROFILE_CREATED_BY = "AAAAAAAAAA";
    private static final String UPDATED_PROFILE_CREATED_BY = "BBBBBBBBBB";

    private static final Instant DEFAULT_PROFILE_CREATED_DATE = Instant.now();
    private static final Instant UPDATED_PROFILE_CREATED_DATE = Instant.now();

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private UserService userService;

    @Autowired
    private UserQueryService userQueryService;

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

    private MockMvc restUserMockMvc;

    private User user;

    @BeforeEach
    public void setup() {
        MockitoAnnotations.initMocks(this);
        final UserResource userResource = new UserResource(userService, userQueryService);
        this.restUserMockMvc = MockMvcBuilders.standaloneSetup(userResource)
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
    public static User createEntity(EntityManager em) {
        User user = new User()
            .firstName(DEFAULT_FIRST_NAME)
            .lastName(DEFAULT_LAST_NAME)
            .userName(DEFAULT_USER_NAME)
            .mobileNumber(DEFAULT_MOBILE_NUMBER)
            .location(DEFAULT_LOCATION)
            .profileCreatedOn(DEFAULT_PROFILE_CREATED_ON)
            .profileCreatedBy(DEFAULT_PROFILE_CREATED_BY);
        return user;
    }
    /**
     * Create an updated entity for this test.
     *
     * This is a static method, as tests for other entities might also need it,
     * if they test an entity which requires the current entity.
     */
    public static User createUpdatedEntity(EntityManager em) {
        User user = new User()
            .firstName(UPDATED_FIRST_NAME)
            .lastName(UPDATED_LAST_NAME)
            .userName(UPDATED_USER_NAME)
            .mobileNumber(UPDATED_MOBILE_NUMBER)
            .location(UPDATED_LOCATION)
            .profileCreatedOn(UPDATED_PROFILE_CREATED_ON)
            .profileCreatedBy(UPDATED_PROFILE_CREATED_BY);
        return user;
    }

    @BeforeEach
    public void initTest() {
        user = createEntity(em);
    }

    @Test
    @Transactional
    public void createUser() throws Exception {
        int databaseSizeBeforeCreate = userRepository.findAll().size();

        // Create the User
        UserDTO userDTO = userMapper.toDto(user);
        restUserMockMvc.perform(post("/api/users")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(userDTO)))
            .andExpect(status().isCreated());

        // Validate the User in the database
        List<User> userList = userRepository.findAll();
        assertThat(userList).hasSize(databaseSizeBeforeCreate + 1);
        User testUser = userList.get(userList.size() - 1);
        assertThat(testUser.getFirstName()).isEqualTo(DEFAULT_FIRST_NAME);
        assertThat(testUser.getLastName()).isEqualTo(DEFAULT_LAST_NAME);
        assertThat(testUser.getUserName()).isEqualTo(DEFAULT_USER_NAME);
        assertThat(testUser.getMobileNumber()).isEqualTo(DEFAULT_MOBILE_NUMBER);
        assertThat(testUser.getLocation()).isEqualTo(DEFAULT_LOCATION);
        assertThat(testUser.getProfileCreatedOn()).isEqualTo(DEFAULT_PROFILE_CREATED_ON);
        assertThat(testUser.getProfileCreatedBy()).isEqualTo(DEFAULT_PROFILE_CREATED_BY);
    }

    @Test
    @Transactional
    public void createUserWithExistingId() throws Exception {
        int databaseSizeBeforeCreate = userRepository.findAll().size();

        // Create the User with an existing ID
        user.setId(DEFAULT_USER_NAME);
        UserDTO userDTO = userMapper.toDto(user);

        // An entity with an existing ID cannot be created, so this API call must fail
        restUserMockMvc.perform(post("/api/users")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(userDTO)))
            .andExpect(status().isBadRequest());

        // Validate the User in the database
        List<User> userList = userRepository.findAll();
        assertThat(userList).hasSize(databaseSizeBeforeCreate);
    }


    @Test
    @Transactional
    public void checkFirstNameIsRequired() throws Exception {
        int databaseSizeBeforeTest = userRepository.findAll().size();
        // set the field null
        user.setFirstName(null);

        // Create the User, which fails.
        UserDTO userDTO = userMapper.toDto(user);

        restUserMockMvc.perform(post("/api/users")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(userDTO)))
            .andExpect(status().isBadRequest());

        List<User> userList = userRepository.findAll();
        assertThat(userList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void checkLastNameIsRequired() throws Exception {
        int databaseSizeBeforeTest = userRepository.findAll().size();
        // set the field null
        user.setLastName(null);

        // Create the User, which fails.
        UserDTO userDTO = userMapper.toDto(user);

        restUserMockMvc.perform(post("/api/users")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(userDTO)))
            .andExpect(status().isBadRequest());

        List<User> userList = userRepository.findAll();
        assertThat(userList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void checkUserNameIsRequired() throws Exception {
        int databaseSizeBeforeTest = userRepository.findAll().size();
        // set the field null
        user.setUserName(null);

        // Create the User, which fails.
        UserDTO userDTO = userMapper.toDto(user);

        restUserMockMvc.perform(post("/api/users")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(userDTO)))
            .andExpect(status().isBadRequest());

        List<User> userList = userRepository.findAll();
        assertThat(userList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void checkMobileNumberIsRequired() throws Exception {
        int databaseSizeBeforeTest = userRepository.findAll().size();
        // set the field null
        user.setMobileNumber(null);

        // Create the User, which fails.
        UserDTO userDTO = userMapper.toDto(user);

        restUserMockMvc.perform(post("/api/users")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(userDTO)))
            .andExpect(status().isBadRequest());

        List<User> userList = userRepository.findAll();
        assertThat(userList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void checkLocationIsRequired() throws Exception {
        int databaseSizeBeforeTest = userRepository.findAll().size();
        // set the field null
        user.setLocation(null);

        // Create the User, which fails.
        UserDTO userDTO = userMapper.toDto(user);

        restUserMockMvc.perform(post("/api/users")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(userDTO)))
            .andExpect(status().isBadRequest());

        List<User> userList = userRepository.findAll();
        assertThat(userList).hasSize(databaseSizeBeforeTest);
    }

    @Test
    @Transactional
    public void getAllUsers() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList
        restUserMockMvc.perform(get("/api/users?sort=id,desc"))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.[*].userId").value(hasItem(user.getUserId().toString())))
            .andExpect(jsonPath("$.[*].firstName").value(hasItem(DEFAULT_FIRST_NAME.toString())))
            .andExpect(jsonPath("$.[*].lastName").value(hasItem(DEFAULT_LAST_NAME.toString())))
            .andExpect(jsonPath("$.[*].userName").value(hasItem(DEFAULT_USER_NAME.toString())))
            .andExpect(jsonPath("$.[*].mobileNumber").value(hasItem(DEFAULT_MOBILE_NUMBER)))
            .andExpect(jsonPath("$.[*].location").value(hasItem(DEFAULT_LOCATION.toString())))
            .andExpect(jsonPath("$.[*].profileCreatedOn").value(hasItem(DEFAULT_PROFILE_CREATED_ON)))
            .andExpect(jsonPath("$.[*].profileCreatedBy").value(hasItem(DEFAULT_PROFILE_CREATED_BY.toString())));
    }
    
    @Test
    @Transactional
    public void getUser() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get the user
        restUserMockMvc.perform(get("/api/users/{id}", user.getUserId()))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.userId").value(user.getUserId().toString()))
            .andExpect(jsonPath("$.firstName").value(DEFAULT_FIRST_NAME.toString()))
            .andExpect(jsonPath("$.lastName").value(DEFAULT_LAST_NAME.toString()))
            .andExpect(jsonPath("$.userName").value(DEFAULT_USER_NAME.toString()))
            .andExpect(jsonPath("$.mobileNumber").value(DEFAULT_MOBILE_NUMBER))
            .andExpect(jsonPath("$.location").value(DEFAULT_LOCATION.toString()))
            .andExpect(jsonPath("$.profileCreatedOn").value(DEFAULT_PROFILE_CREATED_ON))
            .andExpect(jsonPath("$.profileCreatedBy").value(DEFAULT_PROFILE_CREATED_BY.toString()));
    }

    @Test
    @Transactional
    public void getAllUsersByFirstNameIsEqualToSomething() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where firstName equals to DEFAULT_FIRST_NAME
        defaultUserShouldBeFound("firstName.equals=" + DEFAULT_FIRST_NAME);

        // Get all the userList where firstName equals to UPDATED_FIRST_NAME
        defaultUserShouldNotBeFound("firstName.equals=" + UPDATED_FIRST_NAME);
    }

    @Test
    @Transactional
    public void getAllUsersByFirstNameIsInShouldWork() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where firstName in DEFAULT_FIRST_NAME or UPDATED_FIRST_NAME
        defaultUserShouldBeFound("firstName.in=" + DEFAULT_FIRST_NAME + "," + UPDATED_FIRST_NAME);

        // Get all the userList where firstName equals to UPDATED_FIRST_NAME
        defaultUserShouldNotBeFound("firstName.in=" + UPDATED_FIRST_NAME);
    }

    @Test
    @Transactional
    public void getAllUsersByFirstNameIsNullOrNotNull() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where firstName is not null
        defaultUserShouldBeFound("firstName.specified=true");

        // Get all the userList where firstName is null
        defaultUserShouldNotBeFound("firstName.specified=false");
    }

    @Test
    @Transactional
    public void getAllUsersByLastNameIsEqualToSomething() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where lastName equals to DEFAULT_LAST_NAME
        defaultUserShouldBeFound("lastName.equals=" + DEFAULT_LAST_NAME);

        // Get all the userList where lastName equals to UPDATED_LAST_NAME
        defaultUserShouldNotBeFound("lastName.equals=" + UPDATED_LAST_NAME);
    }

    @Test
    @Transactional
    public void getAllUsersByLastNameIsInShouldWork() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where lastName in DEFAULT_LAST_NAME or UPDATED_LAST_NAME
        defaultUserShouldBeFound("lastName.in=" + DEFAULT_LAST_NAME + "," + UPDATED_LAST_NAME);

        // Get all the userList where lastName equals to UPDATED_LAST_NAME
        defaultUserShouldNotBeFound("lastName.in=" + UPDATED_LAST_NAME);
    }

    @Test
    @Transactional
    public void getAllUsersByLastNameIsNullOrNotNull() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where lastName is not null
        defaultUserShouldBeFound("lastName.specified=true");

        // Get all the userList where lastName is null
        defaultUserShouldNotBeFound("lastName.specified=false");
    }

    @Test
    @Transactional
    public void getAllUsersByUserNameIsEqualToSomething() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where userName equals to DEFAULT_USER_NAME
        defaultUserShouldBeFound("userName.equals=" + DEFAULT_USER_NAME);

        // Get all the userList where userName equals to UPDATED_USER_NAME
        defaultUserShouldNotBeFound("userName.equals=" + UPDATED_USER_NAME);
    }

    @Test
    @Transactional
    public void getAllUsersByUserNameIsInShouldWork() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where userName in DEFAULT_USER_NAME or UPDATED_USER_NAME
        defaultUserShouldBeFound("userName.in=" + DEFAULT_USER_NAME + "," + UPDATED_USER_NAME);

        // Get all the userList where userName equals to UPDATED_USER_NAME
        defaultUserShouldNotBeFound("userName.in=" + UPDATED_USER_NAME);
    }

    @Test
    @Transactional
    public void getAllUsersByUserNameIsNullOrNotNull() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where userName is not null
        defaultUserShouldBeFound("userName.specified=true");

        // Get all the userList where userName is null
        defaultUserShouldNotBeFound("userName.specified=false");
    }

    @Test
    @Transactional
    public void getAllUsersByMobileNumberIsEqualToSomething() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where mobileNumber equals to DEFAULT_MOBILE_NUMBER
        defaultUserShouldBeFound("mobileNumber.equals=" + DEFAULT_MOBILE_NUMBER);

        // Get all the userList where mobileNumber equals to UPDATED_MOBILE_NUMBER
        defaultUserShouldNotBeFound("mobileNumber.equals=" + UPDATED_MOBILE_NUMBER);
    }

    @Test
    @Transactional
    public void getAllUsersByMobileNumberIsInShouldWork() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where mobileNumber in DEFAULT_MOBILE_NUMBER or UPDATED_MOBILE_NUMBER
        defaultUserShouldBeFound("mobileNumber.in=" + DEFAULT_MOBILE_NUMBER + "," + UPDATED_MOBILE_NUMBER);

        // Get all the userList where mobileNumber equals to UPDATED_MOBILE_NUMBER
        defaultUserShouldNotBeFound("mobileNumber.in=" + UPDATED_MOBILE_NUMBER);
    }

    @Test
    @Transactional
    public void getAllUsersByMobileNumberIsNullOrNotNull() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where mobileNumber is not null
        defaultUserShouldBeFound("mobileNumber.specified=true");

        // Get all the userList where mobileNumber is null
        defaultUserShouldNotBeFound("mobileNumber.specified=false");
    }

    @Test
    @Transactional
    public void getAllUsersByMobileNumberIsGreaterThanOrEqualToSomething() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where mobileNumber greater than or equals to DEFAULT_MOBILE_NUMBER
        defaultUserShouldBeFound("mobileNumber.greaterOrEqualThan=" + DEFAULT_MOBILE_NUMBER);

        // Get all the userList where mobileNumber greater than or equals to (DEFAULT_MOBILE_NUMBER + 1)
        defaultUserShouldNotBeFound("mobileNumber.greaterOrEqualThan=" + (DEFAULT_MOBILE_NUMBER + 1));
    }

    @Test
    @Transactional
    public void getAllUsersByMobileNumberIsLessThanSomething() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where mobileNumber less than or equals to DEFAULT_MOBILE_NUMBER
        defaultUserShouldNotBeFound("mobileNumber.lessThan=" + DEFAULT_MOBILE_NUMBER);

        // Get all the userList where mobileNumber less than or equals to (DEFAULT_MOBILE_NUMBER + 1)
        defaultUserShouldBeFound("mobileNumber.lessThan=" + (DEFAULT_MOBILE_NUMBER + 1));
    }


    @Test
    @Transactional
    public void getAllUsersByLocationIsEqualToSomething() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where location equals to DEFAULT_LOCATION
        defaultUserShouldBeFound("location.equals=" + DEFAULT_LOCATION);

        // Get all the userList where location equals to UPDATED_LOCATION
        defaultUserShouldNotBeFound("location.equals=" + UPDATED_LOCATION);
    }

    @Test
    @Transactional
    public void getAllUsersByLocationIsInShouldWork() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where location in DEFAULT_LOCATION or UPDATED_LOCATION
        defaultUserShouldBeFound("location.in=" + DEFAULT_LOCATION + "," + UPDATED_LOCATION);

        // Get all the userList where location equals to UPDATED_LOCATION
        defaultUserShouldNotBeFound("location.in=" + UPDATED_LOCATION);
    }

    @Test
    @Transactional
    public void getAllUsersByLocationIsNullOrNotNull() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where location is not null
        defaultUserShouldBeFound("location.specified=true");

        // Get all the userList where location is null
        defaultUserShouldNotBeFound("location.specified=false");
    }

    @Test
    @Transactional
    public void getAllUsersByProfileCreatedOnIsEqualToSomething() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where profileCreatedOn equals to DEFAULT_PROFILE_CREATED_ON
        defaultUserShouldBeFound("profileCreatedOn.equals=" + DEFAULT_PROFILE_CREATED_ON);

        // Get all the userList where profileCreatedOn equals to UPDATED_PROFILE_CREATED_ON
        defaultUserShouldNotBeFound("profileCreatedOn.equals=" + UPDATED_PROFILE_CREATED_ON);
    }

    @Test
    @Transactional
    public void getAllUsersByProfileCreatedOnIsInShouldWork() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where profileCreatedOn in DEFAULT_PROFILE_CREATED_ON or UPDATED_PROFILE_CREATED_ON
        defaultUserShouldBeFound("profileCreatedOn.in=" + DEFAULT_PROFILE_CREATED_ON + "," + UPDATED_PROFILE_CREATED_ON);

        // Get all the userList where profileCreatedOn equals to UPDATED_PROFILE_CREATED_ON
        defaultUserShouldNotBeFound("profileCreatedOn.in=" + UPDATED_PROFILE_CREATED_ON);
    }

    @Test
    @Transactional
    public void getAllUsersByProfileCreatedOnIsNullOrNotNull() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where profileCreatedOn is not null
        defaultUserShouldBeFound("profileCreatedOn.specified=true");

        // Get all the userList where profileCreatedOn is null
        defaultUserShouldNotBeFound("profileCreatedOn.specified=false");
    }

    @Test
    @Transactional
    public void getAllUsersByProfileCreatedByIsEqualToSomething() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where profileCreatedBy equals to DEFAULT_PROFILE_CREATED_BY
        defaultUserShouldBeFound("profileCreatedBy.equals=" + DEFAULT_PROFILE_CREATED_BY);

        // Get all the userList where profileCreatedBy equals to UPDATED_PROFILE_CREATED_BY
        defaultUserShouldNotBeFound("profileCreatedBy.equals=" + UPDATED_PROFILE_CREATED_BY);
    }

    @Test
    @Transactional
    public void getAllUsersByProfileCreatedByIsInShouldWork() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where profileCreatedBy in DEFAULT_PROFILE_CREATED_BY or UPDATED_PROFILE_CREATED_BY
        defaultUserShouldBeFound("profileCreatedBy.in=" + DEFAULT_PROFILE_CREATED_BY + "," + UPDATED_PROFILE_CREATED_BY);

        // Get all the userList where profileCreatedBy equals to UPDATED_PROFILE_CREATED_BY
        defaultUserShouldNotBeFound("profileCreatedBy.in=" + UPDATED_PROFILE_CREATED_BY);
    }

    @Test
    @Transactional
    public void getAllUsersByProfileCreatedByIsNullOrNotNull() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where profileCreatedBy is not null
        defaultUserShouldBeFound("profileCreatedBy.specified=true");

        // Get all the userList where profileCreatedBy is null
        defaultUserShouldNotBeFound("profileCreatedBy.specified=false");
    }

    @Test
    @Transactional
    public void getAllUsersByProfileCreatedDateIsEqualToSomething() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where profileCreatedDate equals to DEFAULT_PROFILE_CREATED_DATE
        defaultUserShouldBeFound("profileCreatedDate.equals=" + DEFAULT_PROFILE_CREATED_DATE);

        // Get all the userList where profileCreatedDate equals to UPDATED_PROFILE_CREATED_DATE
        defaultUserShouldNotBeFound("profileCreatedDate.equals=" + UPDATED_PROFILE_CREATED_DATE);
    }

    @Test
    @Transactional
    public void getAllUsersByProfileCreatedDateIsInShouldWork() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where profileCreatedDate in DEFAULT_PROFILE_CREATED_DATE or UPDATED_PROFILE_CREATED_DATE
        defaultUserShouldBeFound("profileCreatedDate.in=" + DEFAULT_PROFILE_CREATED_DATE + "," + UPDATED_PROFILE_CREATED_DATE);

        // Get all the userList where profileCreatedDate equals to UPDATED_PROFILE_CREATED_DATE
        defaultUserShouldNotBeFound("profileCreatedDate.in=" + UPDATED_PROFILE_CREATED_DATE);
    }

    @Test
    @Transactional
    public void getAllUsersByProfileCreatedDateIsNullOrNotNull() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where profileCreatedDate is not null
        defaultUserShouldBeFound("profileCreatedDate.specified=true");

        // Get all the userList where profileCreatedDate is null
        defaultUserShouldNotBeFound("profileCreatedDate.specified=false");
    }

    @Test
    @Transactional
    public void getAllUsersByProfileCreatedDateIsGreaterThanOrEqualToSomething() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where profileCreatedDate greater than or equals to DEFAULT_PROFILE_CREATED_DATE
        defaultUserShouldBeFound("profileCreatedDate.greaterOrEqualThan=" + DEFAULT_PROFILE_CREATED_DATE);

        // Get all the userList where profileCreatedDate greater than or equals to UPDATED_PROFILE_CREATED_DATE
        defaultUserShouldNotBeFound("profileCreatedDate.greaterOrEqualThan=" + UPDATED_PROFILE_CREATED_DATE);
    }

    @Test
    @Transactional
    public void getAllUsersByProfileCreatedDateIsLessThanSomething() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        // Get all the userList where profileCreatedDate less than or equals to DEFAULT_PROFILE_CREATED_DATE
        defaultUserShouldNotBeFound("profileCreatedDate.lessThan=" + DEFAULT_PROFILE_CREATED_DATE);

        // Get all the userList where profileCreatedDate less than or equals to UPDATED_PROFILE_CREATED_DATE
        defaultUserShouldBeFound("profileCreatedDate.lessThan=" + UPDATED_PROFILE_CREATED_DATE);
    }

    /**
     * Executes the search, and checks that the default entity is returned.
     */
    private void defaultUserShouldBeFound(String filter) throws Exception {
        restUserMockMvc.perform(get("/api/users?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$.[*].userId").value(hasItem(user.getUserId().toString())))
            .andExpect(jsonPath("$.[*].firstName").value(hasItem(DEFAULT_FIRST_NAME)))
            .andExpect(jsonPath("$.[*].lastName").value(hasItem(DEFAULT_LAST_NAME)))
            .andExpect(jsonPath("$.[*].userName").value(hasItem(DEFAULT_USER_NAME)))
            .andExpect(jsonPath("$.[*].mobileNumber").value(hasItem(DEFAULT_MOBILE_NUMBER)))
            .andExpect(jsonPath("$.[*].location").value(hasItem(DEFAULT_LOCATION)))
            .andExpect(jsonPath("$.[*].profileCreatedOn").value(hasItem(DEFAULT_PROFILE_CREATED_ON)))
            .andExpect(jsonPath("$.[*].profileCreatedBy").value(hasItem(DEFAULT_PROFILE_CREATED_BY)));

        // Check, that the count call also returns 1
        restUserMockMvc.perform(get("/api/users/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(content().string("1"));
    }

    /**
     * Executes the search, and checks that the default entity is not returned.
     */
    private void defaultUserShouldNotBeFound(String filter) throws Exception {
        restUserMockMvc.perform(get("/api/users?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(jsonPath("$").isArray())
            .andExpect(jsonPath("$").isEmpty());

        // Check, that the count call also returns 0
        restUserMockMvc.perform(get("/api/users/count?sort=id,desc&" + filter))
            .andExpect(status().isOk())
            .andExpect(content().contentType(MediaType.APPLICATION_JSON_UTF8_VALUE))
            .andExpect(content().string("0"));
    }


    @Test
    @Transactional
    public void getNonExistingUser() throws Exception {
        // Get the user
        restUserMockMvc.perform(get("/api/users/{id}", Long.MAX_VALUE))
            .andExpect(status().isNotFound());
    }

    @Test
    @Transactional
    public void updateUser() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        int databaseSizeBeforeUpdate = userRepository.findAll().size();

        // Update the user
        User updatedUser = userRepository.findById(user.getUserId()).get();
        // Disconnect from session so that the updates on updatedUser are not directly saved in db
        em.detach(updatedUser);
        updatedUser
            .firstName(UPDATED_FIRST_NAME)
            .lastName(UPDATED_LAST_NAME)
            .userName(UPDATED_USER_NAME)
            .mobileNumber(UPDATED_MOBILE_NUMBER)
            .location(UPDATED_LOCATION)
            .profileCreatedOn(UPDATED_PROFILE_CREATED_ON)
            .profileCreatedBy(UPDATED_PROFILE_CREATED_BY);
        UserDTO userDTO = userMapper.toDto(updatedUser);

        restUserMockMvc.perform(put("/api/users")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(userDTO)))
            .andExpect(status().isOk());

        // Validate the User in the database
        List<User> userList = userRepository.findAll();
        assertThat(userList).hasSize(databaseSizeBeforeUpdate);
        User testUser = userList.get(userList.size() - 1);
        assertThat(testUser.getFirstName()).isEqualTo(UPDATED_FIRST_NAME);
        assertThat(testUser.getLastName()).isEqualTo(UPDATED_LAST_NAME);
        assertThat(testUser.getUserName()).isEqualTo(UPDATED_USER_NAME);
        assertThat(testUser.getMobileNumber()).isEqualTo(UPDATED_MOBILE_NUMBER);
        assertThat(testUser.getLocation()).isEqualTo(UPDATED_LOCATION);
        assertThat(testUser.getProfileCreatedOn()).isEqualTo(UPDATED_PROFILE_CREATED_ON);
        assertThat(testUser.getProfileCreatedBy()).isEqualTo(UPDATED_PROFILE_CREATED_BY);
    }

    @Test
    @Transactional
    public void updateNonExistingUser() throws Exception {
        int databaseSizeBeforeUpdate = userRepository.findAll().size();

        // Create the User
        UserDTO userDTO = userMapper.toDto(user);

        // If the entity doesn't have an ID, it will throw BadRequestAlertException
        restUserMockMvc.perform(put("/api/users")
            .contentType(TestUtil.APPLICATION_JSON_UTF8)
            .content(TestUtil.convertObjectToJsonBytes(userDTO)))
            .andExpect(status().isBadRequest());

        // Validate the User in the database
        List<User> userList = userRepository.findAll();
        assertThat(userList).hasSize(databaseSizeBeforeUpdate);
    }

    @Test
    @Transactional
    public void deleteUser() throws Exception {
        // Initialize the database
        userRepository.saveAndFlush(user);

        int databaseSizeBeforeDelete = userRepository.findAll().size();

        // Delete the user
        restUserMockMvc.perform(delete("/api/users/{id}", user.getUserId())
            .accept(TestUtil.APPLICATION_JSON_UTF8))
            .andExpect(status().isNoContent());

        // Validate the database is empty
        List<User> userList = userRepository.findAll();
        assertThat(userList).hasSize(databaseSizeBeforeDelete - 1);
    }

    @Test
    @Transactional
    public void equalsVerifier() throws Exception {
        TestUtil.equalsVerifier(User.class);
        User user1 = new User();
        user1.setId(DEFAULT_USER_NAME);
        User user2 = new User();
        user2.setId(user1.getUserId());
        assertThat(user1).isEqualTo(user2);
        user2.setId(DEFAULT_USER_NAME);
        assertThat(user1).isNotEqualTo(user2);
        user1.setId(null);
        assertThat(user1).isNotEqualTo(user2);
    }

    @Test
    @Transactional
    public void dtoEqualsVerifier() throws Exception {
        TestUtil.equalsVerifier(UserDTO.class);
        UserDTO userDTO1 = new UserDTO();
        userDTO1.setUserId(DEFAULT_FIRST_NAME);
        UserDTO userDTO2 = new UserDTO();
        assertThat(userDTO1).isNotEqualTo(userDTO2);
        userDTO2.setUserId(userDTO1.getUserId());
        assertThat(userDTO1).isEqualTo(userDTO2);
        userDTO2.setUserId(DEFAULT_FIRST_NAME);
        assertThat(userDTO1).isNotEqualTo(userDTO2);
        userDTO1.setUserId(null);
        assertThat(userDTO1).isNotEqualTo(userDTO2);
    }

    @Test
    @Transactional
    public void testEntityFromId() {
        assertThat(userMapper.fromId(DEFAULT_FIRST_NAME).getUserId()).isEqualTo(42);
        assertThat(userMapper.fromId(null)).isNull();
    }
}
