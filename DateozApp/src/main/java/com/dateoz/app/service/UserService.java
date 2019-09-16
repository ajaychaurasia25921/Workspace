package com.dateoz.app.service;

import com.dateoz.app.service.dto.UserDTO;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.Optional;

/**
 * Service Interface for managing {@link com.dateoz.app.domain.User}.
 */
public interface UserService {

    /**
     * Save a user.
     *
     * @param userDTO the entity to save.
     * @return the persisted entity.
     */
    UserDTO save(UserDTO userDTO);

    /**
     * Get all the users.
     *
     * @param pageable the pagination information.
     * @return the list of entities.
     */
    Page<UserDTO> findAll(Pageable pageable);


    /**
     * Get the "id" user.
     *
     * @param id the id of the entity.
     * @return the entity.
     */
    Optional<UserDTO> findOne(String id);

    /**
     * Delete the "id" user.
     *
     * @param id the id of the entity.
     */
    void delete(String id);

    UserDTO update(UserDTO userDTO);
}
