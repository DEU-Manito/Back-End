package deu.manito.web.repository;

import deu.manito.web.dto.user.UserLocationAuthDto;
import deu.manito.web.entity.UserLocation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

/**
* @package : deu.manito.web.repository
* @name : UserLocationRepository.java
* @date : 2022-05-29 오전 4:11
* @author : Dong
**/
public interface UserLocationRepository extends JpaRepository<UserLocation, Long> {
    @Query(value = "SELECT * FROM user_location WHERE nickname = :nickname", nativeQuery = true)
    Optional<UserLocation> findByNickname(String nickname);
}
