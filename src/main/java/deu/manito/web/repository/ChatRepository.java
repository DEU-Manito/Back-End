package deu.manito.web.repository;

import deu.manito.web.entity.Chat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


/**
* @package : deu.manito.web.repository
* @name : ChatRepository.java
* @date : 2022-05-27 오후 9:05
* @author : Dong
**/
public interface ChatRepository extends JpaRepository<Chat, Long> {
    @Query(value =
            "SELECT *, " +
                    "( 6371 * acos( cos( radians(:lat)) * cos( radians(lat)) * cos( radians(lng) - radians(:lng) ) " +
                    "+ sin( radians(:lat)) * sin( radians(lat)))) " +
                    "AS distance " +
                    "FROM chat " +
            "HAVING distance <= 0.5", nativeQuery = true)
    List<Chat> findAllNearByChat(@Param("lat") Double lat, @Param("lng") Double lng);
}
