package com.dateoz.app.repository;

import com.dateoz.app.domain.JiraApp;
import org.springframework.data.jpa.repository.*;
import org.springframework.stereotype.Repository;


/**
 * Spring Data  repository for the JiraApp entity.
 */
@SuppressWarnings("unused")
@Repository
public interface JiraAppRepository extends JpaRepository<JiraApp, Long>, JpaSpecificationExecutor<JiraApp> {

}
