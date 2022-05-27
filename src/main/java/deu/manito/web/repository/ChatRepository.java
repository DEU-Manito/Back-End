package deu.manito.web.repository;

import deu.manito.web.entity.Chat;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ChatRepository extends JpaRepository<Chat, Long> {


    @Query(value =
            "SELECT count(*)" +
            "FROM (" +
            "SELECT " +
                "( 6371 * acos( cos( radians(:lat) ) " +
                    "* cos( radians(lat) ) * cos( radians(lng) - radians(:lng) ) " +
                    "+ sin( radians(:lat) ) * sin( radians(lng) ) ) )" +
                    " AS distance" +
            "FROM chat" +
            ") DATA WHERE DATA.distance < 1", nativeQuery = true)
    List<Chat> findAllNearByChat(Double lat, Double lng);
}
