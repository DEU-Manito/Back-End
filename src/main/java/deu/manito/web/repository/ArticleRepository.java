package deu.manito.web.repository;

import deu.manito.web.entity.Chat;
import org.springframework.data.jpa.repository.JpaRepository;
import deu.manito.web.entity.Article;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ArticleRepository extends JpaRepository<Article, Long>{

    @Override
    @Query(value = "SELECT * FROM article ORDER BY id DESC", nativeQuery = true)
    List<Article> findAll();

    @Query(value =
            "SELECT *, " +
                    "( 6371 * acos( cos( radians(:lat)) * cos( radians(lat)) * cos( radians(lng) - radians(:lng) ) " +
                    "+ sin( radians(:lat)) * sin( radians(lat)))) " +
                    "AS distance " +
                    "FROM article " +
                    "HAVING distance <= 0.5", nativeQuery = true)
    List<Article> findAllNearByArticle(@Param("lat") Double lat, @Param("lng") Double lng);
}

