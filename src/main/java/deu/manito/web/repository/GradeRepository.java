package deu.manito.web.repository;


import deu.manito.web.entity.Grade;
import deu.manito.web.entity.UserLocation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface GradeRepository extends JpaRepository<Grade, Long> {
    @Query(value = "SELECT * FROM grade WHERE nickname = :nickname", nativeQuery = true)
    Optional<Grade> findByNickname(@Param("nickname") String nickname);

}
