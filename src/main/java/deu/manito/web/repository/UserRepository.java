package deu.manito.web.repository;

import deu.manito.web.entity.User;
import deu.manito.web.entity.UserLocation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, String> {
    @Query(value = "SELECT * FROM user WHERE nickname = :nickname", nativeQuery = true)
    Optional<User> findByNickname(@Param("nickname") String nickname);
}
